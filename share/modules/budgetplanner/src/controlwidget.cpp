/****************************************************************************
**
**  Copyright   : (C) 2012 Dismet S.A.S.
**              : Julian Salamanca Espinosa
**  e-mail      : julian.sse@gmail.com
**
*****************************************************************************
**
**  controlwidget.cpp is part of Sipred.
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

#include "../include/controlwidget.h"

#include <QtGui>
#include <QtUiTools>
#include <QDebug>

ControlWidget::ControlWidget(QObject *parent) :
    QObject(parent)
{
    m_widget = NULL;
    loadWidget();
}

bool ControlWidget::loadWidget()
{
    QFile file(":/ui/budgetplanner_control.ui");

    if (!file.open(QIODevice::ReadOnly)) {
        qWarning() << "BudgetPlanner: Can't open control widget.";
        return false;
    }

    QUiLoader loader;

    m_widget = qobject_cast<QWidget *>(loader.load(&file));

    if (!m_widget)
        return false;

    return true;
}

QWidget* ControlWidget::widget()
{
    return m_widget;
}
