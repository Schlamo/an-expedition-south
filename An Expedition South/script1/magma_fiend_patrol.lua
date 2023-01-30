State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = {     
        },
        Actions = {
            SquadGridPatrol {
                Tag ="magma_fiend",
                TargetTag = "magma_fiend_patrol"
            }
        }
    };
};
