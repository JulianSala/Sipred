/****************************************************************************
**
**  Copyright   : (C) 2012 Dismet S.A.S.
**              : Julian Salamanca Espinosa
**  e-mail      : julian.sse@gmail.com
**
*****************************************************************************
**
**  pluginviewer.cpp is part of Sipred.
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

#include "pluginviewer.h"

#include <QtGui>
#include <QDebug>
#include <QtUiTools>

PluginViewer::PluginViewer(QObject *parent) :
    QObject(parent)
{
    m_menu = NULL;
}

PluginViewer::~PluginViewer()
{
    if (m_menu)
        delete m_menu;
}

QString PluginViewer::id() const
{
    return QString("PluginViewer");
}

QString PluginViewer::name() const
{
    return QString("Plugin Viewer");
}

QString PluginViewer::version() const
{
    return QString("1.0.0");
}

QString PluginViewer::summary() const
{
    return QString("Load all plugin information in readable format.");
}

QString PluginViewer::category() const
{
    return QString("data.Viewer");
}

QString PluginViewer::applyTo() const
{
    return QString();
}

QString PluginViewer::author() const
{
    return QString("Julian Salamanca E.");
}

QString PluginViewer::mail() const
{
    return QString("julian.sse@gmail.com");
}

QString PluginViewer::webside() const
{
    return QString("https://github.com/thanatosJSSE/Sipred");
}

QString PluginViewer::licence() const
{
    return QString("LGPLv3");
}

QIcon PluginViewer::icon() const
{
    QIcon icon(":/icons/dart_3.png");

    return icon;
}

bool PluginViewer::isConfigurable() const
{
    return false;
}

QWidget* PluginViewer::configDialog() const
{
    return NULL;
}

QHash<QString, QVariant> PluginViewer::defaultConfig() const
{
    QHash<QString, QVariant> config;

    return config;
}

bool PluginViewer::setConfigs(QVariant val)
{
    Q_UNUSED(val);

    return false;
}

QStringList PluginViewer::configList() const
{
    return QStringList();
}

QMenu* PluginViewer::menu()
{
    if (!m_menu) {
        m_menu = new QMenu("Plugins");
        m_menu->addSeparator();
        m_menu->addAction(icon(), "Plugin Viewer",
                          this, SLOT(launchDialog()));
    }

    return m_menu;
}

QDialog *PluginViewer::dialog()
{
    if (!m_dialog)
        loadDialog();

    return m_dialog;
}

void PluginViewer::registerPluginManager(PluginMngr *pm)
{

}

void PluginViewer::launchDialog()
{
    if (!m_dialog)
        loadDialog();

    if (!m_dialog)
        return;

    m_dialog->exec();
}

void PluginViewer::loadDialog()
{
    QFile file(":/ui/dialog");
    if (!file.open(QIODevice::ReadOnly)) {
        qWarning() << "Can't open plugin viewer dialog:"
                   << file.errorString();
        return;
    }

    QUiLoader loader;
    m_dialog = qobject_cast<QDialog *>(loader.load(&file));

    file.close();
}


