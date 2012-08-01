/****************************************************************************
**
**  Copyright   : (C) 2012 Dismet S.A.S.
**              : Julian Salamanca Espinosa
**  e-mail      : julian.sse@gmail.com
**
*****************************************************************************
**
**  plugin.h is part of Sipred.
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

#ifndef PLUGIN_H
#define PLUGIN_H

#include <QtGui>
#include "libraryinfo.h"
//#include "pluginmngr.h"

class PluginMngr;

class Plugin
{
public:
    virtual QString id() const = 0;
    virtual QString name() const = 0;
    virtual QString version() const = 0;
    virtual QString summary() const = 0;
    virtual QString category() const = 0;
    virtual QString applyTo() const = 0;
    virtual QString author() const = 0;
    virtual QString mail() const = 0;
    virtual QString webside() const = 0;
    virtual QString licence() const = 0;
    virtual QIcon icon() const = 0;

    virtual bool isConfigurable() const = 0;
    virtual QWidget *configDialog() const = 0;
    virtual QHash<QString, QVariant> defaultConfig() const = 0;
    virtual bool setConfigs(QVariant) = 0;
    virtual QStringList configList() const = 0;

    virtual QMenu *menu() = 0;
    virtual QDialog *dialog() = 0;

    virtual void registerPluginManager(PluginMngr *) = 0;

public Q_SLOTS:
    virtual bool start() = 0;
    virtual bool stop() = 0;
};

#endif // PLUGIN_H
