State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = { },
        Actions = {
            SquadGridPatrol {
                Tag ="patrol_thunderwagon",
                TargetTag = "path_patrol_thunderwagon"
            }
        }
    }
};