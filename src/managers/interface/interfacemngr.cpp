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

#include "pluginmngr.h"
#include "modulemngr.h"

#include <QtUiTools>
#include <QScreen>

#include <QDebug>

InterfaceMngr::InterfaceMngr(QObject *parent) :
    QObject(parent), d_ptr(new InterfaceMngrPrivate(this))
{
}

InterfaceMngr::~InterfaceMngr()
{

}

void InterfaceMngr::createConnections()
{
}

void InterfaceMngr::registerModuleManager(ModuleMngr *moduleMngr)
{
    Q_D(InterfaceMngr);

    d->m_moduleManager = moduleMngr;

    qDebug() << d->m_moduleManager->avaliableModules();
}

void InterfaceMngr::registerPluginManager(PluginMngr *pluginMngr)
{
    Q_D(InterfaceMngr);

    d->m_pluginManager = pluginMngr;

    foreach (QString pluginId, d->m_pluginManager->avaliablePlugins()) {
        Plugin *p = d->m_pluginManager->plugin(pluginId);
        d->m_mainwindow->menuBar()->addMenu(p->menu());
    }
}

void InterfaceMngr::initInterface()
{
    Q_D(InterfaceMngr);

    d->loadMainwindow();

    if (!d->m_mainwindow)
        d->setDefaultWindow();

    d->centerWindow();

    d->loadDockWidget();

    if (!d->m_dockWidget)
        d->setDefaultDock();

    d->m_mainwindow->addDockWidget(Qt::LeftDockWidgetArea, d->m_dockWidget);

    d->initializeMenus();

    d->m_mainwindow->show();
}

void InterfaceMngr::endInterface()
{

}

void InterfaceMngr::newProject()
{

}

bool InterfaceMngr::openProject()
{

}

bool InterfaceMngr::saveProject()
{

}

bool InterfaceMngr::saveAsProject()
{

}

void InterfaceMngr::quitApp()
{

}

/****************************************************************************
 *                          InterfaceMngrPrivate
 ***************************************************************************/

InterfaceMngrPrivate::InterfaceMngrPrivate(InterfaceMngr *q) :
    q_ptr(q), m_mainwindow(0)
{
    m_mainwindow = NULL;
    m_moduleManager = NULL;
    m_pluginManager = NULL;
    m_menuBar = NULL;
    m_toolBar = NULL;
    m_centralWidget = NULL;
    m_dockWidget = NULL;
    m_treeInformation = NULL;
}

void InterfaceMngrPrivate::loadMainwindow()
{
    QFile file("../share/mainwindow.ui");
    if (!file.open(QIODevice::ReadOnly)) {
        qWarning() << "Can't open mainwindow.ui";
        qWarning() << file.errorString();
        return;
    }

    QUiLoader uiLoader;

    m_mainwindow = qobject_cast<QMainWindow *>(uiLoader.load(&file));

    file.close();

    if (!m_mainwindow)
        qWarning() << "Can't load mainwindow.ui";
}

void InterfaceMngrPrivate::loadDockWidget()
{
    QFile file("../share/dockwidget.ui");

    if (!file.open(QIODevice::ReadOnly)) {
        qWarning() << "Can't open dockwidget.ui";
        qWarning() << file.errorString();
        return;
    }

    QUiLoader loader;

    m_dockWidget = qobject_cast<QDockWidget *>(loader.load(&file));

    file.close();

    if (!m_dockWidget)
        qWarning() << "Can't load dockwidget.ui";
}

void InterfaceMngrPrivate::setDefaultWindow()
{
    QFile file(":/ui/mainwindow");

    if (!file.open(QIODevice::ReadOnly)) {
        qWarning(file.errorString().toLatin1());
        qFatal("Can't open default mainwindow.ui");
    }

    QUiLoader loader;

    m_mainwindow = qobject_cast<QMainWindow *>(loader.load(&file));

    file.close();

    if (!m_mainwindow) {
        qWarning() << file.errorString().toLatin1();
        qFatal("Can't load default mainwindow.");
    }

    QIcon icon(":/logo/logo_sipred");
    m_mainwindow->setWindowIcon(icon);
}

void InterfaceMngrPrivate::setDefaultDock()
{
    QFile file(":/ui/dockwidget");

    if (!file.open(QIODevice::ReadOnly))
        qFatal("Can't open default dockwidget.ui");

    QUiLoader loader;

    m_dockWidget = qobject_cast<QDockWidget *>(loader.load(&file, m_mainwindow));

    if (!m_dockWidget)
        qFatal("Can't load default dockwidget");

    m_dockWidget->setWindowTitle("Herramientas");
}

void InterfaceMngrPrivate::setDefaultCenterWidget()
{

}

void InterfaceMngrPrivate::setDefaultConfigWidget()
{
    QFile file(":/ui/configwidget");

    if (!file.open(QIODevice::ReadOnly))
        qFatal("Can't open default configwidget.ui");

    QUiLoader loader;
    m_configWidget = qobject_cast<QWidget *>(loader.load(&file, m_mainwindow));

    if (!m_configWidget)
        qFatal("Can't load default configwidget");
}

void InterfaceMngrPrivate::initializeMenus()
{
    Q_Q(InterfaceMngr);

    if (!m_mainwindow)
        qFatal("Can't init actions, Mainwindow is not found");

    QList<QAction *> actionList;

    m_newAction = new QAction(m_mainwindow);
    m_newAction->setText("&Nuevo");
    m_newAction->setShortcut(QKeySequence::New);
    m_newAction->setToolTip("Crear un nuevo proyecto desde el gestor.");
    m_newAction->setStatusTip("Crear nuevo proyecto");

    QObject::connect(m_newAction, SIGNAL(triggered()), q, SLOT(newProject()));
    actionList.append(m_newAction);

    m_openAction = new QAction(m_mainwindow);
    m_openAction->setText("&Abrir");
    m_openAction->setShortcut(QKeySequence::Open);
    m_openAction->setToolTip("Abrir archivo soportado");
    m_openAction->setStatusTip("Abriendo archivo...");

    QObject::connect(m_openAction, SIGNAL(triggered()), q, SLOT(openProject()));
    actionList.append(m_openAction);

    m_saveAction = new QAction(m_mainwindow);
    m_saveAction->setText("&Guardar");
    m_saveAction->setShortcut(QKeySequence::Save);
    m_saveAction->setToolTip("Guardar el actual proyecto");
    m_saveAction->setStatusTip("Guardando archivo...");

    QObject::connect(m_saveAction, SIGNAL(triggered()), q, SLOT(saveProject()));
    actionList.append(m_saveAction);

    m_saveAsAction = new QAction(m_mainwindow);
    m_saveAsAction->setText("Guardar como");
    m_saveAsAction->setShortcut(QKeySequence::SaveAs);
    m_saveAsAction->setStatusTip("Guardando el proyecto como...");

    QObject::connect(m_saveAsAction, SIGNAL(triggered()), q, SLOT(saveAsProject()));
    actionList.append(m_saveAsAction);

    m_quitAction = new QAction(m_mainwindow);
    m_quitAction->setText("&Salir");
    m_quitAction->setShortcut(QKeySequence::Quit);
    m_quitAction->setToolTip("Salir de la aplicación");
    m_quitAction->setStatusTip("Salir");

    QObject::connect(m_quitAction, SIGNAL(triggered()), q, SLOT(quitApp()));

    QMenu *m_fileMenu = m_mainwindow->menuBar()->addMenu("&Archivo");
    m_fileMenu->addActions(actionList);
    m_fileMenu->addSeparator();
    m_fileMenu->addAction(m_quitAction);
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
