State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = { },
        Actions = {
            SquadGridPatrol {
                Tag ="sg_patrol_nomad_sunderer",
                TargetTag = "path_patrol_nomad_sunderer"
            }
        }
    },
    OnRespawnEvent {
        StartDespawned = false,
        TargetTag = "camp_second_aspect_spawnpoint",
        RespawnDelayMinutes = 0,
        RespawnDelaySeconds = 30,
        HealthPercent = 100,
        Conditions = {
            BuildingIsAlive {
                For = "ALL", 
                Tag = "camp_second_aspect_spawner"
            }
        },
        Actions = {
            SquadGridPatrol {
                Tag = "sg_SpawnA", 
                TargetTag = "path_patrol_nomad_sunderer"
            }
        }
    };
};