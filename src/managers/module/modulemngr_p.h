/****************************************************************************
**
**  Copyright   : (C) 2012 Dismet S.A.S.
**              : Julian Salamanca Espinosa
**  e-mail      : julian.sse@gmail.com
**
*****************************************************************************
**
**  modulemngr_p.h is part of Sipred.
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

#ifndef MODULEMNGR_P_H
#define MODULEMNGR_P_H

#include <QtCore/QtGlobal>
#include <QList>
#include <QHash>

class ModuleMngr;
class ModuleInfo;
class QPluginLoader;
class QDir;
class Module;

class ModuleMngrPrivate
{
    Q_DECLARE_PUBLIC(ModuleMngr)

public:
    ModuleMngrPrivate(ModuleMngr *q);

    void initModuleManager();
    void loadModules();
    bool setModulesPath(const QString &);
    void registerModule(Module *, const QString &);

    QPluginLoader m_loader;
    QList<Module *> m_activeModules;
    QHash<QString, ModuleInfo> m_modulesInfo;
    QHash<QString, QVariant> m_modulesConfig;
    QDir m_modulesDir;

    ModuleMngr * const q_ptr;
};

#endif // MODULEMNGR_P_H
