--Aspect

OnRespawnEvent {
    RespawnDelaySeconds = aspectFrequencyInSeconds,
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
            TargetTag = "fire_crystal"
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
            Text = "A new fire aspect aspect spawned!"
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
    }
};

--Start Conversion
OnEvent {
    Conditions = {
        EntityIsInRange {
            Tag = "aspect4",
            TargetTag = "fire_crystal",
            Range = 5
        },
        MapFlagIsFalse {
            Name = "mf_aspect4_conversion_active"
        }
    },
    Actions = {
        MapFlagSetTrue {
            Name = "mf_aspect4_conversion_active"
        },
        MapTimerStart {
            Name = "mt_aspect4_conversion"
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
            Tag = "aspect4",
        }
    },
    Actions = {
        MiniMapAlert {
            TargetTag = "aspect4",
            AlertType = AlertQuest
        }
    }
};

State {
    StateName = "INIT"
};