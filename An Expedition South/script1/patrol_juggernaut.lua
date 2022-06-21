State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = { },
        Actions = {
            SquadGridPatrol {
                Tag ="patrol_juggernaut",
                TargetTag = "path_patrol_juggernaut"
            }
        }
    };
};