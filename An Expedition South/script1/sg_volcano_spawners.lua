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
            MapFlagIsTrue {
                Name = "mf_volcano_spawner_a_destroyed"
            },
            MapFlagIsTrue {
                Name = "mf_volcano_spawner_b_destroyed"
            },
            ScriptGroupAliveAmountIsEqual {
                Group = "sg_volcano_wave_a1",
                Value = 0
            },
            ScriptGroupAliveAmountIsEqual {
                Group = "sg_volcano_wave_a2",
                Value = 0
            },
            ScriptGroupAliveAmountIsEqual {
                Group = "sg_volcano_wave_a3",
                Value = 0
            },
            ScriptGroupAliveAmountIsEqual {
                Group = "sg_volcano_wave_a4",
                Value = 0
            },
            ScriptGroupAliveAmountIsEqual {
                Group = "sg_volcano_wave_b1",
                Value = 0
            },
            ScriptGroupAliveAmountIsEqual {
                Group = "sg_volcano_wave_b2",
                Value = 0
            },
            ScriptGroupAliveAmountIsEqual {
                Group = "sg_volcano_wave_b3",
                Value = 0
            },
        },
        Actions = {
            MissionTaskSetSolved {  
                Player = "All",
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
 