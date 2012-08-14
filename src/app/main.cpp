/****************************************************************************
**
**  Copyright   : (C) 2012 Dismet S.A.S.
**              : Julian Salamanca Espinosa
**  e-mail      : julian.sse@gmail.com
**
*****************************************************************************
**
**  main.cpp is part of Sipred.
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

#include <QApplication>
#include <QtGui>
#include <QPixmap>
#include <QDebug>


inline void registerResources(const QString &resourcesDir)
{
    QDir dir(resourcesDir);

    if (!dir.exists())
        qWarning() << "Resources dir doesn't exist." << endl
                   << "Please verify the folder" << dir.absolutePath();

    QStringList filter;
    filter << "*.rcc" << "*.sip";
    dir.setNameFilters(filter);

    qDebug() << "Registering resources...";
    foreach (QString resource, dir.entryList(QDir::Files)) {
        if (!QResource::registerResource(dir.absoluteFilePath(resource)))
            qWarning() << "Can't register resource file" << resource;
        else
            qDebug() << "Resource file" << resource << "have been register.";
    }
}


#include "core.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    registerResources(RESOURCES_PATH);

    QPixmap logo(":/thumbnail/logo_sipred", "PNG");
    QSplashScreen splash(logo);
    splash.setAutoFillBackground(true);

    QTimer::singleShot(3500, &splash, SLOT(close()));
    splash.show();

    Core core;
    core.run();

    QObject::connect(qApp, SIGNAL(lastWindowClosed()), &core, SLOT(unregisterResources()));

    return app.exec();
}
