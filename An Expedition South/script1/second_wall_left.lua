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
        Conditions = {
            MapFlagIsTrue {
                Name = "mf_second_wall_left_destroyed"
            },
        },
        Actions = {
            MissionTaskSetSolved {
                Player = "pl_Player1",
                TaskTag = "goal_advance_to_the_north", 
                TargetTag = "second_wall_left", 
                Summary = "Capture territory from the fire troops."
            }
        }
    };
};