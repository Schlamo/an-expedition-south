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
            }
        }
    };
};
