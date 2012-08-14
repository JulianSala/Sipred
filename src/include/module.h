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

class ModuleMngr;

class Module
{
//    Q_ENUMS(ModuleType)

public:
    enum ModuleType {
        ModuleTypeUnknow,
        ModuleTypeSql,
        ModuleTypeDataStreamer,
        ModuleTypeDataVisualizer,
        ModuleTypeCore
    };

    enum ModuleError {
        ModuleWarning,
        ModuleCritical,
        ModuleFatal
    };

    virtual ~Module() {

    }

    virtual QString id() const {
        return QString();
    }

    virtual QString name() const {
        return QString();
    }

    virtual QString version() const {
        return QString();
    }

    virtual QString summary() const {
        return QString();
    }

    virtual QString category() const {
        return QString();
    }

    virtual QString author() const {
        return QString();
    }

    virtual QString mail() const {
        return QString();
    }

    virtual QString webside() const {
        return QString();
    }

    virtual QString license() const {
        return QString();
    }

    virtual QIcon icon() const {
        return QIcon();
    }

    virtual ModuleType type() const {
        return ModuleTypeUnknow;
    }

    virtual QVariant dependences() const {
        return QVariant();
    }

//    virtual QString instance() const = 0;
    virtual bool configurable() const {
        return false;
    }

    virtual QWidget *configDialog() const {
        return NULL;
    }

    virtual QHash<QString, QVariant> defaultConfig() const {
        QHash<QString, QVariant> conf;
        return conf;
    }

    virtual bool setConfig(const QVariant &) {
        return false;
    }

//    virtual bool setConfigs(const QVariant &) = 0;

    virtual QMenu *menu() const {
        return NULL;
    }

    virtual QWidget *centralWidget() const {
        return NULL;
    }

    virtual QWidget *controlsWidget() const {
        return NULL;
    }

    virtual QWidget *additionalWidget() const {
        return NULL;
    }

    virtual void registerModuleManager(ModuleMngr *) {

    }

Q_SIGNALS:
    void error(const QString &message);
    void configChange(QVariant);


public Q_SLOTS:
    virtual bool start() {
        return false;
    }

    virtual bool stop() {
        return false;
    }

    virtual void applyConfig() {

    }
};

Q_DECLARE_METATYPE(Module)

#endif // MODULE_H
