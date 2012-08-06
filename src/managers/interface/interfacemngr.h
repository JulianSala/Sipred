/****************************************************************************
**
**  Copyright   : (C) 2012 Dismet S.A.S.
**              : Julian Salamanca Espinosa
**  e-mail      : julian.sse@gmail.com
**
*****************************************************************************
**
**  interfacemngr.h is part of Sipred.
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

#ifndef INTERFACEMNGR_H
#define INTERFACEMNGR_H

#include <QObject>

#include "interfacemngr_global.h"

class ModuleMngr;
class PluginMngr;
class InterfaceMngrPrivate;

class INTERFACEMNGR_EXPORT InterfaceMngr : public QObject
{
    Q_OBJECT

public:
    InterfaceMngr(QObject *parent = 0);
    ~InterfaceMngr();
    void createConnections();
    
public slots:
    void registerModuleManager(ModuleMngr *moduleMngr);
    void registerPluginManager(PluginMngr *pluginMngr);
    void initInterface();
    void endInterface();

    /* File Menu */
    void newProject();
    bool openProject();
    bool saveProject();
    bool saveAsProject();
    void quitApp();

    /* Tools Menu */

    void startConfigDialog();

protected:
    InterfaceMngr(const InterfaceMngrPrivate &d);
    InterfaceMngrPrivate * const d_ptr;

private:
    Q_DECLARE_PRIVATE(InterfaceMngr)
    
};

#endif // INTERFACEMNGR_H
