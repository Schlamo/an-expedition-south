--Aspect

OnRespawnEvent {
    RespawnDelaySeconds = aspectFrequencyInSeconds,
    TargetTag = "camp_first_aspect_spawnpoint",
    Conditions = {
        BuildingIsAlive {
            Tag = "camp_first_aspect_spawner"
        },
        MapTimerIsElapsed {
            Name = "mt_global",
            Seconds = aspectInitialDelay + aspectFrequencyInSeconds
        }
    },
    Actions = {
        SquadGotoForced {
            Tag = "aspect1", 
            TargetTag = "fire_altar_target"
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "aspect1",
            MaxHealthAbsolute = 1000
        },
        AudioSoundUIPlay {
            Sound = "sfx_global_horn"
        },
        MissionOutcry {
            PortraitFileName = "moon",
            DurationSeconds = 8,
            TextTag = "",
            Player = "ALL",
            Text = "Moon: An Aspect of Summer has spawned!"
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
        MapFlagSetTrue {
            Name = "mf_aspect_spawned"
        }
    },
    OnDeathActions = {
        MapTimerStart {
            Name = "mt_aspect1_missiontimer_timer"
        }
    }
};

OnIntervalEvent {
    Seconds = 1,
    Conditions = {
        MapTimerIsElapsed {
            Name = "mt_aspect1_missiontimer_timer",
            Seconds = aspectFrequencyInSeconds
        },
        MapFlagIsFalse {
            Name = "mf_timer_running"
        }
    },
    Actions = {

    }
};

--Start Conversion
OnIntervalEvent {
    Seconds = 1,
    Conditions = {
        EntityIsInRange {
            Tag = "aspect1",
            TargetTag = "fire_altar_target",
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
        EffectStart {
            Effect = "effect_global_level_transformation_fire",
            Tag = "fire_altar_target"
        },
        MapTimerStart {
            Name = "mt_aspect1_conversion"
        },
        MissionOutcry {
            PortraitFileName = "moon",
            DurationSeconds = 1,
            TextTag = "",
            Player = "ALL",
            Text = "Moon: Start Conversion!"
        },
        CutsceneCameraPlay {
            Camera = "conversion_cam"
        }
    }
};

State {
    StateName = "INIT"
};