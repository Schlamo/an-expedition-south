State {
    StateName = "INIT",
    OnIntervalEvent {
        Seconds = 1,
        Conditions = {
            BuildingIsAlive {
                Tag = "volcano_a_spawner"
            },
            BuildingIsAlive {
                Name = "volcano_a"
            },
        },
        Actions = {
            EntityHealthAdd {
                Tag = "volcano_a_spawner",
                Percent = 100
            }
        }
    };

    OnIntervalEvent {
        Seconds = 1,
        Conditions = {
            BuildingIsAlive {
                Tag = "volcano_b_spawner"
            },
            BuildingIsAlive {
                Name = "volcano_b"
            },
        },
        Actions = {
            EntityHealthAdd {
                Tag = "volcano_b_spawner",
                Percent = 100
            }
        }
    };

    OnOneTimeEvent {
        Conditions = {
            BuildingIsDestroyed {
                Name = "volcano_a_spawner"
            },
            BuildingIsDestroyed {
                Name = "volcano_b_spawner"
            }
        },
        Actions = {
            MissionTaskSetSolved {  
                Player = "pl_Player2",
                TaskTag = "goal_withstand_the_incoming_waves", 
                TargetTag = "sg_volcano_spawners", 
                Summary = "Withstand the incoming waves."
            },
            MapFlagSetTrue {
                Name = "mf_goal_withstand_the_incoming_waves_solved"
            }
        }
    }
};
 