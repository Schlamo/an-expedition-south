State {
    StateName = "INIT",
    OnRespawnEvent {
        StartDespawned = false,
        TargetTag = "enforcer_spawnpoint",
        RespawnDelaySeconds = 10,
        HealthPercent = 100,
        Conditions = {
            MapTimerIsElapsed {
                Name = "mt_post_fireback_phase",
                Seconds = 60
            },
            BuildingIsAlive {
                For = "ALL", 
                Tag = "enforcer_spawner"
            },
        },
        Actions = {
            SquadGridGoto {
                Tag = "sg_enforcer_wave_a", 
                TargetTag = "fireback_camp_target"
            }
        }
    };
};