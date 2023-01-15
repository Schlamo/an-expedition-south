OnIntervalEvent {
    Seconds = 1,
    Conditions = {            
        BuildingIsAlive {
            Tag = "fire_altar",
        }
    },
    Actions = {
        EntityHealthAdd {
            Tag = "fire_wall",
            Percent = 20
        }
    }
};

State {
    StateName = "INIT"
};