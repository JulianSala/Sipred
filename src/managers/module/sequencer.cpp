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

void Sequencer::insertSequence(const QString &id, const QStringList &depIds)
{
    if (depIds.isEmpty()) {
        m_sequence.insert(id, qMakePair(depIds, 0));
        return;
    }

    int maxDep = higerLevel(depIds);
    int newLevel = maxDep + 1;
    insertLevetAt(newLevel);
    m_sequence.insert(id, qMakePair(depIds, newLevel));
}

int Sequencer::getLevel(const QString &id)
{
    if (!m_sequence.contains(id))
        return 0;

    return m_sequence.value(id).second;
}

QStringList Sequencer::getListAtLevel(const int &level)
{
    if (level > higerLevel() || level < 0)
        return QStringList();

    QStringList list;
    foreach (QString id, m_sequence.keys()) {
        if (m_sequence.value(id).second == level)
            list.append(id);
    }

    return list;
}

QStringList Sequencer::getDependences(const QString &id)
{
    if (!m_sequence.contains(id))
        return QStringList();

    return m_sequence.value(id).first;
}

int Sequencer::higerLevel() const
{
    int max = 0;
    QPair<QStringList, int> pair;

    foreach (pair, m_sequence.values()) {
        if (pair.second > max)
            max = pair.second;
    }

    return max;
}

int Sequencer::higerLevel(const QStringList &list)
{
    int max = 0;

    foreach (QString id, list) {
        int lev = getLevel(id);
        if (max < lev)
            max = lev;
    }

    return max;
}

void Sequencer::insertLowerLevel()
{

}

void Sequencer::insertLevetAt(int lev)
{
    if (lev > higerLevel())
        return;

    foreach (QString id, m_sequence.keys()) {
        if (lev >= m_sequence.value(id).second)
            continue;

        QPair<QStringList, int> pair = m_sequence.value(id);
        m_sequence.remove(id);
        m_sequence.insert(id, qMakePair(pair.first, pair.second + 1));
    }
}
