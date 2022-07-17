OnRespawnEvent {
    RespawnDelaySeconds = 0,
    TargetTag = "fire_altar_target",
    Conditions = {
        BuildingIsAlive {
            Tag = "fire_altar"
        },
        MapTimerIsElapsed {
            Name = "mt_aspect3_conversion",
            Seconds = 5
        },
        MapFlagIsTrue {
            Name = "mf_aspect3_conversion_active"
        }
    },
    Actions = {
        SquadVanish {
            Tag = "aspect3"
        },
        SquadGoto {
            Tag = "converted_aspect3", 
            TargetTag = "converted_aspect_target"
        },
        MapFlagSetFalse {
            Name = "mf_aspect3_conversion_active"
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "converted_aspect3",
            MaxHealthAbsolute = 2000
        },
        MapFlagSetTrue {
            Name = "mf_converted_aspect_spawned"
        }
    }
};

State {
    StateName = "INIT"
};