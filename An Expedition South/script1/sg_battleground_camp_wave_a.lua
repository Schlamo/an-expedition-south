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
        RespawnDelaySeconds = 120,
        HealthPercent = 100,
        Conditions = {
            MapTimerIsElapsed {
                Name = "mt_post_fireback_phase", 
                Seconds = 60
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