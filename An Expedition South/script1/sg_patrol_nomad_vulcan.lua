State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = { },
        Actions = {
            SquadGridPatrol {
                Tag ="sg_patrol_nomad_vulcan",
                TargetTag = "path_patrol_nomad_vulcan"
            }
        }
    }
};