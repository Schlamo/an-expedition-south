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
        RespawnDelaySeconds = 60,
        HealthPercent = 100,
        Conditions = {
            MapTimerIsElapsed {
                Name = "mt_global",
                Seconds = (aspectInitialDelay - 30) + (aspectFrequencyInSeconds * maxAspectsPerSpawner * 2)
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