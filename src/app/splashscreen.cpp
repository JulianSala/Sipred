/****************************************************************************
**
**  Copyright   : (C) 2012 Dismet S.A.S.
**              : Julian Salamanca Espinosa
**  e-mail      : julian.sse@gmail.com
**
*****************************************************************************
**
**  splashscreen.cpp is part of Sipred.
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

#include "splashscreen.h"

#include <QPainter>

SplashScreen::SplashScreen(const QPixmap &pm) :
    QFrame(0, Qt::FramelessWindowHint | Qt::WindowStaysOnTopHint),
    pixmap(pm)
{
    setAttribute(Qt::WA_TranslucentBackground);
    setFixedSize(pixmap.size());
}

SplashScreen::~SplashScreen()
{
}

void SplashScreen::showMessage(const QString &msg, int align, const QColor &col)
{
    message = msg;
    alignement = align;
    color = col;
    repaint();
}

void SplashScreen::paintEvent(QPaintEvent *event)
{
    QRect textRect(rect());

    textRect.setRect(textRect.x() + 5,
                     textRect.y() + 5,
                     textRect.width() - 10,
                     textRect.height() - 10);

    QPainter painter(this);
    painter.drawPixmap(rect(), pixmap);
    painter.drawText(textRect, alignement, message);
}
