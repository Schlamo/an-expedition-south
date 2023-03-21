local OrdinalNumbers = {
    [1] = "first",
    [2] = "second",
    [3] = "third",
    [4] = "fourth",
};

aspectInitialDelay         = 120; --default 120
aspectFrequencyInSeconds   = 90; --default 90
aspectRevealSpawnerInAdvance = 20; --default 20

function AspectSpawnerByIndex (index)
    return "camp_"..OrdinalNumbers[index].."_aspect_spawner"
end

function AspectSpawnerGoalByIndex (index)
    return "goal_destroy_"..OrdinalNumbers[index].."_aspect_spawner"
end

function AspectSpawnpointByIndex (index)
    return "camp_"..OrdinalNumbers[index].."_aspect_spawnpoint"
end

function GetSpawnerTagByAspectIndex(index) 
    if index >= 1 and index <= 3 then return AspectSpawnerByIndex(1); end
    if index >= 4 and index <= 6 then return AspectSpawnerByIndex(2); end
    if index >= 7 and index <= 9 then return AspectSpawnerByIndex(3); end
    if index >= 10 and index <= 12 then return AspectSpawnerByIndex(4); end
end

function GetSpawnpointTagByAspectIndex(index) 
    if index >= 1 and index <= 3 then return AspectSpawnerByIndex(1); end
    if index >= 4 and index <= 6 then return AspectSpawnerByIndex(2); end
    if index >= 7 and index <= 9 then return AspectSpawnerByIndex(3); end
    if index >= 10 and index <= 12 then return AspectSpawnerByIndex(4); end
end

OnEvent {
    Conditions = {
        MissionTimerIsElapsed {
            TimerTag = "goal_spawner_becomes_active",
            Seconds = aspectRevealSpawnerInAdvance
        }
    },
    Actions = {
        MissionTaskSetSolved {
            Player = "ALL", 
            TaskTag = "goal_spawner_becomes_active", 
            TargetTag = "sg_reinforcements", 
            Summary = ""
        },
        MissionTimerStop {
            Player = "All",
            TimerTag = "goal_spawner_becomes_active"
        },
    }
};
--Difficulties
OnOneTimeEvent {
    Conditions = {
        MissionDifficultyIsEqual {
            Difficulty = DifficultyStandard
        }
    },
    Actions = {
        --general stuff both players
        EntitySetMaxHealthAbsolute {
            TargetTag = "fire_altar",
            MaxHealthAbsolute = 5000
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "abaddon",
            MaxHealthAbsolute = 20000
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "volcano_a",
            MaxHealthAbsolute = 5000
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "volcano_b",
            MaxHealthAbsolute = 5000
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "final_camp_volcano_left",
            MaxHealthAbsolute = 3000
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "final_camp_volcano_right",
            MaxHealthAbsolute = 3000
        },
        --general stuff p2
        BuildingVanish {
            Tag = "some_rocket_tower"
        },
        SquadVanish {
            Tag = "sun_reaver1"
        },  
        SquadVanish {
            Tag = "sun_reaver2"
        },  
        --first patrol p2
        SquadVanish {
            Tag = "patrol_nomad_sunderer"
        },      
        --second patrol p2
        SquadVanish {
            Tag = "patrol_nomad_vulcan1"
        },        
        --first camp p2
        SquadVanish {
            Tag = "camp_first_well_right_squad1"
        },   
        SquadVanish {
            Tag = "camp_first_well_right_squad4"
        },   
        SquadVanish {
            Tag = "camp_first_well_right_tower"
        },
        --first aspect spawner camp p2
        PlayerBuildingSpawn {
            TargetTag = "camp_first_aspect_tower",
            Player = "pl_Enemy1",
            BuildingId = 39050
        },
        BuildingVanish {
            Tag = "camp_first_aspect_tower"
        },
        SquadVanish {
            Tag = "camp_first_aspect_squad5"
        },
        SquadVanish {
            Tag = "camp_first_aspect_squad7"
        },
        --second aspect spawner camp p2
        PlayerBuildingSpawn {
            TargetTag = "camp_second_aspect_tower3",
            Player = "pl_Enemy1",
            BuildingId = 39050
        },
        BuildingVanish {
            Tag = "camp_second_aspect_tower3"
        },
        --third aspect spawner camp p2
        PlayerBuildingSpawn {
            TargetTag = "some_flame_tower",
            Player = "pl_Enemy1",
            BuildingId = 39050
        },
        BuildingVanish {
            Tag = "some_flame_tower"
        },
        SquadVanish {
            Tag = "third_aspect_camp_squad5"
        },
        --third aspect wave p2
        SquadVanish {
            Tag = "third_aspect_wave1"
        },
        --fake aspect wave p2
        SquadVanish {
            Tag = "fake_aspect_wave"
        },
        SquadVanish {
            Tag = "fake_aspect_camp_squad"
        },
        SquadVanish {
            Tag = "fake_aspect_camp_squad5"
        },
        --fourth aspect spawner camp p2
        SquadVanish {
            Tag = ""
        },
        --fourth aspect wave p2
        SquadVanish {
            Tag = "fourth_aspect_wave2"
        },
        BuildingVanish {
            Tag = "fourth_aspect_camp_squad3"
        },
        SquadVanish {
            Tag = "fourth_aspect_camp_squad6"
        },
        SquadVanish {
            Tag = "fourth_aspect_camp_squad8"
        },
        SquadVanish {
            Tag = "fourth_aspect_camp_squad9"
        },
        --general stuff p1
        PlayerBuildingSpawn {
            TargetTag = "some_rocket_tower1",
            Player = "pl_Enemy1",
            BuildingId = 39050
        },
        BuildingVanish {
            Tag = "some_rocket_tower1"
        },
        --first camp p1
        SquadVanish {
            Tag = "camp_first_left3"
        },
        SquadVanish {
            Tag = "camp_first_left4"
        },
        SquadVanish {
            Tag = "camp_first_left7"
        },
        --second camp p1
        SquadVanish {
            Tag = "camp_second_left"
        },
        SquadVanish {
            Tag = "camp_second_left2"
        },
        --first base p1
        BuildingVanish {
            Tag = "some_pyromaniac"
        },
        SquadVanish {
            Tag = "boom_b"
        },
        BuildingVanish {
            Tag = "some_makeshift_tower"
        },
        BuildingVanish {
            Tag = "some_makeshift_tower1"
        },
        --first base wave p1
        SquadVanish {
            Tag = "first_base_wave_a1"
        },
        SquadVanish {
            Tag = "first_base_wave_b1"
        },
        SquadVanish {
            Tag = "first_base_wave_b2"
        },
        --second base p1
        PlayerBuildingSpawn {
            TargetTag = "some_flame_tower1",
            Player = "pl_Enemy1",
            BuildingId = 39051
        },
        BuildingVanish {
            Tag = "some_flame_tower1"
        },
        SquadVanish {
            Tag = "second_base_squad7"
        },
        SquadVanish {
            Tag = "second_base_squad10"
        },
        SquadVanish {
            Tag = "second_base_squad2"
        },
        SquadVanish {
            Tag = "second_base_squad4"
        },
        SquadVanish {
            Tag = "second_base_squad6"
        },
        --second base waves p1
        SquadVanish {
            Tag = "second_base_wave_a1"
        },
        SquadVanish {
            Tag = "second_base_wave_b1"
        },
        SquadVanish {
            Tag = "second_base_wave_c1"
        },
        --fire altar camp
        SquadVanish {
            Tag = "fire_altar_squad5"
        },
        SquadVanish {
            Tag = "fire_altar_squad6"
        },
        SquadVanish {
            Tag = "fire_altar_squad10"
        },
        SquadVanish {
            Tag = "fire_altar_squad11"
        },
        SquadVanish {
            Tag = "fire_altar_squad12"
        },
        SquadVanish {
            Tag = "fire_altar_squad16"
        },
        SquadVanish {
            Tag = "fire_altar_squad17"
        },
        SquadVanish {
            Tag = "fire_altar_squad18"
        },
    }
};

