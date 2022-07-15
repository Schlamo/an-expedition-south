OnRespawnEvent {
    RespawnDelaySeconds = 0,
    TargetTag = "fire_crystal",
    Conditions = {
        MapTimerIsElapsed {
            Name = "mt_aspect1_conversion",
            Seconds = 5
        },
        MapFlagIsTrue {
            Name = "mf_aspect1_conversion_active"
        }
    },
    Actions = {
        MapTimerStop {
            Name = "mt_aspect1_respawn"
        },
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
        MapFlagSetTrue {
            Name = "mf_aspect1_conversion_completed"
        },
        MapFlagSetTrue {
            Name = "converted_aspect1_active"  
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "converted_aspect1",
            MaxHealthAbsolute = 1000
        },
    },
    OnDeathActions = {
        MapTimerStart {
            Name = "mt_aspect1_respawn"
        },
        MapTimerStart {
            Name = "mt_converted_aspect1_becomes_inactive"
        },
    }
};

OnIntervalEvent {
    Seconds = 1,
    Conditions = { 
        SquadIsAlive {
            Tag = "converted_aspect1",
        }
    },
    Actions = {
        MiniMapAlert {
            TargetTag = "converted_aspect1",
            AlertType = AlertQuest
        }
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

OnIntervalEvent {
    Seconds = 1,
    Conditions = { 
        MapTimerIsElapsed {
            Name = "mt_converted_aspect1_becomes_inactive",
            Seconds = 120
        }
    },
    Actions = {
        MapFlagSetTrue {
            Name = "mf_aspect1_respawn_enabled"
        }
    }
};

State {
    StateName = "INIT"
};