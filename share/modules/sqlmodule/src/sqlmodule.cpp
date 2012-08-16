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
#include <QSqlTableModel>
#include <QSqlRecord>
#include <QSqlDatabase>
#include <QSqlQuery>
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
        if (val == "userName") {
            m_config["userName"] = config.value(val);

        } else if (val == "hostName") {
            m_config["hostName"] = config.value(val);

        } else if (val == "portNumber") {
            m_config["portNumber"] = config.value(val);

        } else if (val == "pwd") {
            m_config["pwd"] = config.value(val);

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

    if (!loadControlWidget())
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

void SqlModule::runScript()
{
    QTextEdit *textEdit = m_centralWidget->findChild<QTextEdit *>();
    QTableView *tableView = m_centralWidget->findChild<QTableView *>();
    QPlainTextEdit *plainTextEdit = m_centralWidget->findChild<QPlainTextEdit *>();

    if (!textEdit) {
        qWarning() << "SqlModule: Can't find text edit widget.";
        return;
    } else if (!tableView) {
        qWarning() << "SqlModule: Can't find table view widget.";
        return;
    } else if (!plainTextEdit) {
        qWarning() << "SqlModule: Can't find plain text edit widget.";
        return;
    }

    QString script = textEdit->toPlainText();
    QSqlQueryModel *model = qobject_cast<QSqlQueryModel *>(tableView->model());
    QSqlQuery query(script, QSqlDatabase::database("SipredConnection"));
    model->setQuery(query);

    if (model->lastError().isValid()) {
        QString error;
        error.insert(0, "&gt;&gt; <B><font color=\"red\">Query Error</font></B><br>");
        error.append("&gt;&gt; Error numero: <font color=\"red\">");
        error.append(QString::number(model->lastError().number()));
        error.append("</font><br>");
        error.append("&gt;&gt; <font color=\"red\">");
        error.append(model->lastError().text());
        error.append("</font>");
        plainTextEdit->appendHtml(error);

    } else if (QSqlDatabase::database("SipredConnection").lastError().isValid()) {
        QString error;
        error.insert(0, "&gt;&gt; <B><font color=\"red\">Query Error</font></B><br>");
        error.append("&gt;&gt; Error numero: <font color=\"red\">");
        error.append(QString::number(QSqlDatabase::database("SipredConnection").lastError().number()));
        error.append("</font><br>");
        error.append("&gt;&gt; <font color=\"red\">");
        error.append(QSqlDatabase::database("SipredConnection").lastError().text());
        error.append("</font>");
        plainTextEdit->appendHtml(error);

    } else {
        QString message;
        message.insert(0, "&gt;&gt; <B><font color=\"green\">Query OK");
        message.append("</font></B>");
        plainTextEdit->appendHtml(message);
    }

    if (model->query().numRowsAffected() != -1 && !model->query().isSelect()) {
        QString message = QString::number(model->query().numRowsAffected());
        message.insert(0, "&gt;&gt; Numero de filas afectadas: <font color=\"green\">");
        message.append("</font>");
        plainTextEdit->appendHtml(message);
    }

    if (model->query().isSelect() && !model->lastError().isValid()) {
        QString message;
        message.insert(0, "&gt;&gt; Numero de records: <font color=\"green\">");
        message.append(QString::number(model->query().size()));
        message.append("</font><br>");
        message.append("&gt;&gt; Numero de columnas: <font color=\"green\">");
        message.append(QString::number(model->query().record().count()));
        message.append("</font>");
        plainTextEdit->appendHtml(message);
    }
}

void SqlModule::setEditMode(bool edit)
{
    QTextEdit *textEdit = m_centralWidget->findChild<QTextEdit *>();

    if (!textEdit) {
        qWarning() << "SqlModule: Can't find text edit widget.";
        return;
    }

    textEdit->setReadOnly(!edit);
}

void SqlModule::openSqlScript(QModelIndex index)
{
    if (!index.isValid())
        return;

    QTreeView *treeView = m_centralWidget->findChild<QTreeView *>();
    if (!treeView) {
        qWarning() << "SqlModule: Can't find list view.";
        return;
    }

    QFileSystemModel *model = qobject_cast<QFileSystemModel *>(treeView->model());
    QString filePath = model->filePath(index);

    QFile file(filePath);

    if (!file.open(QIODevice::ReadWrite)) {
        QMessageBox::warning(treeView, "Error de Archivo",
                             QString("Error al abrir el archivo:\n%1\n%2").arg(
                                 file.fileName(), file.errorString()));
        return;
    }

    QTextStream stream(&file);
    QString text = stream.readAll();

    file.close();

    QTextEdit *textEdit = m_centralWidget->findChild<QTextEdit *>();

    if (!textEdit) {
        qWarning() << "SqlModule: Can't find text edit widget.";
        return;
    }

    textEdit->setText(text);
//    setEditMode(false);

    QPushButton *editButton = m_centralWidget->findChild<QPushButton *>("editPushButton");
    editButton->setChecked(false);
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

bool SqlModule::loadControlWidget()
{
    QFile file(":/ui/sqlmodule_control.ui");

    if (!file.open(QIODevice::ReadOnly)) {
        qWarning() << "SqlModule: Can't open control widget.";
        return false;
    }

    QUiLoader loader;

    m_controlsWidget = qobject_cast<QWidget *>(loader.load(&file));

    if (!m_controlsWidget)
        return false;

    QList<QLabel *> labels = m_controlsWidget->findChildren<QLabel *>();
    foreach (QLabel *l, labels) {
        if (l->objectName() == "userName") {
            l->setText(m_config.value("userLabel").toString());
        } else if (l->objectName() == "hostLabel") {
            l->setText(m_config.value("hostName").toString());
        } else if (l->objectName() == "portLabel") {
            l->setText(m_config.value("portNumber").toString());
        } else if (l->objectName() == "tyoeLabel") {
            l->setText("Administrador");
        }
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

    QTreeView *treeView = m_centralWidget->findChild<QTreeView *>();
    if (!treeView) {
        qWarning() << "SqlModule: Can't find list view.";
    } else {
        QFileSystemModel *model = new QFileSystemModel(this);
        QDir dir(QApplication::applicationDirPath());
        dir.cdUp();
        dir.cd("share/scripts/mysql");
        model->setRootPath(QDir::rootPath());
        treeView->setModel(model);
        treeView->setRootIndex(model->index(dir.absolutePath()));
        connect(treeView, SIGNAL(doubleClicked(QModelIndex)), this, SLOT(openSqlScript(QModelIndex)));
    }

    QPlainTextEdit *plainTextEdit = m_centralWidget->findChild<QPlainTextEdit *>();
    if (!plainTextEdit) {
        qWarning() << "SqlModule: Can't find plain text edit.";
    } else {
        plainTextEdit->setReadOnly(true);
        plainTextEdit->setPlainText(">>");
        plainTextEdit->setLineWrapMode(QPlainTextEdit::NoWrap);
    }

    QTableView *tableView = m_centralWidget->findChild<QTableView *>();
    if (!tableView) {
        qWarning() << "SqlModule: Can't find table view.";
    } else {
        tableView->setModel(new QSqlQueryModel(this));
    }

    QList<QPushButton *> buttons = m_centralWidget->findChildren<QPushButton *>();
    if (buttons.isEmpty()) {
        qWarning() << "SqlModule: Can't find push buttons";
    } else {
        foreach (QPushButton *p, buttons) {
            if (p->objectName() == "editPushButton") {
                p->setCheckable(true);
                p->setChecked(false);
                connect(p, SIGNAL(toggled(bool)), this, SLOT(setEditMode(bool)));
                setEditMode(p->isChecked());
            } else if (p->objectName() == "runPushButton"){
                connect(p, SIGNAL(clicked()), this, SLOT(runScript()));
            }
        }
    }

    return true;
}
