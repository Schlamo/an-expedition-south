OnRespawnEvent {
    RespawnDelaySeconds = 0,
    TargetTag = "fire_altar_target",
    Conditions = {
        BuildingIsAlive {
            Tag = "fire_altar"
        },
        MapTimerIsElapsed {
            Name = "mt_aspect2_conversion",
            Seconds = 5
        },
        MapFlagIsTrue {
            Name = "mf_aspect2_conversion_active"
        }
    },
    Actions = {
        SquadVanish {
            Tag = "aspect2"
        },
        SquadGoto {
            Tag = "converted_aspect2", 
            TargetTag = "converted_aspect_target"
        },
        MapFlagSetFalse {
            Name = "mf_aspect2_conversion_active"
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "converted_aspect2",
            MaxHealthAbsolute = 1500
        },
        MapFlagSetTrue {
            Name = "mf_converted_aspect_spawned"
        }
    }
};

State {
    StateName = "INIT"
};