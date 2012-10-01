/****************************************************************************
**
**  Copyright   : (C) 2012 Dismet S.A.S.
**              : Julian Salamanca Espinosa
**  e-mail      : julian.sse@gmail.com
**
*****************************************************************************
**
**  centralwidget.h is part of Sipred.
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

#ifndef CENTRALWIDGET_H
#define CENTRALWIDGET_H

#include <QWidget>
#include <QObject>
#include <QtUiTools>
#include <QDebug>

class CentralWidget : public QObject
{
public:
    CentralWidget(QObject *parent = 0) :
        QObject(parent)
    {
        m_widget = NULL;
    }

    CentralWidget(const QString filePath,
                  QObject *parent = 0) :
        QObject(parent)
    {
        m_widget = NULL;

        loadWidget(filePath);
    }

    bool loadWidget(const QString filePath)
    {
        QFile file(filePath);

        if (!file.open(QIODevice::ReadOnly)) {
            qWarning() << "CentralWidget: Can't open central widget file"
                       << file.errorString();
            return false;
        }

        QUiLoader loader;

        m_widget = qobject_cast<QWidget *>(loader.load(&file));

        if (!m_widget) {
            qWarning() << "CentralWidget: Can't load central widget";
            return false;
        }

        return true;
    }

    QWidget *widget() const
    {
        return m_widget;
    }

private:
    QWidget *m_widget;
};

#endif // CENTRALWIDGET_H
