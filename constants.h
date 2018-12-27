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
    std::string consumerKey;
    std::string consumerSecret;

    void loadConfig() {
        auto path = QCoreApplication::applicationDirPath().toStdString() + "/../Resources/config.yaml";
        auto pathPriv = QCoreApplication::applicationDirPath().toStdString() + "/../Resources/config-priv.yaml";

        YAML::Node config = YAML::LoadFile(path);
        YAML::Node configPriv = YAML::LoadFile(pathPriv);

        this->devToken = configPriv["devToken"].as<std::string>();
        this->userStorePath = config["userStorePath"].as<std::string>();
        this->noteStorePath = config["noteStorePath"].as<std::string>();
        this->endpoint = config["debugEndpoint"].as<std::string>();
        this->consumerKey = configPriv["consumerKey"].as<std::string>();
        this->consumerSecret = configPriv["consumerSecret"].as<std::string>();
    }

    std::string urlBase() const {
        return "https://" + endpoint;
    }
};

};


#endif // CONSTANTS_H
