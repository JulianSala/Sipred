/****************************************************************************
**
**  Copyright   : (C) 2012 Dismet S.A.S.
**              : Julian Salamanca Espinosa
**  e-mail      : julian.sse@gmail.com
**
*****************************************************************************
**
**  core.cpp is part of Sipred.
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

#include "core.h"
#include "plugin.h"

#include <QtUiTools>
#include <QtGui>
#include <QDebug>

Core::Core(QObject *parent) :
    QObject(parent)
{
    configure();
}

Core::~Core()
{
}

void Core::initVariables()
{
    m_interfaceManager = new InterfaceMngr(this);
    m_moduleManager = new ModuleMngr(this);
    m_pluginManager = new PluginMngr(this);

}

void Core::configure()
{
    initVariables();
}

void Core::run()
{
    m_interfaceManager->initInterface();
    m_interfaceManager->registerPluginManager(m_pluginManager);

}

void Core::unregisterResources()
{
    QDir resourcesDir(RESOURCES_PATH);

    QStringList filter;
    filter << "*.rcc" << "*.sip";
    resourcesDir.setNameFilters(filter);

    qDebug() << "Unregistering resources...";
    foreach (QString file, resourcesDir.entryList(QDir::Files)) {
        if (!QResource::unregisterResource(resourcesDir.filePath(file)))
            qWarning() << "Can't unregister resource file" << file;
        else
            qDebug() << "Resource file" << file << "have been unregister";
    }
}
