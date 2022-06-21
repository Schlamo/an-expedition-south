State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = { },
        Actions = {
            SquadGridPatrol {
                Tag ="patrol_fireworm",
                TargetTag = "path_patrol_fireworm"
            }
        }
    };
};