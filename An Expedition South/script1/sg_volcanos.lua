State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = { },
        Actions = {
            MapValueSet {
                Name = "volcano_b_wave_counter",
                Value = 0
            },
        }
    },
    OnOneTimeEvent {
        Conditions = {
            BuildingIsDestroyed {
                For = "ANY", 
                Tag = "volcano_b", 
            }
        },
        Actions = {
            PlayerCardSpellFakePlay {
                TargetTag = "volcano_b",
                Player = "pl_Enemy1",
                CardSpellId = 355
            },
            PlayerCardSpellFakePlay {
                TargetTag = "volcano_b",
                Player = "pl_Enemy1",
                CardSpellId = 355
            },
            MapFlagSetTrue {
                Name = "mf_volcano_b_destroyed"
            },
            EffectVanish {
                Tag = "volcano_b_effect"
            }
        }
    };
    OnOneTimeEvent {
        Conditions = { },
        Actions = {
            MapValueSet {
                Name = "volcano_a_wave_counter",
                Value = 0
            },
        }
    },
    OnOneTimeEvent {
        Conditions = {
            BuildingIsDestroyed {
                For = "ANY", 
                Tag = "volcano_a", 
            }
        },
        Actions = {
            PlayerCardSpellFakePlay {
                TargetTag = "volcano_a",
                Player = "pl_Enemy1",
                CardSpellId = 355
            },
            PlayerCardSpellFakePlay {
                TargetTag = "volcano_a",
                Player = "pl_Enemy1",
                CardSpellId = 355
            },
            MapFlagSetTrue {
                Name = "mf_volcano_a_destroyed"
            },
            EffectVanish {
                Tag = "volcano_a_effect"
            }
        }
    };

    OnOneTimeEvent {
        Conditions = {
            MapFlagIsTrue {
                Name = "mf_volcano_a_destroyed"
            },
            MapFlagIsTrue {
                Name = "mf_volcano_b_destroyed"
            }
        },
        Actions = {
            MissionTaskSetSolved {  
                Player = "All",
                TaskTag = "goal_destroy_both_volcanos", 
                TargetTag = "first_wall_left", 
                Summary = "Recapture territory from the fire troops."
            },
        }
    }
};
 