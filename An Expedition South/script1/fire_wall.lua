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

OnOneTimeEvent {
    Conditions = {
        EntityHealthIsLess {
            Tag = "fire_wall",
            Percent = 100
        }, 
        BuildingIsAlive {
            Tag = "fire_altar"
        }
    },
    Actions = {
        MapFlagSetTrue {
            Name = "fire_wall_thingy"
        },
        MissionOutcry {
            PortraitFileName = "moon",
            DurationSeconds = 5,
            TextTag = "",
            Player = "ALL",
            Text = "Breaking down that wall won't be all too easy. There must be another way to weaken it."
        },
        MissionTaskSetActive {
            Player = "pl_Player2",
            TaskTag = "goal_penetrate_the_flame_wall", 
            TargetTag = "fire_wall", 
            Summary = "Penetrate the Wall of Flames."
        },
    }
}

State {
    StateName = "INIT"
};