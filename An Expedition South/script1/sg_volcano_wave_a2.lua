State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = { },
        Actions = {
            SquadKill {
                Tag ="sg_volcano_wave_a2",
            }
        }
    },
    OnRespawnEvent {
        StartDespawned = true,
        TargetTag = "volcano_a_spawnpoint",
        RespawnDelaySeconds = 30,
        HealthPercent = 100,
        Conditions = {
            MapFlagIsTrue {
                Name = "mf_spawn_wave_volcano_a",
            },
            BuildingIsAlive {
                For = "ALL", 
                Tag = "volcano_a_spawner"
            },
            MapValueIsGreaterOrEqual {
                Name = "volcano_a_wave_counter",
                Value = 2
            }
        },
        Actions = {
            SquadGridGoto {
                Tag = "sg_volcano_wave_a2", 
                TargetTag = "fireback_camp_target"
            },
        }
    };
};
