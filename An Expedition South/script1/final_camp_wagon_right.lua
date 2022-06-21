State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = { },
        Actions = {
            SquadGridPatrol {
                Tag ="final_camp_wagon_right",
                TargetTag = "final_camp_wagon_path_right"
            },
            SquadGridPatrol {
                Tag ="final_camp_wagon_right1",
                TargetTag = "final_camp_wagon_path_right"
            }
        }
    };
};