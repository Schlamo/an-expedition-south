State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = { },
        Actions = {
            SquadKill {
                Tag ="sg_third_aspect_wave",
            }
        }
    },
    OnRespawnEvent {
        StartDespawned = false,
        TargetTag = "camp_third_aspect_spawnpoint",
        RespawnDelaySeconds = 60,
        HealthPercent = 100,
        Conditions = {
            MapTimerIsElapsed {
                Name = "mt_global",
                Seconds = (aspectInitialDelay - 30) + (aspectFrequencyInSeconds * 3)
            },
            BuildingIsAlive {
                For = "ALL", 
                Tag = "camp_third_aspect_spawner"
            },
        },
        Actions = {
            SquadGridGoto {
                Tag = "sg_third_aspect_wave", 
                TargetTag = "moloch_target"
            }
        }
    };
};