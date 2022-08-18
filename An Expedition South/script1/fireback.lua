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
            }
        }
    };
};
