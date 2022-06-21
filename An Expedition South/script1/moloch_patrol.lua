State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = { },
        Actions = {
            SquadGridPatrol {
                Tag ="moloch_patrol",
                TargetTag = "moloch_patrol_path"
            }
        }
    };
};