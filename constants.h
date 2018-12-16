#ifndef CONSTANTS_H
#define CONSTANTS_H

#include <QDebug>
#include <string>
#include <qcoreapplication.h>

#include <yaml-cpp/yaml.h>

namespace EverDo {

struct Config {
    std::string devToken;
    std::string userStorePath;
    std::string noteStorePath;
    std::string endpoint;

    void loadConfig() {
        auto path = QCoreApplication::applicationDirPath().toStdString() + "/../Resources/config.yaml";
        auto pathPriv = QCoreApplication::applicationDirPath().toStdString() + "/../Resources/config-priv.yaml";
        qDebug() << path.c_str();
        YAML::Node config = YAML::LoadFile(path);
        YAML::Node configPriv = YAML::LoadFile(pathPriv);

        this->devToken = configPriv["devToken"].as<std::string>();
        this->userStorePath = config["userStorePath"].as<std::string>();
        this->noteStorePath = config["noteStorePath"].as<std::string>();
        this->endpoint = config["debugEndpoint"].as<std::string>();
    }
};

};


#endif // CONSTANTS_H
