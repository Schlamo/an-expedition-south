State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = {     
        },
        Actions = {
            SquadGridPatrol {
                Tag ="fire_worm_patrol",
                TargetTag = "fire_path_worm_patrol"
            }
        }
    };
};
