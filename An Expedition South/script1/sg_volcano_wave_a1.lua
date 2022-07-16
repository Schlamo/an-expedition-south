State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = { },
        Actions = {
            SquadKill {
                Tag ="sg_volcano_wave_a1",
            }
        }
    },
    OnRespawnEvent {
        StartDespawned = true,
        TargetTag = "volcano_a_spawnpoint",
        RespawnDelaySeconds = 60,
        HealthPercent = 100,
        Conditions = {
            MapFlagIsTrue {
                Name = "mf_spawn_wave_volcano_a",
            },
            BuildingIsAlive {
                For = "ALL", 
                Tag = "volcano_a_spawner"
            }
        },
        Actions = {
            SquadGridGoto {
                Tag = "sg_volcano_wave_a1", 
                TargetTag = "fireback_camp_target"
            },
            MapValueIncrease {
                Name = "volcano_a_wave_counter"
            },
        }
    };
};