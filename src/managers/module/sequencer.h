/****************************************************************************
**
**  Copyright   : (C) 2012 Dismet S.A.S.
**              : Julian Salamanca Espinosa
**  e-mail      : julian.sse@gmail.com
**
*****************************************************************************
**
**  sequencer.h is part of Sipred.
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

#ifndef SEQUENCER_H
#define SEQUENCER_H

#include <QObject>

#include "module.h"

class Sequencer : public QObject
{
    Q_OBJECT

public:
    Sequencer(QObject *parent);

    void insertSequence(const QString &id, const QStringList &depIds);
    int getLevel(const QString &);
    int higerLevel() const;
    int higerLevel(const QStringList &);

private:
    void insertLowerLevel();
    void insertLevetAt(int);

    QMap<QPair<QString, int>, QStringList> m_sequence;
};

#endif // SEQUENCER_H
