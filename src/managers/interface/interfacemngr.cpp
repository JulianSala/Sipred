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
#include <QScreen>

#include <QDebug>

InterfaceMngrPrivate::InterfaceMngrPrivate(InterfaceMngr *q) :
    q_ptr(q), m_mainwindow(0)
{
}

InterfaceMngr::InterfaceMngr(QObject *parent) :
    QObject(parent), d_ptr(new InterfaceMngrPrivate(this))
{
}

InterfaceMngr::~InterfaceMngr()
{

}

void InterfaceMngrPrivate::loadMainwindow()
{
    QFile file("../share/mainwindow.ui");
    if (!file.open(QIODevice::ReadOnly)) {
        qWarning() << "Can't find mainwindow.ui";
        return;
    }

    QUiLoader uiLoader;

    m_mainwindow = qobject_cast<QMainWindow *>(uiLoader.load(&file));
    file.close();
}

void InterfaceMngrPrivate::loadDefaultWindow()
{
    QFile file(":/ui/mainwindow.ui");

    if (!file.open(QIODevice::ReadOnly)) {
        qWarning() << "Can't find mainwindow.ui";
        return;
    }

    QUiLoader loader;

    m_mainwindow = qobject_cast<QMainWindow *>(loader.load(&file));

    file.close();

    if (!m_mainwindow)
        qFatal("Can't open default window.");

    QIcon icon(":/logo/logo_sipred");
    m_mainwindow->setWindowIcon(icon);
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

    if (!d->m_mainwindow)
        d->loadDefaultWindow();

    d->centerWindow();
    d->m_mainwindow->show();
}

void InterfaceMngr::endInterface()
{

}

void InterfaceMngrPrivate::loadDefaultDock()
{

}

void InterfaceMngrPrivate::loadDefaultCenterWidget()
{

}

void InterfaceMngrPrivate::centerWindow()
{
    QSize dSize = qApp->desktop()->size();

    qint32 w = dSize.width();
    qint32 h = dSize.height();

    w *= 0.7;
    h *= 0.7;

    QSize newSize(w, h);

    m_mainwindow->setGeometry(QStyle::alignedRect(Qt::LeftToRight,
                                                  Qt::AlignCenter,
                                                  newSize,
                                                  qApp->desktop()->availableGeometry()));
}
