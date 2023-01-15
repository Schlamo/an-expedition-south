--Aspect

OnRespawnEvent {
    RespawnDelaySeconds = aspectFrequencyInSeconds-10,
    TargetTag = "camp_second_aspect_spawnpoint",
    Conditions = {
        BuildingIsAlive {
            Tag = "camp_second_aspect_spawner"
        },
        MapTimerIsElapsed {
            Name = "mt_global",
            Seconds = aspectInitialDelay + (aspectFrequencyInSeconds * 3)
        },
        SquadIsDead {
            Tag = "converted_aspect2",
        }
    },
    Actions = {
        SquadGotoForced {
            Tag = "aspect2", 
            TargetTag = "aspect_target"
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "aspect2",
            MaxHealthAbsolute = 1500
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
            TargetTag = "aspect2",
            Range = 25,
            Team = "tm_Team1"
        },
        MiniMapAlert {
            TargetTag = "aspect2",
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
            Tag = "aspect2",
            TargetTag = "fire_altar_target",
            Range = 5
        },
        MapFlagIsFalse {
            Name = "mf_aspect2_conversion_active"
        },
        BuildingIsAlive {
            Tag = "fire_altar"
        }
    },
    Actions = {
        CutsceneCameraPlay {
            Camera = "conversion_cam"
        },
        MapFlagSetTrue {
            Name = "mf_aspect2_conversion_active"
        },
        EffectStart {
            Effect = "effect_global_level_transformation_fire",
            Tag = "aspect2"
        },
        MapTimerStart {
            Name = "mt_aspect2_conversion"
        },
    }
}

State {
    StateName = "INIT"
};