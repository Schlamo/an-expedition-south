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
            },
            BuildingDestroy {
                Tag = "volcano_b_spawner"
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
    };

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
            },
            BuildingDestroy {
                Tag = "volcano_a_spawner"
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
                Player = "pl_Player2",
                TaskTag = "goal_withstand_the_incoming_waves", 
                TargetTag = "sg_volcano_spawners", 
                Summary = "Withstand the incoming waves."
            },
            MissionTaskSetSolved {  
                Player = "pl_Player1",
                TaskTag = "goal_destroy_both_volcanos", 
                TargetTag = "first_wall_left", 
                Summary = "Capture territory from the fire troops."
            },
            MapFlagSetTrue {
                Name = "mf_goal_destroy_both_volcanos_solved"
            },
            MapFlagSetTrue {
                Name = "mf_goal_withstand_the_incoming_waves_solved"
            }
        }
    };

    OnOneTimeEvent {
        Conditions = {
            BuildingIsDestroyed {
                Tag = "volcano_a_spawner"
            }
        },
        Actions = {
            EffectVanish {
                Tag = "volcano_a_effect2"
            }
        }
    };

    OnOneTimeEvent {
        Conditions = {
            BuildingIsDestroyed {
                Tag = "volcano_b_spawner"
            }
        },
        Actions = {
            EffectVanish {
                Tag = "volcano_b_effect2"
            }
        }
    };
};
 