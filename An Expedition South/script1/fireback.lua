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
};
