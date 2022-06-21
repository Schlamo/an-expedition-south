State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = { },
        Actions = {
            SquadGridGoto {
                Tag = "sg_first_wave_frost",
                TargetTag = "marker_fow_glance"
            }
        }
    }
};