OnOneTimeEvent {
    Conditions = {
        MissionDifficultyIsEqual {
            Difficulty = DifficultyAdvanced
        }
    },
    Actions = {
        EntitySetMaxHealthAbsolute {
            TargetTag = "fire_altar",
            MaxHealthAbsolute = 10000
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "abaddon",
            MaxHealthAbsolute = 40000
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "volcano_a",
            MaxHealthAbsolute = 7500
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "volcano_b",
            MaxHealthAbsolute = 7500
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "final_camp_volcano_left",
            MaxHealthAbsolute = 10000
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "final_camp_volcano_right",
            MaxHealthAbsolute = 10000
        },
    }
};

OnOneTimeEvent {
    Conditions = {
        MissionDifficultyIsEqual {
            Difficulty = DifficultyExpert
        }
    },
    Actions = {
        GeneratorVanish {
            Tag = "third_well_p1"
        },
        GeneratorVanish {
            Tag = "third_well_p2"
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "fire_altar",
            MaxHealthAbsolute = 10000
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "abaddon",
            MaxHealthAbsolute = 40000
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "volcano_a",
            MaxHealthAbsolute = 10000
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "volcano_b",
            MaxHealthAbsolute = 10000
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "final_camp_volcano_left",
            MaxHealthAbsolute = 10000
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "final_camp_volcano_right",
            MaxHealthAbsolute = 10000
        },
    }
};
--General Stuff
OnOneTimeEvent {
    Conditions = {
    },
    Actions = {
        SquadBarrierMount {
            Tag = "fire_wall_mount",
            TargetTag = "fire_wall_spire"
        },
        SquadBarrierMount {
            Tag = "fire_wall_mount1",
            TargetTag = "fire_wall_spire1"
        },
        SquadBarrierMount {
            Tag = "fire_wall_mount2",
            TargetTag = "fire_wall_spire2"
        },
        SquadBarrierMount {
            Tag = "fire_wall_mount3",
            TargetTag = "fire_wall_spire3"
        },
        EntitySpellAdd {
            Tag = "left_stone",
            SpellId = 2749
        },
        EntitySpellRemove {
            Tag = "left_stone",
            SpellId = 2225
        },
        EntitySpellAdd {
            Tag = "right_stone",
            SpellId = 2749
        },
        EntitySpellRemove {
            Tag = "right_stone",
            SpellId = 2225
        },
        MissionTaskSetActive {
            Player = "All",
            TaskTag = "goal_destroy_fire_altar", 
            TargetTag = "fire_altar", 
            Summary = "Destroy the corrupted Fire Altar."
        },
        EntityAbilityRemove {
            Tag = "fire_altar",
            AbilityId = 435
        },
        EntityAbilityRemove {
            Tag = "fire_altar",
            AbilityId = 1297
        },
        EntityAbilityRemove {
            Tag = "fire_altar",
            AbilityId = 2089
        },
        EntityAbilityRemove {
            Tag = "fire_altar",
            AbilityId = 993
        },
        EntityAbilityRemove {
            Tag = "fire_altar",
            AbilityId = 1201
        },
        EntityAbilityRemove {
            Tag = "fire_altar",
            AbilityId = 1213
        },
        EntityAbilityRemove {
            Tag = "fire_altar",
            AbilityId = 3595
        },
        EntityAbilityRemove {
            Tag = "fire_altar",
            AbilityId = 434
        },
        PlayerCardSpellFakePlay {
            TargetTag = "dummy_target",
            Player = "pl_Player2",
            CardSpellId = 947
        },
        MapTimerStart {
            Name = "mt_global"
        },
        FogOfWarObserve {
            TargetTag = "sg_marker_fow_glance",
            Team = "tm_Team1",
            Range = 40
        },
        FogOfWarObserve {
            TargetTag = "fire_altar",
            Team = "tm_Team1",
            Range = 30
        },
        SquadKill {
            Tag = "aspect1"
        },
        SquadKill {
            Tag = "aspect2"
        },
        SquadKill {
            Tag = "aspect3"
        },
        SquadKill {
            Tag = "aspect4"
        },
        SquadKill {
            Tag = "converted_aspect1"
        },
        SquadKill {
            Tag = "converted_aspect2"
        },
        SquadKill {
            Tag = "converted_aspect3"
        },
        SquadKill {
            Tag = "converted_aspect4"
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "volcano_a_spawner",
            MaxHealthAbsolute = 50000
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "volcano_b_spawner",
            MaxHealthAbsolute = 50000
        }
    }
};

