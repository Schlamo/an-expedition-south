--Aspect

OnRespawnEvent {
    RespawnDelaySeconds = 0,
    TargetTag = "camp_first_aspect_spawnpoint",
    Conditions = {
        EntityIsDead {
            Tag = "converted_aspect1"
        },
        BuildingIsAlive {
            Tag = "camp_first_aspect_spawner"
        },
        MapTimerIsElapsed {
            Name = "mt_aspect1_respawn",
            Seconds = 10
        },
        MapFlagIsTrue {
            Name = "mf_aspect1_respawn_enabled"
        },
        MapTimerIsElapsed {
            Name = "mt_global",
            Seconds = aspectInitialDelay + aspectFrequencyInSeconds
        }
    },
    Actions = {
        MapTimerStop {
            Name = "mt_aspect1_respawn"
        },
        SquadGotoForced {
            Tag = "aspect1", 
            TargetTag = "fire_crystal"
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "aspect1",
            MaxHealthAbsolute = 300
        },
        AudioSoundUIPlay {
            Sound = "sfx_global_horn"
        },
        MissionOutcry {
            PortraitFileName = "moon",
            DurationSeconds = 8,
            TextTag = "",
            Player = "ALL",
            Text = "A new fire aspect aspect spawned!"
        },
        AudioSoundUIPlay {
            Sound = "sfx_global_horn"
        },
        FogOfWarObserve {
            TargetTag = "aspect1",
            Range = 25,
            Team = "tm_Team1"
        },
        MiniMapAlert {
            TargetTag = "aspect1",
            AlertType = 5
        },
        MapFlagSetFalse {
            Name = "mf_aspect1_respawn_enabled"
        }
    },
    OnDeathActions = {
        MapTimerStart {
            Name = "mt_aspect1_respawn"
        }
    }
};

--Start Conversion
OnEvent {
    Conditions = {
        EntityIsInRange {
            Tag = "aspect1",
            TargetTag = "fire_crystal",
            Range = 5
        },
        MapFlagIsFalse {
            Name = "mf_aspect1_conversion_active"
        }
    },
    Actions = {
        MapFlagSetTrue {
            Name = "mf_aspect1_conversion_active"
        },
        MapTimerStart {
            Name = "mt_aspect1_conversion"
        },
        MissionOutcry {
            PortraitFileName = "moon",
            DurationSeconds = 1,
            TextTag = "",
            Player = "ALL",
            Text = "Start Conversion!"
        },
    }
}

OnIntervalEvent {
    Seconds = 1,
    Conditions = { 
        SquadIsAlive {
            Tag = "aspect1",
        }
    },
    Actions = {
        MiniMapAlert {
            TargetTag = "aspect1",
            AlertType = AlertQuest
        }
    }
};


State {
    StateName = "INIT"
};