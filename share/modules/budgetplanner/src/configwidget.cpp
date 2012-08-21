/****************************************************************************
**
**  Copyright   : (C) 2012 Dismet S.A.S.
**              : Julian Salamanca Espinosa
**  e-mail      : julian.sse@gmail.com
**
*****************************************************************************
**
**  configwidget.cpp is part of Sipred.
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

#include "../include/configwidget.h"

#include <QtGui>
#include <QtUiTools>

ConfigWidget::ConfigWidget(QObject *parent) :
    QObject(parent)
{
    m_widget = NULL;
    loadWidget();
}

bool ConfigWidget::loadWidget()
{
    QFile file(":/ui/budgetplanner_config.ui");

    if (!file.open(QIODevice::ReadOnly)) {
        qWarning() << "BudgetPlanner: Can't open config dialog.";
        return false;
    }

    QUiLoader loader;

    m_widget = qobject_cast<QWidget *>(loader.load(&file));

    if (!m_widget) {
        qWarning() << "BudgetPlanner: Can't load config dialog.";
        return false;
    }

    return true;
}

QWidget* ConfigWidget::widget() const
{
    return m_widget;
}