for spawnerIndex = 1,4 do
    
    OnOneTimeEvent {
        Conditions = {
            OR {
                BuildingIsDestroyed {
                    Tag = AspectSpawnerByIndex(spawnerIndex)
                },
                BuildingIsDestroyed {
                    Tag = "fire_altar"
                }
            }
        },
        Actions = {
            MissionTaskSetSolved {
                Player = "pl_Player2",
                TaskTag = AspectSpawnerGoalByIndex(spawnerIndex), 
                TargetTag = AspectSpawnerByIndex(spawnerIndex), 
                Summary = "Destroy the "..OrdinalNumbers[spawnerIndex].." aspect spawner."
            }
        }
    };

    if spawnerIndex < 4 then
        OnOneTimeEvent {
            Conditions = {
                BuildingIsDestroyed {
                    Tag = AspectSpawnerByIndex(spawnerIndex)
                },
                MapFlagIsFalse {
                    Name = "mf_"..AspectSpawnerGoalByIndex(spawnerIndex).."_activated"
                },
                BuildingIsAlive {
                    Tag = AspectSpawnerByIndex(spawnerIndex + 1)
                },
            },
            Actions = {
                MissionTaskSetActive {
                    Player = "pl_Player2",
                    TaskTag = AspectSpawnerGoalByIndex(spawnerIndex), 
                    TargetTag = AspectSpawnerGoalByIndex(spawnerIndex), 
                    Summary = "Destroy the "..OrdinalNumbers[spawnerIndex].." aspect spawner."
                },
                MapFlagSetTrue {
                    Name = "mf_"..AspectSpawnerGoalByIndex(spawnerIndex).."_activated"  
                },
            }
        };
    end

    if spawnerIndex > 1 then
        OnOneTimeEvent {
            Conditions = {
                MapTimerIsElapsed {
                    Name = "mt_global",
                    Seconds = aspectInitialDelay + (aspectFrequencyInSeconds * (spawnerIndex * 2 - 1)) - aspectRevealSpawnerInAdvance
                },
                BuildingIsAlive {
                    Tag = AspectSpawnerByIndex(spawnerIndex)
                },
                BuildingIsAlive {
                    Tag = "fire_altar"
                },
                MapFlagIsFalse {
                    Name = "mf_"..AspectSpawnerGoalByIndex(spawnerIndex).."_activated"
                }
            },
            Actions = {
                MissionTimerStart {
                    Player = "All",
                    TimerTag = "goal_spawner_becomes_active",
                    LocaTag = "Another Aspect Spawner will become active soon!",
                    Seconds = aspectRevealSpawnerInAdvance
                },
                MapFlagSetTrue {
                    Name = "mf_"..AspectSpawnerGoalByIndex(spawnerIndex).."_activated"  
                },
                MissionTaskSetActive {
                    Player = "pl_Player2",
                    TaskTag = AspectSpawnerGoalByIndex(spawnerIndex), 
                    TargetTag = AspectSpawnerGoalByIndex(spawnerIndex), 
                    Summary = "Destroy the "..OrdinalNumbers[spawnerIndex].." aspect spawner."
                },
                MissionOutcry {
                    PortraitFileName = "moon",
                    DurationSeconds = 5,
                    TextTag = "",
                    Player = "ALL",
                    Text = "Moon: Another Aspect Spawner will become active soon!"
                }
            }
        };
    end

    --Teleport
    OnIntervalEvent {
        Seconds = 1,
        Conditions = {
            EntityIsInRange {
                Tag = "aspect"..spawnerIndex,
                TargetTag = "aspect_target",
                Range = 1
            },
        },
        Actions = {
            EntityTeleport {
                Tag = "aspect"..spawnerIndex,
                TargetTag = "altar_spawn_c"
            }
        }
    };

    --Post Teleport Path
    OnIntervalEvent {
        Seconds = 1,
        Conditions = {
            EntityIsInRange {
                Tag = "aspect"..spawnerIndex,
                TargetTag = "altar_spawn_c",
                Range = 1
            },
        },
        Actions = {
            SquadGotoForced {
                Tag = "aspect"..spawnerIndex, 
                TargetTag = "fire_altar_target"
            },
        }
    };
