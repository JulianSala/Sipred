/****************************************************************************
**
**  Copyright   : (C) 2012 Dismet S.A.S.
**              : Julian Salamanca Espinosa
**  e-mail      : julian.sse@gmail.com
**
*****************************************************************************
**
**  moduleinfo.h is part of Sipred.
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

#ifndef MODULEINFO_H
#define MODULEINFO_H

#include <QMetaType>
#include <QDebug>
#include <QtGui>

#include "libraryinfo.h"
#include "module.h"

class ModuleInfo : public LibraryInfo
{
    Q_PROPERTY(QString instance READ instance WRITE setInstance RESET resetInstance)
    Q_PROPERTY(bool configurable READ isConfigurable WRITE setConfigurable RESET resetConfigurable)

public:
    ModuleInfo();
    ModuleInfo(const ModuleInfo &);
    ~ModuleInfo();

    QVariant dependences() const;
    QString instance() const;
    bool isConfigurable() const;
    Module::ModuleType type() const;

    void setDependences(const QVariant &);
    void setInstance(const QString &);
    void setConfigurable(bool);
    void setType(const Module::ModuleType &);

    void resetAll();
    void resetDependences();
    void resetInstance();
    void resetConfigurable();
    void resetType();

private:
    QString m_instance;
    bool m_configurable;
    Module::ModuleType m_type;
    QVariant m_dependences;

public:
    ModuleInfo& operator =(const ModuleInfo &);
};

Q_DECLARE_METATYPE(ModuleInfo)

QDebug& operator <<(QDebug dbg, const ModuleInfo &info);

#endif // MODULEINFO_H
