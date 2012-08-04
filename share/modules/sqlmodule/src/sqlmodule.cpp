/****************************************************************************
**
**  Copyright   : (C) 2012 Dismet S.A.S.
**              : Julian Salamanca Espinosa
**  e-mail      : julian.sse@gmail.com
**
*****************************************************************************
**
**  sqlmodule.cpp is part of Sipred.
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

#include "../include/sqlmodule.h"
#include <modulemngr.h>

SqlModule::SqlModule(QObject *parent) :
    QObject(parent)
{
    m_configDialog = NULL;
    m_centralWidget = NULL;
    m_controlsWidget = NULL;
    m_additionalWidget = NULL;
    m_menuAction = NULL;
}

SqlModule::~SqlModule()
{

}

QString SqlModule::id() const
{
    return QString("SqlModule");
}

QString SqlModule::name() const
{
    return QString("Sql Module");
}

QString SqlModule::version() const
{
    return QString("3.0.0");
}

QString SqlModule::summary() const
{
    return QString("Management all mysql connections.");
}

QString SqlModule::category() const
{
    return QString("SQL");
}

QString SqlModule::author() const
{
    return QString("Julian Salamanca E.");
}

QString SqlModule::mail() const
{
    return QString("julian.sse@gmail.com");
}

QString SqlModule::webside() const
{
    return QString("https://github.com/thanatosJSSE/Sipred");
}

QString SqlModule::license() const
{
    return QString("GPLv3");
}

QIcon SqlModule::icon() const
{
    return QIcon();
}

Module::ModuleType SqlModule::type() const
{
    return Module::ModuleTypeSql;
}

QVariant SqlModule::dependences() const
{
    return QVariant();
}

//QString SqlModule::instance() const
//{
//    return QString();
//}

bool SqlModule::configurable() const
{
    return true;
}

QWidget* SqlModule::configDialog() const
{
    return NULL;
}

QHash<QString, QVariant> SqlModule::defaultConfig() const
{
    return m_config;
}

bool SqlModule::setConfig(QVariant)
{
    return true;
}

bool SqlModule::setConfigs(QVariant)
{
    return true;
}

QAction *SqlModule::menu() const
{
    return m_menuAction;
}

QWidget* SqlModule::centralWidget() const
{
    return m_centralWidget;
}

QWidget* SqlModule::controlsWidget() const
{
    return m_controlsWidget;
}

QWidget* SqlModule::additionalWidget() const
{
    return m_additionalWidget;
}

void SqlModule::registerModuleManager(ModuleMngr *modMngr)
{
    m_moduleManger = modMngr;
    connect(m_moduleManger, SIGNAL(destroyed()),
            this, SLOT(stop()));
}

bool SqlModule::start()
{
    m_menuAction = new QAction("SQL", this);
    return true;
}

bool SqlModule::stop()
{
    return true;
}
