--Aspect

OnRespawnEvent {
    RespawnDelaySeconds = aspectFrequencyInSeconds-30,
    TargetTag = "camp_fourth_aspect_spawnpoint",
    Conditions = {
        BuildingIsAlive {
            Tag = "camp_fourth_aspect_spawner"
        },
        MapTimerIsElapsed {
            Name = "mt_global",
            Seconds = aspectInitialDelay + (aspectFrequencyInSeconds * 9)
        }
    },
    Actions = {
        SquadGotoForced {
            Tag = "aspect4", 
            TargetTag = "fire_altar_target"
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "aspect4",
            MaxHealthAbsolute = 2500
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
            TargetTag = "aspect4",
            Range = 25,
            Team = "tm_Team1"
        },
        MiniMapAlert {
            TargetTag = "aspect4",
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
            Tag = "aspect4",
            TargetTag = "fire_altar_target",
            Range = 5
        },
        MapFlagIsFalse {
            Name = "mf_aspect4_conversion_active"
        },
        BuildingIsAlive {
            Tag = "fire_crystal"
        }
    },
    Actions = {
        CutsceneCameraPlay {
            Camera = "conversion_cam"
        },
        MapFlagSetTrue {
            Name = "mf_aspect4_conversion_active"
        },
        EffectStart {
            Effect = "effect_global_level_transformation_fire",
            Tag = "fire_altar_target"
        },
        MapTimerStart {
            Name = "mt_aspect4_conversion"
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