/****************************************************************************
**
**  Copyright   : (C) 2012 Dismet S.A.S.
**              : Julian Salamanca Espinosa
**  e-mail      : julian.sse@gmail.com
**
*****************************************************************************
**
**  libraryinfo.h is part of Sipred.
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

#ifndef LIBRARYINFO_H
#define LIBRARYINFO_H

#include <QtGui>
#include <QObject>
#include <QMetaType>
#include <QDebug>

struct BasicInfo {
    QString id;
    QString fileName;
    QString name;
    QString version;
    QString summary;
    QString category;
    QString author;
    QString mail;
    QString webside;
    QString licence;
    QIcon icon;
};

Q_DECLARE_METATYPE(BasicInfo)

class LibraryInfo
{

    Q_PROPERTY(BasicInfo basicInfo READ basicInfo WRITE setBasicInfo RESET resetBasicInfo)
    Q_PROPERTY(QString id READ id WRITE setId RESET resetId)
    Q_PROPERTY(QString fileName READ fileName WRITE setFileName RESET resetFileName)
    Q_PROPERTY(QString name READ name WRITE setName RESET resetName)
    Q_PROPERTY(QString version READ version WRITE setVersion RESET resetVersion)
    Q_PROPERTY(QString summary READ summary WRITE setSummary RESET resetSummary)
    Q_PROPERTY(QString category READ category WRITE setCategory RESET resetCategory)
    Q_PROPERTY(QString author READ author WRITE setAuthor RESET resetAuthor)
    Q_PROPERTY(QString mail READ mail WRITE setMail RESET resetMail)
    Q_PROPERTY(QString webside READ webside WRITE setWebside RESET resetWebside)
    Q_PROPERTY(QString licence READ licence WRITE setLicence RESET resetLicence)
    Q_PROPERTY(QIcon icon READ icon WRITE setIcon RESET resetIcon)

public:
    LibraryInfo() {}

    LibraryInfo(const LibraryInfo &libInfo) :
        m_info(libInfo.m_info) {}

    virtual ~LibraryInfo() {}

    BasicInfo basicInfo() const
    {
        return m_info;
    }

    virtual QString id() const
    {
        return m_info.id;
    }

    virtual QString fileName() const
    {
        return m_info.fileName;
    }

    virtual QString name() const
    {
        return m_info.name;
    }

    virtual QString version() const
    {
        return m_info.version;
    }

    virtual QString summary() const
    {
        return m_info.summary;
    }

    virtual QString category() const
    {
        return m_info.category;
    }

    virtual QString author() const
    {
        return m_info.author;
    }

    virtual QString mail() const
    {
        return m_info.mail;
    }

    virtual QString webside() const
    {
        return m_info.webside;
    }

    virtual QString licence() const
    {
        return m_info.licence;
    }

    virtual QIcon icon() const
    {
        return m_info.icon;
    }

protected:
    BasicInfo m_info;

public:
    virtual void setBasicInfo(const BasicInfo &in)
    {
        m_info = in;
    }

    virtual void setId(const QString &libId)
    {
        m_info.id = libId;
    }

    virtual void setFileName(const QString &libFileName)
    {
        m_info.fileName = libFileName;
    }

    virtual void setName(const QString &libName)
    {
        m_info.name = libName;
    }

    virtual void setVersion(const QString &libVersion)
    {
        m_info.version = libVersion;
    }

    virtual void setSummary(const QString &libSummary)
    {
        m_info.summary = libSummary;
    }

    virtual void setCategory(const QString &libCategory)
    {
        m_info.category = libCategory;
    }

    virtual void setAuthor(const QString &libAuthor)
    {
        m_info.author = libAuthor;
    }

    virtual void setMail(const QString &libMail)
    {
        m_info.mail = libMail;
    }

    virtual void setWebside(const QString &libWebside)
    {
        m_info.webside = libWebside;
    }

    virtual void setLicence(const QString &libLicence)
    {
        m_info.licence = libLicence;
    }

    virtual void setIcon(const QIcon &libIcon)
    {
        m_info.icon = libIcon;
    }

    virtual void resetBasicInfo()
    {
        this->resetId();
        this->resetFileName();
        this->resetName();
        this->resetVersion();
        this->resetSummary();
        this->resetCategory();
        this->resetAuthor();
        this->resetMail();
        this->resetWebside();
        this->resetLicence();
        this->resetIcon();
    }

    virtual void resetAll()
    {
        this->resetBasicInfo();
    }

    virtual void resetId()
    {
        m_info.id = QString();
    }

    virtual void resetFileName()
    {
        m_info.fileName = QString();
    }

    virtual void resetName()
    {
        m_info.name = QString();
    }

    virtual void resetVersion()
    {
        m_info.version = QString();
    }

    virtual void resetSummary()
    {
        m_info.summary = QString();
    }

    virtual void resetCategory()
    {
        m_info.category = QString();
    }

    virtual void resetAuthor()
    {
        m_info.author = QString();
    }

    virtual void resetMail()
    {
        m_info.mail = QString();
    }

    virtual void resetWebside()
    {
        m_info.webside = QString();
    }

    virtual void resetLicence()
    {
        m_info.licence = QString();
    }

    virtual void resetIcon()
    {
        m_info.icon = QIcon();
    }
};

Q_DECLARE_METATYPE(LibraryInfo)

inline QDebug& operator <<(QDebug dbg, const LibraryInfo &libInfo)
{
    dbg << "Id:" << libInfo.id() << endl;
    dbg << "File name:" << libInfo.fileName() << endl;
    dbg << "Name:" << libInfo.name() << endl;
    dbg << "Version:" << libInfo.version() << endl;
    dbg << "Summary:" << libInfo.summary() << endl;
    dbg << "Category:" << libInfo.category() << endl;
    dbg << "Author:" << libInfo.author() << endl;
    dbg << "Mail:" << libInfo.mail() << endl;
    dbg << "Webside:" << libInfo.webside() << endl;
    dbg << "Licence:" << libInfo.licence() << endl;
    dbg << "Icon:" << libInfo.icon().name() << endl;

    return dbg.maybeSpace();
}

inline bool operator ==(const BasicInfo &info_1, const BasicInfo &info_2)
{
    if (info_1.id == info_2.id &&
            info_1.fileName == info_2.fileName &&
            info_1.name == info_2.name &&
            info_1.version == info_2.version &&
            info_1.summary == info_2.summary &&
            info_1.category == info_2.category &&
            info_1.author == info_2.author &&
            info_1.webside == info_2.webside &&
            info_1.licence == info_2.licence &&
            info_1.icon.cacheKey() == info_2.icon.cacheKey())
        return true;

    return false;
}

#endif // LIBRARYINFO_H
