State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = { },
        Actions = {
            EntityHealthSet {
                Tag = "first_wall_left",
                Percent = 25
            },
            SquadBarrierMount {
                Tag = "sg_first_wall_left_mount",
                TargetTag = "first_wall_left"
            }
        }
    };
    OnOneTimeEvent {
        Conditions = {
            BarrierModulePercentageIsDead {
                Tag = "first_wall_left",
                Percent = 50
            }
        },
        Actions = {
            BarrierDestroy {
                Tag = "first_wall_left"
            },
            MapFlagSetTrue {
                Name = "mf_first_wall_left_destroyed"
            }
        }
    };
    OnOneTimeEvent {
        Conditions = {
            MapFlagIsTrue {
                Name = "mf_first_wall_left_destroyed"
            },
            ScriptGroupAliveAmountIsEqual {
                Group = "sg_camp_second_left",
                Value = 0
            }
        },
        Actions = {
            MissionTaskSetSolved {
                Player = "pl_Player1",
                TaskTag = "goal_capture_first_wall", 
                TargetTag = "first_wall_left", 
                Summary = "Recapture territory from the fire troops."
            },
            MissionTaskSetActive {
                Player = "pl_Player1",
                TaskTag = "goal_advance_to_the_north", 
                TargetTag = "second_wall_left", 
                Summary = "Advance to the north."
            }
        }
    }
};