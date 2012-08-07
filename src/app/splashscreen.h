/****************************************************************************
**
**  Copyright   : (C) 2012 Dismet S.A.S.
**              : Julian Salamanca Espinosa
**  e-mail      : julian.sse@gmail.com
**
*****************************************************************************
**
**  splashscreen.h is part of Sipred.
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

#ifndef SPLASHSCREEN_H
#define SPLASHSCREEN_H

#include <QFrame>

class SplashScreen : public QFrame
{
public:
    SplashScreen(const QPixmap &);
    ~SplashScreen();

    void showMessage(const QString &message,
                     int alignement = Qt::AlignLeft,
                     const QColor &color = Qt::black);

protected:
    virtual void paintEvent(QPaintEvent *);

private:
    QPixmap pixmap;
    QString message;
    QColor color;
    int alignement;
};

#endif // SPLASHSCREEN_H
