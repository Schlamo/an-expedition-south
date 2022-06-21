State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = { },
        Actions = {
            SquadGridPatrol {
                Tag ="patrol_emberstrike_right",
                TargetTag = "path_patrol_emberstrike_right"
            }
        }
    };
};