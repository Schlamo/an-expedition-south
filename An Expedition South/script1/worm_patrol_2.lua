State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = {     
        },
        Actions = {
            SquadGridPatrol {
                Tag ="worm_patrol_2",
                TargetTag = "path_worm_patrol_2"
            }
        }
    };
};
