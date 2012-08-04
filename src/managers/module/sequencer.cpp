/****************************************************************************
**
**  Copyright   : (C) 2012 Dismet S.A.S.
**              : Julian Salamanca Espinosa
**  e-mail      : julian.sse@gmail.com
**
*****************************************************************************
**
**  sequencer.cpp is part of Sipred.
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

#include "sequencer.h"

#include <QStringList>

Sequencer::Sequencer(QObject *parent) :
    QObject(parent)
{
    m_sequence.clear();
}

void Sequencer::loadSequence(const QString &id, const QStringList &depIds)
{
    if
}

int Sequencer::getLevel(const QString &id)
{

}

int Sequencer::higerLevel() const
{
    QList<int> levels = m_sequence.values();

    int max = 0;

    foreach (int level, levels) {
        if (level > max)
            max = level;
    }

    return max;
}

void Sequencer::insertLowerLevel()
{

}

void Sequencer::insetHigerLevel()
{

}
