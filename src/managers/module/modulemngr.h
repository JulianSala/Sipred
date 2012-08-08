/****************************************************************************
**
**  Copyright   : (C) 2012 Dismet S.A.S.
**              : Julian Salamanca Espinosa
**  e-mail      : julian.sse@gmail.com
**
*****************************************************************************
**
**  modulemngr.h is part of Sipred.
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

#ifndef MODULEMNGR_H
#define MODULEMNGR_H

#include <QObject>

#include "modulemngr_global.h"
#include "modulefactory.h"
#include "module.h"

class ModuleMngrPrivate;

class MODULEMNGR_EXPORT ModuleMngr : public QObject
{
    Q_OBJECT

public:
    ModuleMngr(QObject *parent = 0);
    ~ModuleMngr();
    bool activeModule(const QString &);
    bool disableModule(const QString &);
    QStringList avaliableModules();
    QStringList avaliableModules(const Module::ModuleType &);
    Module *module(const QString &);

signals:
    void moduleLoaded();
    void moduleLoaded(QString);
    void configChange();

protected:
    ModuleMngr(const ModuleMngrPrivate &);
    ModuleMngrPrivate * const d_ptr;

private:
    Q_DECLARE_PRIVATE(ModuleMngr)
};

#endif // MODULEMNGR_H
