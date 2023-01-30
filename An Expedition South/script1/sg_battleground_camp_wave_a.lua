State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = { },
        Actions = {
            SquadKill {
                Tag ="sg_battleground_camp_wave_a",
            }
        }
    },
    OnRespawnEvent {
        StartDespawned = true,
        TargetTag = "battleground_camp_spawnerpoint_a",
        RespawnDelaySeconds = 150,
        HealthPercent = 100,
        Conditions = {
            MapTimerIsElapsed {
                Name = "mt_fire_altar_destroyed", 
                Seconds = 120
            },
            BuildingIsAlive {
                Tag = "battleground_camp_spawner_a",
                For = "All"
            }
        },
        Actions = {
            SquadGridGoto {
                Tag = "sg_battleground_camp_wave_a", 
                TargetTag = "fireback_camp_target"
            }
        }
    };
};