end

OnOneTimeEvent {
    Conditions = {
        MapFlagIsTrue {
            Name = "mf_aspect_spawned"
        }
    },
    Actions = {
        MissionTaskSetActive {
            Player = "pl_Player2",
            TaskTag = "goal_kill_all_aspects", 
            TargetTag = "sg_aspects", 
            Summary = "Kill all Aspects."
        },
    }
};

OnOneTimeEvent {
    Conditions = {
        AND {
            OR {
                AND {
                    BuildingIsDestroyed {
                        Tag = "camp_first_aspect_spawner"
                    },
                    BuildingIsDestroyed {
                        Tag = "camp_second_aspect_spawner"
                    },
                    BuildingIsDestroyed {
                        Tag = "camp_third_aspect_spawner"
                    },
                    BuildingIsDestroyed {
                        Tag = "camp_fourth_aspect_spawner"
                    },
                },
                BuildingIsDestroyed {
                    Tag = "fire_altar"
                }
            },
            MapFlagIsTrue {
                Name = "mf_aspect_spawned"
            },
            ScriptGroupAliveAmountIsEqual {
                Group = "sg_aspects",
                Value = 0
            }
        }
    },
    Actions = {
        MissionTaskSetSolved {
            Player = "pl_Player2",
            TaskTag = "goal_kill_all_aspects", 
            TargetTag = "sg_aspects", 
            Summary = "Kill all Aspects of Summer."
        },
    }
};

OnOneTimeEvent {
    Conditions = {
        MapFlagIsTrue {
            Name = "mf_converted_aspect_spawned"
        }
    },
    Actions = {
        MissionTaskSetActive {
            Player = "pl_Player2",
            TaskTag = "goal_kill_all_converted_aspects", 
            TargetTag = "sg_converted_aspects", 
            Summary = "Kill all Converted Fire Elementals."
        },
    }
};

OnOneTimeEvent {
    Conditions = {
        AND {
            OR {
                AND {
                    BuildingIsDestroyed {
                        Tag = "camp_first_aspect_spawner"
                    },
                    BuildingIsDestroyed {
                        Tag = "camp_second_aspect_spawner"
                    },
                    BuildingIsDestroyed {
                        Tag = "camp_third_aspect_spawner"
                    },
                    BuildingIsDestroyed {
                        Tag = "camp_fourth_aspect_spawner"
                    },
                },
                BuildingIsDestroyed {
                    Tag = "fire_altar"
                }
            },
            MapFlagIsTrue {
                Name = "mf_converted_aspect_spawned"
            },
            ScriptGroupAliveAmountIsEqual {
                Group = "sg_aspects",
                Value = 0
            }
        }
    },
    Actions = {
        MissionTaskSetSolved {
            Player = "pl_Player2",
            TaskTag = "goal_kill_all_converted_aspects", 
            TargetTag = "sg_converted_aspects", 
            Summary = "Kill all Converted Fire Elementals."
        },
    }
};

