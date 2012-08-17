/****************************************************************************
**
**  Copyright   : (C) 2012 Dismet S.A.S.
**              : Julian Salamanca Espinosa
**  e-mail      : julian.sse@gmail.com
**
*****************************************************************************
**
**  configmodule.cpp is part of Sipred.
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

#include "../include/configmodule.h"
#include "modulemngr.h"

#include <QtUiTools>
#include <QDebug>

ConfigModule::ConfigModule(QObject *parent) :
    QObject(parent)
{
}

ConfigModule::~ConfigModule()
{
    stop();
}

QString ConfigModule::id() const
{
    return QString("core.configModule");
}

QString ConfigModule::name() const
{
    return QString("Config Module");
}

QString ConfigModule::version() const
{
    return QString("2.1.0");
}

QString ConfigModule::summary() const
{
    return QString("Mangement all modules configuration.");
}

QString ConfigModule::category() const
{
    return QString("core.configuration");
}

QString ConfigModule::author() const
{
    return QString("Julian Salamanca E.");
}

QString ConfigModule::mail() const
{
    return QString("julian.sse@gmail.com");
}

QString ConfigModule::webside() const
{
    return QString("https://github.com/thanatosJSSE/Sipred");
}

QString ConfigModule::license() const
{
    return QString("GPLv3");
}

QIcon ConfigModule::icon() const
{
    return QIcon();
}

Module::ModuleType ConfigModule::type() const
{
    return Module::ModuleTypeCore;
}

QVariant ConfigModule::dependences() const
{
    return QVariant();
}

bool ConfigModule::configurable() const
{
    return false;
}

QWidget *ConfigModule::configDialog() const
{
    return NULL;
}

QHash<QString, QVariant> ConfigModule::defaultConfig() const
{
    QHash<QString, QVariant> conf;

    return conf;
}

bool ConfigModule::setConfig(QVariant /*value*/)
{

    return true;
}

bool ConfigModule::setConfigs(QVariant /*values*/)
{
    return true;
}

QMenu *ConfigModule::menu() const
{
    return m_menu;
}

QWidget* ConfigModule::centralWidget() const
{
    return NULL;
}

QWidget* ConfigModule::controlsWidget() const
{
    return NULL;
}

QWidget* ConfigModule::additionalWidget() const
{
    return NULL;
}

void ConfigModule::registerModuleManager(ModuleMngr *moduleMngr)
{
    m_moduleMngr = moduleMngr;
}

bool ConfigModule::start()
{
    m_signalMapper = new QSignalMapper(this);

    if (!loadDialog())
        return false;

    initMenu();

    return true;
}

bool ConfigModule::stop()
{
    return true;
}

void ConfigModule::currentDialogChange(const QModelIndex &index)
{
    QListView *listView = m_widget->findChild<QListView *>();
    if (!listView)
        return;

    QStandardItemModel *model = qobject_cast<QStandardItemModel *>(listView->model());
    QStandardItem *item = model->itemFromIndex(index);

    QStackedWidget *stacked = m_widget->findChild<QStackedWidget *>();
    if (!stacked)
        return;

    stacked->setCurrentIndex(item->row());

    QLabel *label = m_widget->findChild<QLabel *>();
    if (!label)
        return;

    label->setText(item->text());
}

void ConfigModule::loadConfigDialogs()
{
    QStackedWidget *stacked = m_widget->findChild<QStackedWidget *>();
    if (!stacked)
        return;

    QListView *listView = m_widget->findChild<QListView *>();
    if (!listView)
        return;

    foreach (QString id, m_moduleMngr->avaliableModules()) {
        Module *module = m_moduleMngr->module(id);
        if (module->configDialog()) {
            stacked->addWidget(module->configDialog());
            QStandardItemModel *model = qobject_cast<QStandardItemModel *>(listView->model());
            QStandardItem *item = new QStandardItem(module->icon(), module->name());
            item->setFlags(item->flags() & ~Qt::ItemIsEditable);
            model->appendRow(item);

//            connect(listView, SIGNAL(activated(QModelIndex)), m_signalMapper, SLOT(map()));
//            m_signalMapper->setMapping(listView, );
        }
    }

    listView->setCurrentIndex(listView->model()->index(0, 0));
    currentDialogChange(listView->currentIndex());
}

void ConfigModule::okButtonClicked()
{
    foreach (QString id, m_moduleMngr->avaliableModules())
        m_moduleMngr->module(id)->applyConfig();
}

void ConfigModule::applyButtonClicked()
{
    foreach (QString id, m_moduleMngr->avaliableModules())
        m_moduleMngr->module(id)->applyConfig();
}

void ConfigModule::cancelButtonClucked()
{

}

bool ConfigModule::loadDialog()
{
    QFile file(":/ui/configmodule_widget.ui");

    if (!file.open(QIODevice::ReadOnly)) {
        qWarning() << "Can't open config dialog." << endl
                   << file.errorString();
        return false;
    }

    QUiLoader loader;
    m_widget = loader.load(&file);

    if (!m_widget) {
        qWarning() << "Can't load config dialog.";
        return false;
    }

    m_widget->setWindowTitle("Configuración General");
    m_widget->setWindowModality(Qt::WindowModal);

    QPushButton *okButton = m_widget->findChild<QPushButton *>("okPushButton");
    if (okButton) {
        connect(okButton, SIGNAL(clicked()), this, SLOT(okButtonClicked()));
        connect(okButton, SIGNAL(clicked()), m_widget, SLOT(close()));
    } else {
        qWarning() << "ConfigModule: Can't find ok button.";
    }

    QPushButton *applyButton = m_widget->findChild<QPushButton *>("applyPushButton");
    if (applyButton) {
        connect(applyButton, SIGNAL(clicked()), this, SLOT(applyButtonClicked()));
    } else {
        qWarning() << "ConfigModule: Can't find apply button.";
    }

    QPushButton *cancelButton = m_widget->findChild<QPushButton *>("cancelPushButton");
    if (cancelButton) {
        connect(cancelButton, SIGNAL(clicked()), this, SLOT(cancelButtonClucked()));
        connect(cancelButton, SIGNAL(clicked()), m_widget, SLOT(close()));
    } else {
        qWarning() << "ConfigModule: Can't find cancel button.";
    }

    QListView *listView = m_widget->findChild<QListView *>();
    if (listView) {
        listView->setMinimumSize(150, 200);
        listView->setModel(new QStandardItemModel(this));
        listView->setIconSize(QSize(30, 30));
        connect(listView, SIGNAL(pressed(QModelIndex)), this, SLOT(currentDialogChange(QModelIndex)));
    } else {
        qWarning() << "ConfigModule: Can't find list view.";
    }

    QStackedWidget *stacked = m_widget->findChild<QStackedWidget *>();
    if (stacked) {
//        connect(stacked, SIGNAL(currentChanged(int)), this, SLOT());
    } else {
        qWarning() << "ConfigModule: Can't find staked widget.";
    }

    return true;
}

void ConfigModule::initMenu()
{
    m_menu = new QMenu("&Herramientas", m_widget);
    QAction *menuAct = m_menu->addAction("Configuración", m_widget, SLOT(show()));
    connect(menuAct, SIGNAL(triggered()), this, SLOT(loadConfigDialogs()));
}
