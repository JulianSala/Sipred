/****************************************************************************
**
**  Copyright   : (C) 2012 Dismet S.A.S.
**              : Julian Salamanca Espinosa
**  e-mail      : julian.sse@gmail.com
**
*****************************************************************************
**
**  sqlmodulefactory.h is part of Sipred.
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

#ifndef SQLMODULEFACTORY_H
#define SQLMODULEFACTORY_H

#include <QObject>
#include "modulefactory.h"
#include "sqlmodule.h"

class SqlModuleFactory : public QObject, public ModuleFactory
{
    Q_OBJECT
    Q_INTERFACES(ModuleFactory)

public:
    Module *module();
};

#endif // SQLMODULEFACTORY_H