OnOneTimeEvent {
    Conditions = {
        MapTimerIsElapsed {
            Name = "mt_global",
            Seconds = 0
        }
    },
    Actions = {
        MissionOutcry {
            PortraitFileName = "moon",
            DurationSeconds = 5,
            TextTag = "",
            Player = "ALL",
            Text = "Moon: The expedition was separated and has been ambushed! You must come to their aid!"
        }
    }
};

OnOneTimeEvent {
    Conditions = {
        ScriptGroupAliveAmountIsEqual {
            Group = "sg_first_wave_fire",
            Value = 0
        }
    },
    Actions = {
        MissionTaskSetActive {  
            Player = "pl_Player1",
            TaskTag = "goal_capture_first_wall", 
            TargetTag = "first_wall_left", 
            Summary = "Capture territory from the fire troops."
        },
        MissionOutcry {
            PortraitFileName = "moon",
            DurationSeconds = 8,
            TextTag = "",
            Player = "ALL",
            Text = "Moon: With your help, the attack could be repelled but it will not be the last. You should gather some ground before you are overrun."
        },
        MapFlagSetTrue {
            Name = "mf_goal_capture_first_wall_active"
        }
    }
};

OnOneTimeEvent {
    Conditions = {
        MapTimerIsElapsed {
            Name = "mt_global",
            Seconds = 30
        },
        BuildingIsAlive {
            Tag = "fire_altar"
        },
        MapFlagIsFalse {
            Name = "mf_goal_destroy_first_aspect_spawner_activated"  
        }
    },
    Actions = {
        MissionTaskSetActive {
            Player = "pl_Player2",
            TaskTag = "goal_destroy_first_aspect_spawner", 
            TargetTag = "camp_first_aspect_spawner", 
            Summary = "Destroy the first aspect spawner."
        },
        MapFlagSetTrue {
            Name = "mf_goal_destroy_first_aspect_spawner_activated"  
        },
        MissionOutcry {
            PortraitFileName = "moon",
            DurationSeconds = 8,
            TextTag = "",
            Player = "ALL",
            Text = "Moon: Sooner or later more spawners will become active and spawn Aspects of Summer, which will aim for the Fire Altar. Once they've reached it, the Twilight Curse will take hold of them and transform them into powerful elemental beings."
        }
    }
};

OnOneTimeEvent {
    Conditions = {
        BuildingIsDestroyed {
            Tag = "camp_second_left_spawner"
        }
    },
    Actions = {
        MapTimerStart {
            Name = "mt_first_camp_destroyed"
        },
    }
};

OnOneTimeEvent {
    Conditions = {
        EntityHealthIsLess {
            Tag = "fire_altar",
            Percent = 75
        }
    },
    Actions = {
        MapFlagSetTrue {
            Name = "mf_fire_altar_second_phase"
        },
        MapTimerStart {
            Name = "mt_fire_altar_second_phase"
        },
        EffectStart {
            Tag = "altar_spawn_a_effect",
            Effect = "effect_firedragon_att_air"
        },
        EffectStart {
            Tag = "altar_spawn_b_effect",
            Effect = "effect_firedragon_att_air"
        },
        EffectStart {
            Tag = "altar_spawn_c_effect",
            Effect = "effect_firedragon_att_air"
        },
    }
};

OnOneTimeEvent {
    Conditions = {
        EntityHealthIsLess {
            Tag = "fire_altar",
            Percent = 25
        }
    },
    Actions = {
        MapFlagSetTrue {
            Name = "mf_fire_altar_third_phase"
        },
        MapTimerStart {
            Name = "mt_fire_altar_third_phase"
        },
        EffectStart {
            Tag = "altar_spawn_a_effect",
            Effect = "effect_firedragon_att_air"
        },
        EffectStart {
            Tag = "altar_spawn_b_effect",
            Effect = "effect_firedragon_att_air"
        },
        EffectStart {
            Tag = "altar_spawn_c_effect",
            Effect = "effect_firedragon_att_air"
        },
    }
};

OnOneTimeEvent {
    Conditions = {
        MapTimerIsElapsed {
            Name = "mt_fire_altar_second_phase",
            Seconds = 1.3
        }
    }, 
    Actions = {
        PlayerSquadSpawn {
            TargetTag = "altar_spawn_a",
            SquadId = 39019,
            Player = "pl_Enemy1",
        },
        PlayerSquadSpawn {
            TargetTag = "altar_spawn_b",
            SquadId = 39019,
            Player = "pl_Enemy1",
        },
        PlayerSquadSpawn {
            TargetTag = "altar_spawn_c",
            SquadId = 39019,
            Player = "pl_Enemy1",
        }
    }
};

