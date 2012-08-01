/****************************************************************************
**
**  Copyright   : (C) 2012 Dismet S.A.S.
**              : Julian Salamanca Espinosa
**  e-mail      : julian.sse@gmail.com
**
*****************************************************************************
**
**  help.cpp is part of Sipred.
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

#include "help.h"

#include <QtUiTools>
#include <QDebug>
#include <QApplication>
#include <QSizePolicy>

Help::Help(QObject *parent) :
    QObject(parent)
{
    m_menu = NULL;
    m_dialog = NULL;
}

Help::~Help()
{
    stop();
}

QString Help::id() const
{
    return QString("HelpPlugin");
}

QString Help::name() const
{
    return QString("Help Plugin");
}

QString Help::version() const
{
    return QString("1.0.0");
}

QString Help::summary() const
{
    return QString("Show information about Sipred and Qt.");
}

QString Help::category() const
{
    return QString("information.Information");
}

QString Help::applyTo() const
{
    return QString();
}

QString Help::author() const
{
    return QString("Julian Salamanca E.");
}

QString Help::mail() const
{
    return QString("julian.sse@gmail.com");
}

QString Help::webside() const
{
    return QString("https://github.com/thanatosJSSE/Sipred");
}

QString Help::licence() const
{
    return QString("LGPLv3");
}

QIcon Help::icon() const
{
    QIcon icon(":/icon/enable.png");

    if (icon.isNull())
        return QIcon();

    return icon;
}

bool Help::isConfigurable() const
{
    return false;
}

QWidget* Help::configDialog() const
{
    return NULL;
}

QHash<QString, QVariant> Help::defaultConfig() const
{
    QHash<QString, QVariant> config;

    return config;
}

bool Help::setConfigs(QVariant val)
{
    Q_UNUSED(val);

    return false;
}

QStringList Help::configList() const
{
    return QStringList();
}

QMenu* Help::menu()
{
    if (!m_menu) {
        m_menu = new QMenu("&Ayuda");
        m_menu->addAction(QIcon(":/icon/qt_logo"),
                          QString("Acerca de &Qt"),
                          qApp, SLOT(aboutQt()));
        m_menu->addAction(QIcon(":/icon/enable.png"),
                          QString("&Acerca  de Sipred"),
                          this, SLOT(launchDialog()));
    }

    return m_menu;
}

QDialog* Help::dialog()
{
    if (!m_dialog)
        loadDialog();

    if (!m_dialog)
        return NULL;

    return m_dialog;
}

void Help::registerPluginManager(PluginMngr *pm)
{
    Q_UNUSED(pm);
}

bool Help::start()
{
    loadDialog();
    return true;
}

bool Help::stop()
{
    delete m_menu;
    delete m_dialog;

    if (m_menu || m_dialog)
        return false;

    return true;
}

void Help::launchDialog()
{
    if (!m_dialog)
        loadDialog();

    if (!dialog())
        return;

    m_dialog->exec();
}

void Help::loadDialog()
{
    QFile file(":/dialog/help_dialog");
    if (!file.open(QIODevice::ReadOnly)) {
        qWarning() << "Can't open Help dialog:"
                   << file.errorString();
        return;
    }

    QUiLoader loader;
    m_dialog = qobject_cast<QDialog *>(loader.load(&file));

    QLabel *label = m_dialog->findChild<QLabel *>("logoLabel");
    label->setPixmap(QPixmap(":/icon/sipred_logo"));

    m_dialog->setFixedHeight(m_dialog->sizeHint().height());
    m_dialog->layout()->setSizeConstraint(QLayout::SetFixedSize);
    m_dialog->setWindowIcon(this->icon());
//    label->setSizePolicy(QSizePolicy::Minimum, QSizePolicy::Minimum);
//    label->updateGeometry();
//    m_dialog->setSizePolicy(QSizePolicy::Minimum, QSizePolicy::Minimum);
//    m_dialog->updateGeometry();

    if (!m_dialog)
        qWarning() << "Can't load help dialog";

    file.close();
}
