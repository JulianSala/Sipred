/****************************************************************************
**
**  Copyright   : (C) 2012 Dismet S.A.S.
**              : Julian Salamanca Espinosa
**  e-mail      : julian.sse@gmail.com
**
*****************************************************************************
**
**  budgetplanner.cpp is part of Sipred.
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

#include "../include/budgetplanner.h"
#include "../include/controlwidget.h"
#include "../include/centralwidget.h"
#include "modulemngr.h"

BudgetPlanner::BudgetPlanner(QObject *parent) :
    QObject(parent)
{
    m_moduleMngr = NULL;
    m_centralWidget = NULL;
    m_config.clear();
}

BudgetPlanner::~BudgetPlanner()
{

}

QString BudgetPlanner::id() const
{
    return QString("budget.BudgetPlanner");
}

QString BudgetPlanner::name() const
{
    return QString("Planeador");
}

QString BudgetPlanner::version() const
{
    return QString("2.0.0");
}

QString BudgetPlanner::summary() const
{
    return QString("Module for management of Budget Planner.");
}

QString BudgetPlanner::category() const
{
    return QString("budget");
}

QString BudgetPlanner::author() const
{
    return QString("Julian Salamanca E.");
}

QString BudgetPlanner::mail() const
{
    return QString("julian.sse@gmail.com");
}

QString BudgetPlanner::webside() const
{
    return QString("");
}

QString BudgetPlanner::license() const
{
    return QString("GPLv3");
}

QIcon BudgetPlanner::icon() const
{
    return QIcon();
}

Module::ModuleType BudgetPlanner::type() const
{
    return Module::ModuleTypeSql;
}

QVariant BudgetPlanner::dependences() const
{
    return QVariant(QString("SqlModule"));
}

bool BudgetPlanner::configurable() const
{
    return true;
}

QWidget* BudgetPlanner::configDialog() const
{
    return NULL;
}

QHash<QString, QVariant> BudgetPlanner::defaultConfig() const
{
    return m_config;
}

bool BudgetPlanner::setConfig(const QVariant &)
{
    return true;
}

QMenu* BudgetPlanner::menu() const
{
    return NULL;
}

QWidget* BudgetPlanner::centralWidget() const
{
    return m_centralWidget->widget();
}

QWidget* BudgetPlanner::controlsWidget() const
{
    return m_controlWidget->widget();
}

QWidget* BudgetPlanner::additionalWidget() const
{
    return NULL;
}

void BudgetPlanner::registerModuleManager(ModuleMngr *moduleMngr)
{
    m_moduleMngr = moduleMngr;
}

bool BudgetPlanner::start()
{
    m_centralWidget = new CentralWidget(this);
    m_controlWidget = new ControlWidget(this);

    return true;
}

bool BudgetPlanner::stop()
{
    return true;
}

void BudgetPlanner::applyConfig()
{

}
