/****************************************************************************
**
**  Copyright   : (C) 2012 Dismet S.A.S.
**              : Julian Salamanca Espinosa
**  e-mail      : julian.sse@gmail.com
**
*****************************************************************************
**
**  plugininfo.cpp is part of Sipred.
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

#include "plugininfo.h"

#include <QDataStream>

/*!
 *  \class PluginInfo
 *
 *  \brief The PluginInfo provide basic information handling for plugins.
 *
 *  PluginInfo is used for store informacion about plugins, using a basic
 *  seters and getters.
 *
 *  By default plugin have following information:
 *
 *  \table
 *  \header \o Name \o Description
 *  \row \o Basic Info
 *       \o Basic information about any Sipred library, this information can
 *          be used for modules, plugins, libs and general libraries.
 *  \row \o
 *  \endtable
 *
 */

PluginInfo::PluginInfo() :
    QObject(0)
{
    resetAll();
}

PluginInfo::PluginInfo(const PluginInfo &object) :
    QObject(object.parent()),
    LibraryInfo(object),
    m_applyTo(object.m_applyTo),
    m_configurable(object.m_configurable),
    m_configList(object.m_configList)
{
    m_info = object.basicInfo();
}

PluginInfo::PluginInfo(QObject *parent) :
    QObject(parent)
{
    resetAll();
}

PluginInfo::~PluginInfo()
{

}

QString PluginInfo::applyTo() const
{
    return m_applyTo;
}

bool PluginInfo::isConfigurable() const
{
    return m_configurable;
}

QStringList PluginInfo::configList() const
{
    return m_configList;
}

void PluginInfo::setApplyTo(const QString &pluginApTo)
{
    m_applyTo = pluginApTo;
}

void PluginInfo::setConfigurable(const bool configurable)
{
    m_configurable = configurable;
}

void PluginInfo::setConfigList(const QStringList &pluginConfig)
{
    m_configList = pluginConfig;
}

void PluginInfo::resetAll()
{
    this->resetBasicInfo();
    this->resetApplyTo();
    this->resetConfigurable();
    this->resetConfigList();
}

void PluginInfo::resetApplyTo()
{
    m_applyTo = "";
}

void PluginInfo::resetConfigurable()
{
    m_configurable = false;
}

void PluginInfo::resetConfigList()
{
    m_configList = QStringList();
}

PluginInfo& PluginInfo::operator =(const PluginInfo &object)
{
    if (this != &object) {
        this->m_info = object.m_info;
        this->m_configurable = object.m_configurable;
        this->m_configList = object.m_configList;
    }

    return *this;
}

bool PluginInfo::operator ==(const PluginInfo &object) const
{
    if (this->m_info == object.m_info &&
            this->m_applyTo == object.m_applyTo &&
            this->m_configurable == object.m_configurable &&
            this->m_configList == object.m_configList)
        return true;

    return false;
}

QDataStream& operator <<(QDataStream &out, const PluginInfo &object)
{
    out << object.id();
    out << object.fileName();
    out << object.name();
    out << object.version();
    out << object.summary();
    out << object.category();
    out << object.applyTo();
    out << object.author();
    out << object.mail();
    out << object.webside();
    out << object.licence();
    out << object.icon(); /* This function only work on QDataStream */
    out << object.isConfigurable();
    out << object.configList();

    return out;
}

QTextStream& operator <<(QTextStream &out, const PluginInfo &object)
{
    out << "Id: " << object.id() << endl;
    out << "File Name: " << object.fileName() << endl;
    out << "Name: " << object.name() << endl;
    out << "Version: " << object.version() << endl;
    out << "Summary: " << object.summary() << endl;
    out << "Category: " << object.category() << endl;
    out << "Apply to: " << object.applyTo() << endl;
    out << "Author: " << object.author() << endl;
    out << "E-Mail: " << object.mail() << endl;
    out << "Webside: " << object.webside() << endl;
    out << "Licence: " << object.licence() << endl;
    out << "Icon: " << object.icon().name() << endl;
    out << "Configurable: " << object.isConfigurable() << endl;
    out << "Config List: " << endl;
    foreach (QString var, object.configList()) {
        out << "    " << var << endl;
    }

    return out;
}

QDebug& operator <<(QDebug dbg, const PluginInfo &info)
{
    dbg << "Plugin Information" << endl;
    dbg << info;
    dbg << "Apply to:" << info.applyTo() << endl;
    if (info.isConfigurable())
        dbg << "Configurable:" << "yes" << endl;
    else
        dbg << "Configurable:" << "no" << endl;

    dbg << "Config List:";

    if (!info.configList().isEmpty() && info.isConfigurable()) {
        foreach (QString var, info.configList())
            dbg << endl << "    " << var;
    } else {
        dbg << "empty";
    }

    return dbg.maybeSpace();
}
