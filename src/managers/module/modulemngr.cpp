/****************************************************************************
**
**  Copyright   : (C) 2012 Dismet S.A.S.
**              : Julian Salamanca Espinosa
**  e-mail      : julian.sse@gmail.com
**
*****************************************************************************
**
**  modulemngr.cpp is part of Sipred.
**
**    Sipred is free software: you can redistribute it and/or modify
**    it under the terms of the GNU General Public License as published by
**    the Free Software Foundation, either version 3 of the License, or
**    (at your option) any later version.
**
**    Sipred is distributed in the hope that it will be useful,
**    but WITHOUT ANY WARRANTY; without even the implied warranty of
**    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
**    GNU General Public License for more details.
**
**    You should have received a copy of the GNU General Public License
**    along with Sipred. If not, see <http://www.gnu.org/licenses/>.
**
****************************************************************************/

#include "modulemngr.h"
#include "modulemngr_p.h"
#include "moduleinfo.h"
#include "sequencer.h"

#include <QStringListIterator>
#include <QDebug>

ModuleMngr::ModuleMngr(QObject *parent) :
    QObject(parent), d_ptr(new ModuleMngrPrivate(this))
{
    connect(this, SIGNAL(configChange()), this, SLOT(saveModuleConfig()));
}

ModuleMngr::~ModuleMngr()
{
    Q_D(ModuleMngr);

    foreach (QString moduleId, d->m_activeModules.keys()) {
        d->unloadModule(moduleId);
    }
}

bool ModuleMngr::activeModule(const QString &moduleId)
{
    Q_UNUSED(moduleId)

    return true;
}

bool ModuleMngr::disableModule(const QString &moduleId)
{
    Q_UNUSED(moduleId)

    return true;
}

QStringList ModuleMngr::avaliableModules()
{
    Q_D(ModuleMngr);

    QStringList list = d->m_modulesInfo.keys();

    return list;
}

QStringList ModuleMngr::avaliableModules(const Module::ModuleType &type)
{
    Q_D(ModuleMngr);

    QStringList list;

    foreach (QString moduleId, d->m_modulesInfo.keys()) {
        if (d->m_modulesInfo.value(moduleId).type() == type)
            list.append(moduleId);
    }

    return list;
}

Module *ModuleMngr::module(const QString &moduleId)
{
    Q_D(ModuleMngr);

    if (d->m_activeModules.contains(moduleId))
        return d->m_activeModules.value(moduleId);

    if (!d->m_modulesInfo.contains(moduleId)) {
        qWarning() << "Requested module id:" << moduleId << endl
                   << "is not avaliable.";
        return NULL;
    }

    if (d->loadModule(moduleId))
        return d->m_activeModules.value(moduleId);

    return NULL;
}

void ModuleMngr::saveModuleConfig()
{
    Q_D(ModuleMngr);

    QSettings settings;

    settings.setValue("modulesConfig", QVariant(d->m_modulesConfig));
}

/****************************************************************************
 *                           ModuleMngrPrivate
 ***************************************************************************/

ModuleMngrPrivate::ModuleMngrPrivate(ModuleMngr *q) :
    q_ptr(q)
{
    QSettings settings;
    m_modulesConfig = settings.value("modulesConfig").toHash();

    this->initModuleManager();
    this->loadModules();
}

ModuleMngrPrivate::~ModuleMngrPrivate()
{

}

void ModuleMngrPrivate::initModuleManager()
{
    Q_Q(ModuleMngr);

    this->setModulesPath("../lib/modules");

    m_startSecuence = new Sequencer(q);
}

void ModuleMngrPrivate::loadModules()
{
    qDebug() << "Loading modules...";

    foreach (QString moduleDir, m_modulesDir.entryList(QDir::Dirs | QDir::NoDotAndDotDot)) {
        m_modulesDir.cd(moduleDir);

        foreach (QString fileName, m_modulesDir.entryList(QDir::Files)) {
            if (!QLibrary::isLibrary(fileName))
                continue;

            QString filePath = m_modulesDir.absoluteFilePath(fileName);

            m_loader.setFileName(filePath);

            QObject *moduleInstance = m_loader.instance();
            if (!moduleInstance)
                continue;

            qDebug() << fileName;

            ModuleFactory *moduleFactory = qobject_cast<ModuleFactory *>(moduleInstance);

            if (!moduleFactory)
                continue;

            Module *module = moduleFactory->module();

            if (!module)
                continue;

            this->setStartSecuence(module);
            this->registerModule(module, m_modulesDir.absoluteFilePath(fileName));

            m_loader.unload();
        }

        m_modulesDir.cdUp();
    }
}

