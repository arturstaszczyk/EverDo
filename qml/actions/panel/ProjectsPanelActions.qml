pragma Singleton
import QtQuick 2.0
import QuickFlux 1.1
import "./"

ActionCreator {

    signal selectProjectType(int guid);

    signal selectProject(int guid, string name);

}

