/****************************************************************************
**
**  Copyright   : (C) 2012 Dismet S.A.S.
**              : Julian Salamanca Espinosa
**  e-mail      : julian.sse@gmail.com
**
*****************************************************************************
**
**  sqlmodule.h is part of Sipred.
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

#ifndef SQLMODULE_H
#define SQLMODULE_H

#include <QObject>
#include "module.h"

class SqlModule : public QObject, public Module
{
    Q_OBJECT

public:
    SqlModule(QObject *parent = 0);
    ~SqlModule();

    QString id() const;
    QString name() const;
    QString version() const;
    QString summary() const;
    QString category() const;
    QString author() const;
    QString mail() const;
    QString webside() const;
    QString license() const;
    QIcon icon() const;

    ModuleType type() const;

    QVariant dependences() const;
//    QString instance() const;
    bool configurable() const;
    QWidget *configDialog() const;
    QHash<QString, QVariant> defaultConfig() const;
    bool setConfig(QVariant);
    bool setConfigs(QVariant);

    QAction *menu() const;
    QWidget *centralWidget() const;
    QWidget *controlsWidget() const;
    QWidget *additionalWidget() const;
    
    void registerModuleManager(ModuleMngr *);

private:
    bool loadConfigDialog();

signals:
    

public slots:
    bool start();
    bool stop();

private:
    QWidget *m_configDialog;
    QWidget *m_centralWidget;
    QWidget *m_controlsWidget;
    QWidget *m_additionalWidget;
    QAction *m_menuAction;
    QHash<QString, QVariant> m_config;
    ModuleMngr *m_moduleManger;
};

#endif // SQLMODULE_H
