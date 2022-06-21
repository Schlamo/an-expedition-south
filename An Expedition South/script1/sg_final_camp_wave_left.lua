State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = { },
        Actions = {
            SquadKill {
                Tag ="sg_final_camp_wave_left",
            }
        }
    },
    OnRespawnEvent {
        StartDespawned = true,
        TargetTag = "final_camp_wave_left_spawnpoint",
        RespawnDelaySeconds = 30,
        HealthPercent = 100,
        Conditions = {
            MapFlagIsTrue {
                Name = "mf_abaddon_fight_ongoing",
            },
        },
        Actions = {
            SquadGridGoto {
                Tag = "sg_final_camp_wave_left", 
                TargetTag = "abaddon"
            }
        }
    };
};