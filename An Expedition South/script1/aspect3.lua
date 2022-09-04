--Aspect

OnRespawnEvent {
    RespawnDelaySeconds = aspectFrequencyInSeconds-20,
    TargetTag = "camp_third_aspect_spawnpoint",
    Conditions = {
        BuildingIsAlive {
            Tag = "camp_third_aspect_spawner"
        },
        MapTimerIsElapsed {
            Name = "mt_global",
            Seconds = aspectInitialDelay + (aspectFrequencyInSeconds * 6)
        }
    },
    Actions = {
        SquadGotoForced {
            Tag = "aspect3", 
            TargetTag = "fire_altar_target"
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "aspect3",
            MaxHealthAbsolute = 2000
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
            TargetTag = "aspect3",
            Range = 25,
            Team = "tm_Team1"
        },
        MiniMapAlert {
            TargetTag = "aspect3",
            AlertType = 5
        },
        MapFlagSetTrue {
            Name = "mf_aspect_spawned"
        }
    }
};

--Start Conversion
OnIntervalEvent {
    Seconds = 1,
    Conditions = {
        EntityIsInRange {
            Tag = "aspect3",
            TargetTag = "fire_altar_target",
            Range = 5
        },
        MapFlagIsFalse {
            Name = "mf_aspect3_conversion_active"
        }
    },
    Actions = {
        CutsceneCameraPlay {
            Camera = "conversion_cam"
        },
        MapFlagSetTrue {
            Name = "mf_aspect3_conversion_active"
        },
        EffectStart {
            Effect = "effect_global_level_transformation_fire",
            Tag = "fire_altar_target"
        },
        MapTimerStart {
            Name = "mt_aspect3_conversion"
        },
        MissionOutcry {
            PortraitFileName = "moon",
            DurationSeconds = 1,
            TextTag = "",
            Player = "ALL",
            Text = "Moon: Start Conversion!"
        },
    }
}

State {
    StateName = "INIT"
};