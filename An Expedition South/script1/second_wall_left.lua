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
                Percent = 50
            }
        },
        Actions = {
            BarrierDestroy {
                Tag = "second_wall_left"
            },
            MapTimerStart {
                Name = "mt_second_wall_left_destroyed"
            }
        }
    };
};