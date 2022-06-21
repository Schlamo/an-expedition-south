State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = { },
        Actions = {
            SquadKill {
                Tag ="sg_second_base_wave_a",
            }
        }
    },
    OnRespawnEvent {
        StartDespawned = false,
        TargetTag = "second_base_spawnpoint",
        RespawnDelaySeconds = 30,
        HealthPercent = 100,
        Conditions = {
            MapTimerIsElapsed {
                Name = "mt_first_base_spawner_destroyed",
                Seconds = 60
            },
            BuildingIsAlive {
                For = "ALL", 
                Tag = "second_base_spawner"
            },
        },
        Actions = {
            SquadGridGoto {
                Tag = "sg_second_base_wave_a", 
                TargetTag = "converted_aspect_target"
            }
        }
    };
};