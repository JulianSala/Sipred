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

#include <QtUiTools>
#include <QDebug>

ConfigModule::ConfigModule(QObject *parent) :
    QObject(parent)
{
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

QAction* ConfigModule::menu() const
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
    return true;
}

bool ConfigModule::stop()
{
    return true;
}

void ConfigModule::okButtonClicked()
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

    QPushButton *okButton = m_widget->findChild<QPushButton *>("okPushButton");
    connect(okButton, SIGNAL(clicked()), this, SLOT(okButtonClicked()));
    connect(okButton, SIGNAL(clicked()), m_widget, SLOT(close()));

    QPushButton *applyButton = m_widget->findChild<QPushButton *>("applyPushButton");
    connect(applyButton, SIGNAL(clicked()),

    return true;
}
