OnRespawnEvent {
    RespawnDelaySeconds = 0,
    TargetTag = "fire_crystal",
    Conditions = {
        BuildingIsAlive {
            Tag = "fire_crystal"
        },
        MapTimerIsElapsed {
            Name = "mt_aspect4_conversion",
            Seconds = 5
        },
        MapFlagIsTrue {
            Name = "mf_aspect4_conversion_active"
        }
    },
    Actions = {
        SquadVanish {
            Tag = "aspect4"
        },
        SquadGoto {
            Tag = "converted_aspect4", 
            TargetTag = "converted_aspect_target"
        },
        MapFlagSetFalse {
            Name = "mf_aspect4_conversion_active"
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "converted_aspect4",
            MaxHealthAbsolute = 2500
        },
    }
};

OnIntervalEvent {
    Seconds = 1,
    Conditions = { 
    },
    Actions = {
        MiniMapAlert {
            TargetTag = "converted_aspect4",
            AlertType = AlertQuest
        }
    }
};

State {
    StateName = "INIT"
};