OnOneTimeEvent {
    Conditions = {
        MapTimerIsElapsed {
            Name = "mt_fire_altar_third_phase",
            Seconds = 1.3
        }
    }, 
    Actions = {
        PlayerSquadSpawn {
            TargetTag = "altar_spawn_a",
            SquadId = 39019,
            Player = "pl_Enemy1",
        },
        PlayerSquadSpawn {
            TargetTag = "altar_spawn_b",
            SquadId = 39019,
            Player = "pl_Enemy1",
        },
        PlayerSquadSpawn {
            TargetTag = "altar_spawn_c",
            SquadId = 39019,
            Player = "pl_Enemy1",
        }
    }
};

OnOneTimeEvent {
    Conditions = {
        BuildingIsDestroyed {
            Tag = "fire_altar"
        }
    },
    Actions = {
        EffectVanish {
            Tag = "sg_firewall"
        },
        MapTimerStart {
            Name = "mt_fire_altar_destroyed"
        },
        EntityAbilityRemove {
            Tag = "abaddon",
            AbilityId = 435
        },
        EffectVanish {
            Tag = "fire_altar_effect"
        },
        EffectVanish {
            Tag = "fire_altar_effect_glow"
        },
        EffectStart {
            Tag = "fire_altar",
            Effect = "effect_flamechanter_imp"
        },
        MissionOutcry {
            PortraitFileName = "moon",
            DurationSeconds = 8,
            TextTag = "",
            Player = "ALL",
            Text = "Moon: The fire altar has been destroyed. Good work!"
        },
        MissionTaskSetSolved {
            Player = "All",
            TaskTag = "goal_destroy_fire_altar", 
            TargetTag = "fire_altar", 
            Summary = "Destroy the Fire Altar."
        }
    }
};

OnOneTimeEvent {
    Conditions = {
        OR {
            EntityIsOwnedByPlayer {
                Tag = "powerslot_scythefiends",
                Player = "pl_Player1"
            },
            EntityIsOwnedByPlayer {
                Tag = "powerslot_scythefiends",
                Player = "pl_Player2"
            }
        }
    },
    Actions = {
        MapTimerStart {
            Name = "powerslot_scythefiends_taken"
        },
        MissionOutcry {
            PortraitFileName = "moon",
            DurationSeconds = 2,
            TextTag = "",
            Player = "ALL",
            Text = "Moon: Ambush, beware!"
        }
    }
};

OnOneTimeEvent {
    Conditions = {
        MapTimerIsElapsed {
            Name = "powerslot_scythefiends_taken",
            Seconds = 1
        }
    },
    Actions = {
        EffectStart {
            Tag = "powerslot_scythefiends_spawn1",
            Effect = "effect_fireworm_moveup"
        },
        PlayerSquadSpawn {
            TargetTag = "powerslot_scythefiends_spawn1",
            SquadId = 39005,
            Player = "pl_Enemy1"
        }
    }
};

OnOneTimeEvent {
    Conditions = {
        MapTimerIsElapsed {
            Name = "powerslot_scythefiends_taken",
            Seconds = 2
        }
    },
    Actions = {
        EffectStart {
            Tag = "powerslot_scythefiends_spawn2",
            Effect = "effect_fireworm_moveup"
        },
        PlayerSquadSpawn {
            TargetTag = "powerslot_scythefiends_spawn2",
            SquadId = 39005,
            Player = "pl_Enemy1"
        }
    }
};

OnOneTimeEvent {
    Conditions = {
        EntityHealthIsLess {
            For = "ANY", 
            Tag = "sg_camp_first_left", 
            Percent = 25
        },
    },
    Actions = {
        MapFlagSetTrue {
            Name = "mf_spawn_wave_camp_second_left"
        },
    }
};

OnOneTimeEvent {
    Conditions = {
        OR {
            MapTimerIsElapsed {
                Name = "mt_fire_altar_destroyed",
                Seconds = 0
            },
        }
    },
    Actions = {    
        MissionOutcry {
            PortraitFileName = "abaddon",
            DurationSeconds = 4,
            TextTag = "",
            Player = "ALL",
            Text = "Abaddon: You have no idea who you have summoned!"
        },
        AudioSoundUIPlay {
            Sound = "ack_batariel_selection2"
        },
    }
};

OnOneTimeEvent {
    Conditions = {
        MapTimerIsElapsed {
            Name = "mt_fire_altar_destroyed",
            Seconds = 10
        },
        MapFlagIsFalse {
            Name = "fire_wall_thingy"
        }
    },
    Actions = {    
        MissionTaskSetActive {
            Player = "pl_Player2",
            TaskTag = "goal_penetrate_the_flame_wall", 
            TargetTag = "fire_wall", 
            Summary = "Penetrate the Wall of Flames."
        },
    }
};    

