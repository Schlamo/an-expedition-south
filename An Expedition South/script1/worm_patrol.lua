State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = {     
        },
        Actions = {
            SquadGridPatrol {
                Tag ="worm_patrol",
                TargetTag = "path_worm_patrol"
            }
        }
    };
};
