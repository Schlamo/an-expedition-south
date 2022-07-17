OnRespawnEvent {
    RespawnDelaySeconds = 0,
    TargetTag = "fire_altar_target",
    Conditions = {
        BuildingIsAlive {
            Tag = "fire_altar"
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
        MapFlagSetTrue {
            Name = "mf_converted_aspect_spawned"
        }
    }
};

State {
    StateName = "INIT"
};