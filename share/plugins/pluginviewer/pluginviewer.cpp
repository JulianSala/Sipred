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
#include "pluginmngr.h"
#include <QAbstractItemModel>

PluginViewer::PluginViewer(QObject *parent) :
    QObject(parent)
{
    m_menu = NULL;
    m_dialog = NULL;
    m_model = NULL;
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
    return QString("1.0.6");
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
    QIcon icon(":/icons/e_pluginviewer.png");

    if (icon.isNull())
        return QIcon();

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
        m_menu = new QMenu("&Plugins");
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
    pluginManager = pm;
}

bool PluginViewer::start()
{
    if (!m_dialog)
        loadDialog();

    m_model = new QStandardItemModel(this);

    retrieveInformation();
    QTreeView *view = m_dialog->findChild<QTreeView *>();
    view->setModel(m_model);

    connect(pluginManager, SIGNAL(pluginConfigurationChange()),
            this, SLOT(retrieveInformation()));

    retrieveInformation();

    return true;
}

bool PluginViewer::stop()
{
    return false;
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
    QFile file(":/ui/pluginviewer.ui");
    if (!file.open(QIODevice::ReadOnly)) {
        qWarning() << "Can't open plugin viewer dialog:"
                   << file.errorString();
        return;
    }

    QUiLoader loader;
    m_dialog = qobject_cast<QDialog *>(loader.load(&file));

    if (!m_dialog)
        qWarning() << "Can't load plugin viewer dialog";

    file.close();
}

void PluginViewer::retrieveInformation()
{
    m_model->clear();

    QStringList header;
    header << "Plugin" << "Información";
    m_model->setHorizontalHeaderLabels(header);

    QStandardItem *item = m_model->invisibleRootItem();

    foreach (QString pluginId, pluginManager->avaliablePlugins()) {
        QList<QStandardItem *> row;
        QList<QStandardItem *> info;
        QList<QStandardItem *> value;

        PluginInfo pluginInfo = pluginManager->pluginInfo(pluginId);
        row << new QStandardItem(pluginInfo.name());

        info << new QStandardItem("Nombre");
        info << new QStandardItem("Id");
        info << new QStandardItem("Version");
        info << new QStandardItem("Categoria");
        info << new QStandardItem("Autor");
        info << new QStandardItem("e-mail");
        info << new QStandardItem("Webside");
        info << new QStandardItem("Licencia");
        info << new QStandardItem("Icono");

        value << new QStandardItem(pluginInfo.name());
        value << new QStandardItem(pluginInfo.id());
        value << new QStandardItem(pluginInfo.version());
        value << new QStandardItem(pluginInfo.category());
        value << new QStandardItem(pluginInfo.author());
        value << new QStandardItem(pluginInfo.mail());
        value << new QStandardItem(pluginInfo.webside());
        value << new QStandardItem(pluginInfo.licence());
        value << new QStandardItem(pluginInfo.icon(), QString());

<<<<<<< HEAD
        foreach (QStandardItem *i, info) {
            i->setFlags(i->flags() & ~Qt::ItemIsEditable);
        }

        foreach (QStandardItem *i, value) {
            i->setFlags(i->flags() & ~Qt::ItemIsEditable);
        }

=======
>>>>>>> b40a6fbe4ba0319e90aca0b4a72d35d0fbd4eba7
        row.first()->appendColumn(info);
        row.last()->appendColumn(value);
        item->appendRow(row);
    }
}
