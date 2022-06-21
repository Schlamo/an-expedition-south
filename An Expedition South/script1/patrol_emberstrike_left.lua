State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = { },
        Actions = {
            SquadGridPatrol {
                Tag ="patrol_emberstrike_left",
                TargetTag = "path_patrol_emberstrike_left"
            }
        }
    };
};