bool ModuleMngrPrivate::setModulesPath(const QString &path)
{
    QDir dir(path);

    if (!dir.exists()) {
        qWarning() << "Module path" << path << "doesn't exist";
        return false;
    }

    if (dir.isRelative())
        qDebug() << "Set a relative path:" << path;

    m_modulesDir.setPath(path);

    return true;
}

void ModuleMngrPrivate::registerModule(Module *module, const QString &fileName)
{
    if (m_modulesInfo.contains(module->id())) {
        qWarning() << "Module ID:" << module->id() << "already exist";
        return;
    }

    ModuleInfo info;
    info.setId(module->id());
    info.setFileName(fileName);
    info.setName(module->name());
    info.setVersion(module->version());
    info.setSummary(module->summary());
    info.setCategory(module->category());
    info.setAuthor(module->author());
    info.setMail(module->mail());
    info.setWebside(module->webside());
    info.setLicence(module->license());
    info.setIcon(module->icon());
    info.setDependences(module->dependences());
//    info.setInstance(module->instance());
    info.setConfigurable(module->configurable());
    info.setType(module->type());

    if (!m_modulesConfig.contains(info.id()) && info.isConfigurable())
        m_modulesConfig.insert(info.id(), module->defaultConfig());

    m_modulesInfo.insert(info.id(), info);

    qDebug() << "Register module:";
//    qDebug() << info;
}

bool ModuleMngrPrivate::resolveDependences(const Module *module) const
{
    QStringList depList = module->dependences().toStringList();

    QStringListIterator i(depList);

    while (i.hasNext()) {
        if (!m_modulesInfo.contains(i.next())) {
            qWarning() << "Can't resolve dependences for module"
                       << module->id();
            return false;
        }
    }

    return true;
}

void ModuleMngrPrivate::setStartSecuence(const Module *module)
{
    m_startSecuence->insertSequence(module->id(),
                                    module->dependences().toStringList());
}

bool ModuleMngrPrivate::loadModule(const QString &moduleId)
{
    Q_Q(ModuleMngr);

    if (!m_modulesInfo.contains(moduleId)) {
        qWarning() << "Requested module id:" << moduleId << endl
                   << "is not avaliable";
        return false;
    }

    if (m_activeModules.contains(moduleId)) {
        qWarning() << "Requested module id:" << moduleId << endl
                   << "is already loaded.";
        return false;
    }

    m_loader.setFileName(m_modulesInfo.value(moduleId).fileName());

    QObject *moduleInstance = m_loader.instance();

    if (!moduleInstance)
        return false;

    ModuleFactory *moduleFactory = qobject_cast<ModuleFactory *>(moduleInstance);

    if (!moduleInstance)
        return false;

    Module *module = moduleFactory->module();

    if (!module)
        return false;

//    resolveDependences(module);
    module->registerModuleManager(q);
    module->start();

    if (m_modulesConfig.contains(moduleId))
        module->setConfig(m_modulesConfig.value(moduleId));

    m_activeModules.insert(moduleId, module);

    emit q->moduleLoaded();
    emit q->moduleLoaded(moduleId);
    emit q->configChange();

    return true;
}

bool ModuleMngrPrivate::unloadModule(const QString &moduleId)
{
    if (!m_activeModules.contains(moduleId)) {
        qWarning() << "Requested module id:" << moduleId
                   << "is not loaded.";
        return false;
    }

    m_activeModules.value(moduleId)->stop();
//    delete m_activeModules.value(moduleId);
    m_activeModules.remove(moduleId);

    m_loader.setFileName(m_modulesInfo.value(moduleId).fileName());

    if (!m_loader.unload()) {
        qWarning() << "Can't unload module id:" << moduleId << endl
                   << m_loader.errorString();
        return false;
    }

    return true;
}
