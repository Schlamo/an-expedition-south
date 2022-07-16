--Aspect

OnRespawnEvent {
    RespawnDelaySeconds = aspectFrequencyInSeconds,
    TargetTag = "camp_second_aspect_spawnpoint",
    Conditions = {
        BuildingIsAlive {
            Tag = "camp_second_aspect_spawner"
        },
        MapTimerIsElapsed {
            Name = "mt_global",
            Seconds = aspectInitialDelay + (aspectFrequencyInSeconds * 3)
        }
    },
    Actions = {
        SquadGotoForced {
            Tag = "aspect2", 
            TargetTag = "fire_crystal"
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
            Text = "A new fire aspect aspect spawned!"
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
    }
};

--Start Conversion
OnEvent {
    Conditions = {
        EntityIsInRange {
            Tag = "aspect2",
            TargetTag = "fire_crystal",
            Range = 5
        },
        MapFlagIsFalse {
            Name = "mf_aspect2_conversion_active"
        }
    },
    Actions = {
        MapFlagSetTrue {
            Name = "mf_aspect2_conversion_active"
        },
        MapTimerStart {
            Name = "mt_aspect2_conversion"
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
            Tag = "aspect2",
        }
    },
    Actions = {
        MiniMapAlert {
            TargetTag = "aspect2",
            AlertType = AlertQuest
        }
    }
};

State {
    StateName = "INIT"
};