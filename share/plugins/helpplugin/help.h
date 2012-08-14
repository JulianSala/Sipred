/****************************************************************************
**
**  Copyright   : (C) 2012 Dismet S.A.S.
**              : Julian Salamanca Espinosa
**  e-mail      : julian.sse@gmail.com
**
*****************************************************************************
**
**  help.h is part of Sipred.
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

#ifndef HELP_H
#define HELP_H

#include <QObject>
#include "plugin.h"

class Help : public QObject, public Plugin
{
    Q_OBJECT

public:
    Help(QObject *parent = 0);
    ~Help();

    QString id() const;
    QString name() const;
    QString version() const;
    QString summary() const;
    QString category() const;
    QString applyTo() const;
    QString author() const;
    QString mail() const;
    QString webside() const;
    QString licence() const;
    QIcon icon() const;

    bool isConfigurable() const;
    QWidget *configDialog() const;
    QHash<QString, QVariant> defaultConfig() const;
    bool setConfigs(QVariant);
    QStringList configList() const;
    
    QMenu *menu();
    QDialog *dialog();

    void registerPluginManager(PluginMngr *);
signals:
    
public slots:
    bool start();
    bool stop();
    void launchDialog();

private:
    void loadDialog();
    QMenu *m_menu;
    QDialog *m_dialog;
    
};

#endif // HELP_H
