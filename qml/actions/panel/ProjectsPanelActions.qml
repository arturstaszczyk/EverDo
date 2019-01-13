pragma Singleton
import QtQuick 2.9
import QuickFlux 1.1
import "./"

ActionCreator {

    signal selectProjectType(int guid);

    signal selectProject(int guid, string name);

    signal setCategoriesDefinitions(var categories);

    signal setProjectsDefinitions(var projects);

}
