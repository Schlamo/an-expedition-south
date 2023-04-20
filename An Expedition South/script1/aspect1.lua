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
        },
        SquadIsDead {
            Tag = "converted_aspect1",
        },
        BuildingIsAlive {
            Tag = "fire_altar"
        }
    },
    Actions = {
        SquadGotoForced {
            Tag = "aspect1", 
            TargetTag = "aspect_target"
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
        },
        BuildingIsAlive {
            Tag = "fire_altar"
        }
    },
    Actions = {
        MapFlagSetTrue {
            Name = "mf_aspect1_conversion_active"
        },
        EffectStart {
            Effect = "effect_global_level_transformation_fire",
            Tag = "aspect1"
        },
        MapTimerStart {
            Name = "mt_aspect1_conversion"
        },
        CutsceneCameraPlay {
            Camera = "conversion_cam"
        }
    }
};

State {
    StateName = "INIT"
};