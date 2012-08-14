/****************************************************************************
**
**  Copyright   : (C) 2012 Dismet S.A.S.
**              : Julian Salamanca Espinosa
**  e-mail      : julian.sse@gmail.com
**
*****************************************************************************
**
**  pluginmngr_p.h is part of Sipred.
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

#ifndef PLUGINMNGR_P_H
#define PLUGINMNGR_P_H

#include <QtCore/QtGlobal>
#include <QList>
#include <QHash>

class QPluginLoader;
class Plugin;
class QString;
class PluginInfo;
class PluginMngr;
class QDir;

class PluginMngrPrivate
{
    Q_DECLARE_PUBLIC(PluginMngr)

public:
    PluginMngrPrivate(PluginMngr *q);
    ~PluginMngrPrivate();

    void initPluginManager();
    void loadPlugins();
    bool setPluginsPath(const QString &);
    void registerPlugin(Plugin *, const QString &);

    bool loadPlugin(const QString &pluginId);
    bool unloadPlugin(const QString &pluginId);

    QPluginLoader m_loader;
    QHash<QString, Plugin *> m_activePlugins;
    QHash<QString, PluginInfo> m_pluginsInfo;
    QHash<QString, QVariant> m_pluginConfig;
    QDir m_pluginsDir;

    PluginMngr * const q_ptr;
};

#endif // PLUGINMNGR_P_H
