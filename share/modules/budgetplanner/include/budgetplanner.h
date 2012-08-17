/****************************************************************************
**
**  Copyright   : (C) 2012 Dismet S.A.S.
**              : Julian Salamanca Espinosa
**  e-mail      : julian.sse@gmail.com
**
*****************************************************************************
**
**  budgetplanner.h is part of Sipred.
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

#ifndef BUDGETPLANNER_H
#define BUDGETPLANNER_H

#include <QObject>
#include <module.h>

class CentralWidget;
class ControlWidget;
class ModuleMngr;

class BudgetPlanner : public QObject, public Module
{
    Q_OBJECT

public:
    BudgetPlanner(QObject *parent = 0);
    ~BudgetPlanner();
    
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

    bool configurable() const;
    QWidget *configDialog() const;
    QHash<QString, QVariant> defaultConfig() const;
    bool setConfig(const QVariant &);

    QMenu *menu() const;
    QWidget *centralWidget() const;
    QWidget *controlsWidget() const;
    QWidget *additionalWidget() const;

    void registerModuleManager(ModuleMngr *);

signals:
    
public slots:
    bool start();
    bool stop();

    void applyConfig();

private:
    QHash<QString, QVariant> m_config;
    ModuleMngr *m_moduleMngr;
    CentralWidget *m_centralWidget;
    ControlWidget *m_controlWidget;
};

#endif // BUDGETPLANNER_H
