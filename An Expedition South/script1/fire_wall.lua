State {
    StateName = "INIT",
    OnIntervalEvent {
        Seconds = 1,
        Conditions = {            
            BuildingIsAlive {
                Tag = "fire_altar",
            }
        },
        Actions = {
            EntityHealthSet {
                Tag = "fire_wall",
                Percent = 100
            }
        }
    };
};
