State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = { },
        Actions = {
            SquadKill {
                Tag ="sg_fake_aspect_wave",
            }
        }
    },
    OnRespawnEvent {
        StartDespawned = false,
        TargetTag = "fake_aspect_spawnpoint",
        RespawnDelaySeconds = 120,
        HealthPercent = 100,
        Conditions = {
            MapTimerIsElapsed {
                Name = "mt_global",
                Seconds = (aspectInitialDelay - 30) + (aspectFrequencyInSeconds * 6)
            },
            BuildingIsAlive {
                For = "ALL", 
                Tag = "fake_aspect_spawner"
            },
        },
        Actions = {
            SquadGridGoto {
                Tag = "sg_fake_aspect_wave", 
                TargetTag = "moloch_target"
            }
        }
    };
};