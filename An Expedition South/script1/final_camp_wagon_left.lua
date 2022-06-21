State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = { },
        Actions = {
            SquadGridPatrol {
                Tag ="final_camp_wagon_left",
                TargetTag = "final_camp_wagon_path_left"
            },
            SquadGridPatrol {
                Tag ="final_camp_wagon_left1",
                TargetTag = "final_camp_wagon_path_left"
            }
        }
    };
};