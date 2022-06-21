State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = { },
        Actions = {
            SquadKill {
                Tag ="sg_battleground_camp_wave_b",
            }
        }
    },
    OnRespawnEvent {
        StartDespawned = true,
        TargetTag = "battleground_camp_spawnerpoint_b",
        RespawnDelaySeconds = 120,
        HealthPercent = 100,
        Conditions = {
            MapTimerIsElapsed {
                Name = "mt_post_fireback_phase", 
                Seconds = 120
            },
            BuildingIsAlive {
                Tag = "battleground_camp_spawner_b",
                For = "All"
            }
        },
        Actions = {
            SquadGridGoto {
                Tag = "sg_battleground_camp_wave_b", 
                TargetTag = "fireback_camp_target"
            }
        }
    };
};