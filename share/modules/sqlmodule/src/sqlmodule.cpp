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

#include <QtUiTools>
#include <QSqlDatabase>
#include <QSqlError>

SqlModule::SqlModule(QObject *parent) :
    QObject(parent)
{
    m_configDialog = NULL;
    m_centralWidget = NULL;
    m_controlsWidget = NULL;
    m_additionalWidget = NULL;
    m_menu = NULL;
    m_config.clear();
    m_moduleManger = NULL;

    m_config["userName"] = QVariant(QString(""));
    m_config["hostName"] = QVariant(QString(""));
    m_config["portNumber"] = QVariant(3306);
    m_config["pwd"] = QVariant(QString(""));
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
    return QIcon(":/icons/e_sqlmodule.png");
}

Module::ModuleType SqlModule::type() const
{
    return Module::ModuleTypeSql;
}

QVariant SqlModule::dependences() const
{
    return QStringList();
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
    return m_configDialog;
}

QHash<QString, QVariant> SqlModule::defaultConfig() const
{
    return m_config;
}

bool SqlModule::setConfig(const QVariant &value)
{
    QHash<QString, QVariant> config = value.toHash();

    foreach (QString val, config.keys()) {
        if (m_config.contains(val) && config.value(val).isValid() &&
                m_config.value(val).typeName() == config.value(val).typeName()) {
            m_config[val] = config.value(val);
        }
    }

    return true;
}

//bool SqlModule::setConfigs(const QVariant &)
//{
//    return true;
//}

QMenu *SqlModule::menu() const
{
    return m_menu;
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
    if (!loadConfigDialog())
        return false;

    if (!loadCentralWidget())
        return false;

    m_menu = new QMenu("SQL", m_configDialog);

    connect(m_menu->menuAction(), SIGNAL(triggered()), m_configDialog, SLOT(show()));
    createConnection();

    return true;
}

bool SqlModule::stop()
{
    return true;
}

bool SqlModule::createConnection()
{
    if (!QSqlDatabase::isDriverAvailable("QMYSQL")) {
        qWarning() << "SqlModule: Can't find qmysql driver.";
        m_configDialog->setEnabled(false);
        return false;
    }

    QHash<QString, QVariant> config;
    QSqlDatabase database = QSqlDatabase::addDatabase("QMYSQL", "SipredConnection");
    QList<QLineEdit *> lineEditList = m_configDialog->findChildren<QLineEdit *>();
    QCheckBox *checkBox = m_configDialog->findChild<QCheckBox *>();

    foreach (QLineEdit *l, lineEditList) {
        QString objName = l->objectName();
        if (objName == "userLineEdit") {
            database.setUserName(l->text());
            config.insert("userName", QVariant(database.userName()));
        } else if (objName == "hostLineEdit") {
            database.setHostName(l->text());
            config.insert("hostName", QVariant(database.hostName()));
        } else if (objName == "portLineEdit") {
            database.setPort(l->text().toInt());
            config.insert("portNumber", QVariant(database.port()));
        } else if (objName == "pwdLineEdit") {
            database.setPassword(l->text());
            config.insert("pwd", QVariant(database.password()));
        } else if (objName == "socketLineEdit" && checkBox->isChecked()) {
            database.setConnectOptions();
        }
    }

    if (database.open()) {
        m_config.clear();
        m_config = config;

        QLabel *pixmapLabel = m_configDialog->findChild<QLabel *>("pixmapLabel");

        if (!pixmapLabel) {
            qWarning() << "SqlModule: Can't find label pixmap";
        } else {
            QPixmap pixmap(":/icons/e_sqlmodule.png");
            pixmapLabel->setPixmap(pixmap);
        }
    } else {
        qWarning() << database.lastError().text();
        QLabel *pixmapLabel = m_configDialog->findChild<QLabel *>("pixmapLabel");

        if (!pixmapLabel) {
            qWarning() << "SqlModule: Can't find label pixmap";
        } else {
            QPixmap pixmap(":/icons/d_sqlmodule.png");
            pixmapLabel->setPixmap(pixmap);
        }

        QMessageBox::warning(m_configDialog, "Error", QString("No se pudo realizar la coneción:\n%1").arg(
                                 database.lastError().text()));
        return false;
    }

    return true;
}

void SqlModule::saveConfig(const QVariant &values)
{

}

bool SqlModule::loadConfigDialog()
{
    QFile file(":/ui/sqlmodule_config.ui");

    if (!file.open(QIODevice::ReadOnly)) {
        qWarning() << "Can't open config sql dialog.";
        return false;
    }

    QUiLoader loader;

    m_configDialog = qobject_cast<QWidget *>(loader.load(&file));

    if (!m_configDialog)
        return false;

    m_configDialog->setMinimumWidth(300);

    QLabel *pixmapLabel = m_configDialog->findChild<QLabel *>("pixmapLabel");

    if (!pixmapLabel) {
        qWarning() << "SqlModule: Can't find label pixmap";
    } else {
        QPixmap pixmap(":/icons/d_sqlmodule.png");
        pixmapLabel->setPixmap(pixmap);
    }

    QPushButton *connectButton = m_configDialog->findChild<QPushButton *>("connectPushButton");
    if (!connectButton) {
        qWarning() << "SqlModule: Can't find connect button.";
    } else {
        connect(connectButton, SIGNAL(clicked()), this, SLOT(createConnection()));
    }

    return true;
}

bool SqlModule::loadCentralWidget()
{
    QFile file(":/ui/sqlmodule_central.ui");

    if (!file.open(QIODevice::ReadOnly)) {
        qWarning() << "SqlModule: Can't open central widget.";
        return false;
    }

    QUiLoader loader;

    m_centralWidget = qobject_cast<QWidget *>(loader.load(&file));

    if (!m_centralWidget)
        return false;

    QListView *listView = m_centralWidget->findChild<QListView *>("listView");
    if (!listView) {
        qWarning() << "SqlModule: Can't find list view.";
    } else {
        QFileSystemModel *model = new QFileSystemModel(this);
        model->setRootPath(QDir::currentPath());
        listView->setModel(model);
    }

    return true;
}
