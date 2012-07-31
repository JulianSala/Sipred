/****************************************************************************
**
**  Copyright   : (C) 2012 Dismet S.A.S.
**              : Julian Salamanca Espinosa
**  e-mail      : julian.sse@gmail.com
**
*****************************************************************************
**
**  plugininfo.h is part of Sipred.
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

#ifndef PLUGININFO_H
#define PLUGININFO_H

#include <QMetaType>
#include <QDebug>
#include <QtGui>

#include "libraryinfo.h"

class PluginInfo : public LibraryInfo
{
    Q_PROPERTY(QString applyTo READ applyTo WRITE setApplyTo RESET resetApplyTo)
    Q_PROPERTY(bool configurable READ isConfigurable WRITE setConfigurable RESET resetConfigurable)
    Q_PROPERTY(QStringList configList READ configList WRITE setConfigList RESET resetConfigList)

public:
    PluginInfo();
    PluginInfo(const PluginInfo &);
    ~PluginInfo();

    QString applyTo() const;
    bool isConfigurable() const;
    QStringList configList() const;

private:
    QString m_applyTo;
    bool m_configurable;
    QStringList m_configList;

public slots:
    void setApplyTo(const QString &);
    void setConfigurable(const bool);
    void setConfigList(const QStringList &);

    void resetAll();
    void resetApplyTo();
    void resetConfigurable();
    void resetConfigList();

public:
    PluginInfo& operator =(const PluginInfo &);
    bool operator ==(const PluginInfo &) const;
    friend QDataStream& operator <<(QDataStream &, const PluginInfo &);
    friend QTextStream& operator <<(QTextStream &, const PluginInfo &);

};

Q_DECLARE_METATYPE(PluginInfo)

inline QDebug& operator <<(QDebug &dbg, const PluginInfo &info) {
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

#endif // PLUGININFO_H
