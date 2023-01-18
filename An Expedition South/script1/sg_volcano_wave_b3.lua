State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = { },
        Actions = {
            SquadKill {
                Tag ="sg_volcano_wave_b3",
            }
        }
    },
    OnRespawnEvent {
        StartDespawned = true,
        TargetTag = "volcano_b_spawnpoint",
        RespawnDelaySeconds = 60,
        HealthPercent = 100,
        Conditions = {
            MapFlagIsTrue {
                Name = "mf_spawn_wave_volcano_b",
            },
            BuildingIsAlive {
                For = "ALL", 
                Tag = "volcano_b_spawner"
            },
            MapValueIsGreaterOrEqual {
                Name = "volcano_b_wave_counter",
                Value = 5
            }
        },
        Actions = {
            SquadGridGoto {
                Tag = "sg_volcano_wave_b3", 
                TargetTag = "fireback_camp_target"
            },
        }
    };
};
