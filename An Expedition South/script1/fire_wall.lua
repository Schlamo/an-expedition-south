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
        },
        BarrierModulePercentageIsAlive {
            Tag = "fire_wall",
            Percent = 100
        },
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
            Summary = "Break down the burning wall."
        },
    }
};

OnOneTimeEvent {
    Conditions = {
        BarrierModulePercentageIsDead {
            Tag = "fire_wall",
            Percent = 1
        },
        MapFlagIsTrue {
            Name = "fire_wall_thingy"
        }
    },
    Actions = {
        MissionTaskSetSolved {
            Player = "pl_Player2",
            TaskTag = "goal_penetrate_the_flame_wall", 
            TargetTag = "fire_wall", 
            Summary = "Break down the burning wall."
        }
    }
}

State {
    StateName = "INIT"
};