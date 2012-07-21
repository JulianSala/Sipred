/****************************************************************************
**
**  Copyright   : (C) 2012 Dismet S.A.S.
**              : Julian Salamanca Espinosa
**  e-mail      : julian.sse@gmail.com
**
*****************************************************************************
**
**  interfacemngr.cpp is part of Sipred.
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

#include "interfacemngr.h"
#include "interfacemngr_p.h"

#include <QtUiTools>

#include <QDebug>

InterfaceMngrPrivate::InterfaceMngrPrivate(InterfaceMngr *q) :
    q_ptr(q)
{
}

InterfaceMngr::InterfaceMngr(QObject *parent) :
    QObject(parent), d_ptr(new InterfaceMngrPrivate(this))
{
}

void InterfaceMngrPrivate::loadMainwindow()
{
    QUiLoader uiLoader;

    QFile file("../share/mainwindow.ui");
    if (!file.open(QIODevice::ReadOnly))
        return;

    m_mainwindow = qobject_cast<QMainWindow *>(uiLoader.load(&file));
    file.close();

    m_mainwindow->show();
}

void InterfaceMngr::registerModuleManager(ModuleMngr *moduleMngr)
{
    Q_D(InterfaceMngr);

    d->m_moduleManager = moduleMngr;
}

void InterfaceMngr::registerPluginManager(PluginMngr *pluginMngr)
{
    Q_D(InterfaceMngr);

    d->m_pluginManager = pluginMngr;
}

void InterfaceMngr::initInterface()
{
    Q_D(InterfaceMngr);

    d->loadMainwindow();
}

void InterfaceMngr::endInterface()
{

}
