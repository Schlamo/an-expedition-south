State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = {            
            SquadIsDead {
                Tag = "fireback",
            }
        },
        Actions = {
            MapTimerStart {
                Name = "mt_fireback_killed", 
            },
            MissionTaskSetSolved {
                Player = "All",
                TaskTag = "goal_kill_fireback", 
                TargetTag = "fireback", 
                Summary = "Kill Fireback."
            },
            MissionOutcry {
                PortraitFileName = "moon",
                DurationSeconds = 8,
                TextTag = "",
                Player = "ALL",
                Text = "Moon: You killed the Fireback. Good job n stuff. Now you have to split up again."
            },
        }
    };
    
    OnOneTimeEvent {
        Conditions = { },
        Actions = {
            SquadBarrierMount {
                Tag = "sg_fireback_front_wall_archers",
                TargetTag = "fireback_front_wall"
            },
            SquadBarrierMount {
                Tag = "fireback_camp_squad",
                TargetTag = "fireback_left_wall"
            },
            SquadBarrierMount {
                Tag = "fireback_camp_squad1",
                TargetTag = "fireback_left_wall"
            },
            SquadBarrierMount {
                Tag = "fireback_camp_squad2",
                TargetTag = "fireback_left_wall"
            },
            SquadBarrierMount {
                Tag = "fireback_camp_squad5",
                TargetTag = "fireback_right_wall"
            },
            SquadBarrierMount {
                Tag = "fireback_camp_squad6",
                TargetTag = "fireback_right_wall"
            },
            SquadBarrierMount {
                Tag = "fireback_camp_squad8",
                TargetTag = "fireback_right_wall"
            },
        }
    };
};
