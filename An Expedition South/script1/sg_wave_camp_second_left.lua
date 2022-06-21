State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = { },
        Actions = {
            SquadKill {
                Tag = "sg_wave_camp_second_left"
            }
        }
    },
    
    OnRespawnEvent {
        StartDespawned = right,
        TargetTag = "camp_second_left_spawnpoint",
        RespawnDelayMinutes = 0,
        RespawnDelaySeconds = 45,
        HealthPercent = 100,
        Conditions = {
			MapFlagIsTrue	{
                Name = "mf_spawn_wave_camp_second_left"
            },
            BuildingIsAlive {
                For = "ALL", 
                Tag = "camp_second_left_spawner"
            }
        },
        Actions = {
            SquadGridGoto {
                Tag = "sg_wave_camp_second_left", 
                TargetTag = "path_wave_camp_second_left"
            },
        },
    };
};