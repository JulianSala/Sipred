/****************************************************************************
**
**  Copyright   : (C) 2012 Dismet S.A.S.
**              : Julian Salamanca Espinosa
**  e-mail      : julian.sse@gmail.com
**
*****************************************************************************
**
**  moduleinfo.cpp is part of Sipred.
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

#include "moduleinfo.h"

ModuleInfo::ModuleInfo()
{
    this->resetAll();
}

ModuleInfo::ModuleInfo(const ModuleInfo &object) :
    LibraryInfo(object)
{
    this->resetAll();
}

ModuleInfo::~ModuleInfo()
{

}

QString ModuleInfo::instance() const
{
    return m_instance;
}

bool ModuleInfo::isConfigurable() const
{
    return m_configurable;
}

void ModuleInfo::setInstance(const QString &inst)
{
    m_instance = inst;
}

void ModuleInfo::setConfigurable(bool conf)
{
    m_configurable = conf;
}

void ModuleInfo::resetAll()
{
    this->resetBasicInfo();
    this->resetInstance();
    this->resetConfigurable();
}

void ModuleInfo::resetInstance()
{
    m_instance = QString();
}

void ModuleInfo::resetConfigurable()
{
    m_configurable = false;
}

ModuleInfo& ModuleInfo::operator =(const ModuleInfo &info)
{
    if (this != &info) {
        this->m_info = info.m_info;
        this->m_configurable = info.m_configurable;
        this->m_instance = info.m_instance;
    }

    return *this;
}

QDebug& operator <<(QDebug dbg, const ModuleInfo &info)
{
    dbg << "Module information" << endl;
    dbg << info;
    dbg << "Instance:" << info.instance() << endl;
    if (info.isConfigurable())
        dbg << "Configurable:" << "yes" << endl;
    else
        dbg << "Configurable:" << "no" << endl;

    return dbg.maybeSpace();
}
