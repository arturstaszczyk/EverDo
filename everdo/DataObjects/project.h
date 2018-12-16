#ifndef PROJECT_H
#define PROJECT_H

#include <string>
#include <QDebug>

namespace EverDo {

struct Project {
    Project(const std::string& name, const std::string& guid, const std::string& parent)
        : name(name)
        , guid(guid)
        , parent(parent)
    {
    }

    std::string name;
    std::string guid;
    std::string parent;
};

inline QDebug operator << (QDebug dbg, const Project& project) {
    dbg << "Project " << project.name.c_str() << " [" << project.guid.c_str() << "] of parent [" << project.parent.c_str() << "]";
    return dbg;
}

}
#endif // PROJECT_H
