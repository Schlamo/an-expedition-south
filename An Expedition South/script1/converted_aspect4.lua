OnRespawnEvent {
    RespawnDelaySeconds = 0,
    TargetTag = "fire_altar_target",
    Conditions = {
        BuildingIsAlive {
            Tag = "fire_altar"
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
        MapFlagSetTrue {
            Name = "mf_converted_aspect_spawned"
        }
    }
};

State {
    StateName = "INIT"
};