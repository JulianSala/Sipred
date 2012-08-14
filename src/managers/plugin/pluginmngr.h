/****************************************************************************
**
**  Copyright   : (C) 2012 Dismet S.A.S.
**              : Julian Salamanca Espinosa
**  e-mail      : julian.sse@gmail.com
**
*****************************************************************************
**
**  pluginmngr.h is part of Sipred.
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

#ifndef PLUGINMNGR_H
#define PLUGINMNGR_H

#include <QObject>

#include "pluginfactory.h"
#include "plugininfo.h"
#include "pluginmngr_global.h"

class PluginMngrPrivate;

class PLUGINMNGR_EXPORT PluginMngr : public QObject
{
    Q_OBJECT
public:
    PluginMngr(QObject *parent = 0);
    ~PluginMngr();
    bool activePlugin(const QString &);
    bool disablePlugin(const QString &);
    PluginInfo pluginInfo(const QString &);
    QStringList avaliablePlugins();
    Plugin * plugin(const QString &);

signals:
    void pluginLoaded();
    void pluginLoaded(QString);
    void configChange();

protected:
    PluginMngr(const PluginMngrPrivate &);
    PluginMngrPrivate * const d_ptr;

private:
    Q_DECLARE_PRIVATE(PluginMngr)

};

#endif // PLUGINMNGR_H
