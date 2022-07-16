OnRespawnEvent {
    RespawnDelaySeconds = 0,
    TargetTag = "fire_crystal",
    Conditions = {
        BuildingIsAlive {
            Tag = "fire_crystal"
        },
        MapTimerIsElapsed {
            Name = "mt_aspect1_conversion",
            Seconds = 5
        },
        MapFlagIsTrue {
            Name = "mf_aspect1_conversion_active"
        }
    },
    Actions = {
        SquadVanish {
            Tag = "aspect1"
        },
        SquadGoto {
            Tag = "converted_aspect1", 
            TargetTag = "converted_aspect_target"
        },
        MapFlagSetFalse {
            Name = "mf_aspect1_conversion_active"
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "converted_aspect1",
            MaxHealthAbsolute = 1000
        },
    }
};

OnIntervalEvent {
    Seconds = 1,
    Conditions = { 
    },
    Actions = {
        MiniMapAlert {
            TargetTag = "converted_aspect1",
            AlertType = AlertQuest
        }
    }
};

State {
    StateName = "INIT"
};