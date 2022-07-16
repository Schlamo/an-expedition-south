State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = { },
        Actions = {
            SquadKill {
                Tag ="sg_first_base_wave_a",
            }
        }
    },
    OnRespawnEvent {
        StartDespawned = false,
        TargetTag = "first_base_spawnpoint",
        RespawnDelaySeconds = 40,
        HealthPercent = 100,
        Conditions = {
            MapTimerIsElapsed {
                Name = "mt_first_camp_destroyed",
                Seconds = 150
            },
            BuildingIsAlive {
                For = "ALL", 
                Tag = "first_base_spawner"
            },
        },
        Actions = {
            SquadGridGoto {
                Tag = "sg_first_base_wave_a", 
                TargetTag = "converted_aspect_target"
            }
        }
    };
};