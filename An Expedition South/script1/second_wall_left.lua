State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = { },
        Actions = {
            EntityHealthSet {
                Tag = "second_wall_left",
                Percent = 50
            },
            SquadBarrierMount {
                Tag = "sg_second_wall_left_mount",
                TargetTag = "second_wall_left"
            }
        }
    };
    OnOneTimeEvent {
        Conditions = {
            BarrierModulePercentageIsDead {
                Tag = "second_wall_left",
                Percent = 70
            }
        },
        Actions = {
            BarrierDestroy {
                Tag = "second_wall_left"
            },
            MapFlagSetTrue {
                Name = "mf_second_wall_left_destroyed"
            }
        }
    };
    OnOneTimeEvent {
        MapFlagIsTrue {
            Name = "mf_second_wall_left_destroyed"
        },
        ScriptGroupAliveAmountIsEqual {
            Group = "sg_camp_second_left",
            Value = 0
        },
        Actions = {
            MissionTaskSetSolved {
                Player = "pl_Player1",
                TaskTag = "goal_capture_second_wall", 
                TargetTag = "second_wall_left", 
                Summary = "Recapture territory from the fire troops."
            }
        }
    };
};