OnOneTimeEvent {
    Conditions = {
        OR {
            MapTimerIsElapsed {
                Name = "mt_fire_altar_destroyed",
                Seconds = 20
            },
            MapTimerIsElapsed {
                Name = "mt_fire_wall_destroyed",
                Seconds = 20
            }
        }
    },
    Actions = {    
        MissionTaskSetActive {  
            Player = "All",
            TaskTag = "goal_kill_abaddon", 
            TargetTag = "abaddon", 
            Summary = "Kill Abaddon."
        },
    }
};    

OnOneTimeEvent {
    Conditions = {
        OR {
            MapTimerIsElapsed {
                Name = "mt_fire_altar_destroyed",
                Seconds = 5
            },
            MapTimerIsElapsed {
                Name = "mt_fire_wall_destroyed",
                Seconds = 5
            }
        }
    },
    Actions = {
        MissionTaskSetActive {  
            Player = "pl_Player1",
            TaskTag = "goal_destroy_both_volcanos", 
            TargetTag = "sg_volcanos", 
            Summary = "Destroy both volcanos."
        },
        MissionTaskSetActive {  
            Player = "pl_Player2",
            TaskTag = "goal_withstand_the_incoming_waves", 
            TargetTag = "sg_volcano_spawners", 
            Summary = "Withstand the incoming waves."
        },
        MissionOutcry {
            PortraitFileName = "moon",
            DurationSeconds = 2,
            TextTag = "",
            Player = "ALL",
            Text = "Moon: <TODO articulate proper announcer>!"
        },
        FogOfWarGlanceAt {
            TargetTag = "glance_50",
            Team = "tm_Team1",
            Range = 25
        },
        FogOfWarGlanceAt {
            TargetTag = "glance_50_1",
            Team = "tm_Team1",
            Range = 25
        },
        FogOfWarGlanceAt {
            TargetTag = "glance_50_2",
            Team = "tm_Team1",
            Range = 25
        },
        FogOfWarGlanceAt {
            TargetTag = "glance_50_3",
            Team = "tm_Team1",
            Range = 25
        },
        FogOfWarGlanceAt {
            TargetTag = "glance_50_4",
            Team = "tm_Team1",
            Range = 25
        },
        FogOfWarGlanceAt {
            TargetTag = "glance_50_5",
            Team = "tm_Team1",
            Range = 25
        },
        --FogOfWarGlanceAt {
        --    TargetTag = "glance_100",
        --    Team = "tm_Team1",
        --    Range = 50
        --},
        --FogOfWarGlanceAt {
        --    TargetTag = "glance_100_1",
        --    Team = "tm_Team1",
        --    Range = 50
        --},
        --FogOfWarGlanceAt {
        --    TargetTag = "glance_100_2",
        --    Team = "tm_Team1",
        --    Range = 50
        --},
        MissionOutcry {
            PortraitFileName = "moon",
            DurationSeconds = 8,
            TextTag = "",
            Player = "ALL",
            Text = "Moon: The spawners in the east are magically bond to those Volcanos in the west and can't be attacked. You can't kill the spawners itself."        
        },
        FogOfWarObserve {
            TargetTag = "volcano_a_spawner",
            Team = "tm_Team1",
            Range = 25
        },
        FogOfWarObserve {
            TargetTag = "volcano_b_spawner",
            Team = "tm_Team1",
            Range = 25
        },
        FogOfWarObserve {
            TargetTag = "volcano_a",
            Team = "tm_Team1",
            Range = 25
        },
        FogOfWarObserve {
            TargetTag = "volcano_b",
            Team = "tm_Team1",
            Range = 25
        },
    }
};

OnOneTimeEvent {
    Conditions = {
        OR {
            MapTimerIsElapsed {
                Name = "mt_fire_altar_destroyed",
                Seconds = 40
            },
            MapTimerIsElapsed {
                Name = "mt_fire_wall_destroyed",
                Seconds = 20
            }
        }
    },
    Actions = {
        AudioSoundUIPlay {
            Sound = "sfx_xl_moloch_cheer_02"
        },
        CutsceneCameraPlay {
            Camera = "moloch_cam"
        },
        MapFlagSetTrue {
            Name = "mf_spawn_wave_volcano_a"
        },
        MapFlagSetTrue {
            Name = "mf_spawn_wave_volcano_b"
        },
        MapFlagSetTrue {
            Name = "mf_spawn_wave_moloch"
        },
        SquadGridGoto {
            Tag = "moloch", 
            TargetTag = "moloch_target"
        },
        MapFlagSetTrue {
            Name = "mf_goal_destroy_both_volcanos_active"
        },
        MapFlagSetTrue {
            Name = "mf_goal_withstand_the_incoming_waves_active"
        },
        MapTimerStart {
            Name = "mt_post_fireback_phase"
        }
    }
};

