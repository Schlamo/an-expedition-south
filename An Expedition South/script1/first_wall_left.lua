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
            }
        }
    };
};