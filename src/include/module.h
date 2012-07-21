/****************************************************************************
**
**  Copyright   : (C) 2012 Dismet S.A.S.
**              : Julian Salamanca Espinosa
**  e-mail      : julian.sse@gmail.com
**
*****************************************************************************
**
**  module.h is part of Sipred.
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

#ifndef MODULE_H
#define MODULE_H

#include <QtGui>

class Module
{
public:
    virtual QString id() = 0;
    virtual QString name() = 0;
    virtual QString version() = 0;
    virtual QString summary() = 0;
    virtual QString category() = 0;
    virtual QString applyTo() = 0;
    virtual QString author() = 0;
    virtual QString mail() = 0;
    virtual QString webside() = 0;
    virtual QString license() = 0;
    virtual QIcon icon() = 0;

    virtual QVariant dependences() = 0;
    virtual QString instance() = 0;
    virtual bool configurable() = 0;
};

Q_DECLARE_INTERFACE(Module, "interface.module")

#endif // MODULE_H