OnOneTimeEvent {
    Conditions = {
        BuildingIsDestroyed {
            Tag = "camp_second_aspect_spawner"
        }
    },
    Actions = {
        PlayerSquadSpawnWithTag {
            Tag = "dragon_a",
            TargetTag = "dragon_cave_spawnpoint",
            Player = "pl_Enemy1",
            SquadId = 39013
        },
        PlayerSquadSpawnWithTag {
            Tag = "dragon_b",
            TargetTag = "dragon_cave_spawnpoint",
            Player = "pl_Enemy1",
            SquadId = 39013
        },
        SquadGridGoto {
            Tag = "dragon_a", 
            TargetTag = "moloch_target"
        },
        SquadGridGoto {
            Tag = "dragon_b", 
            TargetTag = "moloch_target"
        }
    }
};

OnOneTimeEvent {
    Conditions = {
        BuildingIsDestroyed {
            Tag = "first_base_spawner"
        }
    },
    Actions = {
        MapTimerStart {
            Name = "mt_first_base_spawner_destroyed"
        }
    }
};

OnOneTimeEvent {
    Conditions = {
        MapTimerIsElapsed {
            Name = "mt_victory_timer", 
            Seconds = 5
        },
    },
    Actions = {
        PlayerGameWon {
            Player = "ALL"
        },
    },
};

OnOneTimeEvent {
    Conditions = {
        MapFlagIsTrue {
            Name = "mf_goal_destroy_both_volcanos_solved"
        },
        MapFlagIsTrue {
            Name = "mf_goal_withstand_the_incoming_waves_solved"
        },
        MapFlagIsTrue {
            Name = "mf_left_gate_opened"
        },
        MapFlagIsTrue {
            Name = "mf_right_gate_opened"
        },
    },
    Actions = {
        MissionOutcry {
            PortraitFileName = "moon",
            DurationSeconds = 8,
            TextTag = "",
            Player = "ALL",
            Text = "Moon: On to your last task, Skylords. Kill Abaddon!"        
        },
    }
};

------------------------------------------------------------------------------

OnOneTimeEvent {
    Conditions = {
        ScriptGroupAliveAmountIsEqual {
            Group = "sg_battleground_camp",
            Value = 0
        },
    },
    Actions = {
        EntityPlayerSet {
            Tag = "left_stone",
            Player = "pl_Player1"
        }
    }
};

OnOneTimeEvent {
    Conditions = {
        EntityHasJustCastedSpell {
            Tag = "left_stone",
            SpellId = AnySpell
        }
    },
    Actions = {
        MapTimerStart {
            Name = "mt_open_left_gate"
        },
        EffectStart {
            Tag = "left_gate_forcefield",
            Effect = "effect_global_level_magicgate_destruction"
        },
        CutsceneCameraPlay {
            Camera = "left_gate_cam"
        },
        EntityPlayerSet {
            Tag = "left_stone",
            Player = "gaia"
        }
    }
};

OnOneTimeEvent {
    Conditions = {
        MapTimerIsElapsed {
            Name = "mt_open_left_gate",
            Seconds = 0.5
        }
    },
    Actions = {
        EffectVanish {
            Tag = "left_gate_effect"
        },
        ObjectVanish {
            Tag = "left_gate_forcefield"
        },
        ObjectSpawn {
            TargetTag = "left_gate_effect",
            ObjectId = 529,
            Direction = 90
        }
    }
};
---------------
OnOneTimeEvent {
    Conditions = {
        ScriptGroupAliveAmountIsEqual {
            Group = "sg_right_stone_camp",
            Value = 0
        },
    },
    Actions = {
        EntityPlayerSet {
            Tag = "right_stone",
            Player = "pl_Player2"
        }
    }
};

OnOneTimeEvent {
    Conditions = {
        EntityHasJustCastedSpell {
            Tag = "right_stone",
            SpellId = AnySpell
        }
    },
    Actions = {
        MapTimerStart {
            Name = "mt_open_right_gate"
        },
        EffectStart {
            Tag = "right_gate_forcefield",
            Effect = "effect_global_level_magicgate_destruction"
        },
        CutsceneCameraPlay {
            Camera = "right_gate_cam"
        },
        EntityPlayerSet {
            Tag = "right_stone",
            Player = "gaia"
        }
    }
};

OnOneTimeEvent {
    Conditions = {
        MapTimerIsElapsed {
            Name = "mt_open_right_gate",
            Seconds = 0.5
        }
    },
    Actions = {
        EffectVanish {
            Tag = "right_gate_effect"
        },
        ObjectVanish {
            Tag = "right_gate_forcefield"
        },
        ObjectSpawn {
            TargetTag = "right_gate_effect",
            ObjectId = 529,
            Direction = 56
        }
    }
};

OnOneTimeEvent {
    Conditions = {
        BarrierModulePercentageIsDead {
            Tag = "fire_wall",
            Percent = 5
        }
    },
    Actions = {
        MapTimerStart {
            Name = "mt_fire_wall_destroyed", 
        },
        MissionOutcry {
            PortraitFileName = "moon",
            DurationSeconds = 8,
            TextTag = "",
            Player = "ALL",
            Text = "Moon: Beware the Moloch!"
        }
    }
};

State {
    StateName = "INIT"
};