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

#include <QObject>
#include <QDebug>
#include "libraryinfo.h"

class ModuleInfo :public QObject, public LibraryInfo
{
    Q_OBJECT

    Q_PROPERTY(QString instance READ instance WRITE setInstance RESET resetInstance)
    Q_PROPERTY(bool configurable READ isConfigurable WRITE setConfigurable RESET resetConfigurable)

public:
    ModuleInfo();
    ModuleInfo(const ModuleInfo &);
    ~ModuleInfo();

    ModuleInfo(QObject *parent);

    QString instance() const;
    bool isConfigurable() const;

private:
    QString m_instance;
    bool m_configurable;

public slots:
    void setInstance(const QString &);
    void setConfigurable(bool);

    void resetAll();
    void resetInstance();
    void resetConfigurable();

public:
    ModuleInfo& operator =(const ModuleInfo &);
};

Q_DECLARE_METATYPE(ModuleInfo)

QDebug& operator <<(QDebug dbg, const ModuleInfo &info);

#endif // MODULEINFO_H
