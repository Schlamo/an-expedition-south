State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = { },
        Actions = {
            SquadGridPatrol {
                Tag ="patrol_magmafiend",
                TargetTag = "path_patrol_magmafiend"
            }
        }
    };
};