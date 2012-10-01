/****************************************************************************
**
**  Copyright   : (C) 2012 Dismet S.A.S.
**              : Julian Salamanca Espinosa
**  e-mail      : julian.sse@gmail.com
**
*****************************************************************************
**
**  librarymodule.cpp is part of Sipred.
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

#include "../include/librarymodule.h"
#include <modulemngr.h>

LibraryModule::LibraryModule(QObject *parent) :
    QObject(parent)
{
    m_moduleManager = NULL;
    m_centralWidget = NULL;
}

LibraryModule::~LibraryModule()
{

}

QString LibraryModule::id() const
{
    return QString("LibraryModule");
}

QString LibraryModule::name() const
{
    return QString("Libreria");
}

QString LibraryModule::version() const
{
    return QString("2.1.0");
}

QString LibraryModule::summary() const
{
    return QString("Management all database data like a library.");
}

QString LibraryModule::category() const
{
    return QString("SQL");
}

QString LibraryModule::author() const
{
    return QString("Edwin Vasquez Torres");
}

QString LibraryModule::mail() const
{
    return QString("edwincart@hotmail.com");
}

QString LibraryModule::webside() const
{
    return QString("https://github.com/thanatosJSSE/Sipred");
}

QString LibraryModule::license() const
{
    return QString("GPLv3");
}

QIcon LibraryModule::icon() const
{
    return QIcon(":/icons/e_librarymodule.png");
}

Module::ModuleType LibraryModule::type() const
{
    return Module::ModuleTypeSql;
}

QVariant LibraryModule::dependences() const
{
    return QStringList();
}

bool LibraryModule::configurable() const
{
    return true;
}

QWidget* LibraryModule::configDialog() const
{
    return NULL;
}

QHash<QString, QVariant> LibraryModule::defaultConfig() const
{
    QHash<QString, QVariant> hash;
    return hash;
}

bool LibraryModule::setConfig(const QVariant &value)
{
    Q_UNUSED(value)
    return true;
}

QMenu *LibraryModule::menu() const
{
    return NULL;
}

QWidget* LibraryModule::centralWidget() const
{
    return m_centralWidget->widget();
}

QWidget* LibraryModule::controlsWidget() const
{
    return NULL;
}

QWidget* LibraryModule::additionalWidget() const
{
    return NULL;
}

void LibraryModule::registerModuleManager(ModuleMngr *modMngr)
{
    m_moduleManager = modMngr;
    connect(m_moduleManager, SIGNAL(destroyed()),
            this, SLOT(stop()));
}

bool LibraryModule::start()
{
    m_centralWidget = new CentralWidget(":/ui/librarymodule_central.ui", this);

    return true;
}

bool LibraryModule::stop()
{
    return true;
}

void LibraryModule::applyConfig()
{
}
