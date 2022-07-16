--Aspect

OnRespawnEvent {
    RespawnDelaySeconds = aspectFrequencyInSeconds,
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
            TargetTag = "fire_crystal"
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
            Text = "A new fire aspect aspect spawned!"
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
    }
};

--Start Conversion
OnEvent {
    Conditions = {
        EntityIsInRange {
            Tag = "aspect3",
            TargetTag = "fire_crystal",
            Range = 5
        },
        MapFlagIsFalse {
            Name = "mf_aspect3_conversion_active"
        }
    },
    Actions = {
        MapFlagSetTrue {
            Name = "mf_aspect3_conversion_active"
        },
        MapTimerStart {
            Name = "mt_aspect3_conversion"
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
            Tag = "aspect3",
        }
    },
    Actions = {
        MiniMapAlert {
            TargetTag = "aspect3",
            AlertType = AlertQuest
        }
    }
};

State {
    StateName = "INIT"
};