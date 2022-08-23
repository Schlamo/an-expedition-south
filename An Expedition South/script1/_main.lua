local OrdinalNumbers = {
    [1] = "first",
    [2] = "second",
    [3] = "third",
    [4] = "fourth",
};

aspectInitialDelay = 0; --default 90
aspectFrequencyInSeconds = 20; --default 120
maxAspectsPerSpawner = 3;

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

--Testing
OnOneTimeEvent {
    Conditions = {
        MapTimerIsElapsed {
            Name = "mt_global",
            Seconds = 5
        }
    },
    Actions = {
    }
};

OnOneTimeEvent {
    Conditions = {
    },
    Actions = {
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
            MaxHealthAbsolute = 15000
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "volcano_b",
            MaxHealthAbsolute = 15000
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "final_camp_volcano_left",
            MaxHealthAbsolute = 10000
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "fireback",
            MaxHealthAbsolute = 20000
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "final_camp_volcano_right",
            MaxHealthAbsolute = 10000
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
        MapFlagSetFalse {
            Name = "mf_aspect1_conversion_active"
        }
        
    }
};

for spawnerIndex = 1,4 do
    OnOneTimeEvent {
        Conditions = {
            MapTimerIsElapsed {
                Name = "mt_global",
                Seconds = aspectInitialDelay + (aspectFrequencyInSeconds * spawnerIndex) - 30
            },
            BuildingIsAlive {
                Tag = AspectSpawnerByIndex(spawnerIndex)
            },
            BuildingIsAlive {
                Tag = "fire_altar"
            }
        },
        Actions = {
            MissionOutcry {
                PortraitFileName = "moon",
                DurationSeconds = 5,
                TextTag = "",
                Player = "ALL",
                Text = "Moon: Another Aspect Spawner will become active soon!"
            }
        }
    };

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
            TargetTag = "sg_aspects", 
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
            Summary = "Recapture territory from the fire troops."
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
        }
    },
    Actions = {
        MissionTaskSetActive {
            Player = "pl_Player2",
            TaskTag = "goal_destroy_first_aspect_spawner", 
            TargetTag = "camp_first_aspect_spawner", 
            Summary = "Destroy the first aspect spawner."
        },
        MissionTaskSetActive {
            Player = "pl_Player2",
            TaskTag = "goal_destroy_second_aspect_spawner", 
            TargetTag = "camp_second_aspect_spawner", 
            Summary = "Destroy the second aspect spawner."
        },
        MissionTaskSetActive {
            Player = "pl_Player2",
            TaskTag = "goal_destroy_third_aspect_spawner", 
            TargetTag = "camp_third_aspect_spawner", 
            Summary = "Destroy the third aspect spawner."
        },
        MissionTaskSetActive {
            Player = "pl_Player2",
            TaskTag = "goal_destroy_fourth_aspect_spawner", 
            TargetTag = "camp_fourth_aspect_spawner", 
            Summary = "Destroy the fourth aspect spawner."
        },
        MissionOutcry {
            PortraitFileName = "moon",
            DurationSeconds = 8,
            TextTag = "",
            Player = "ALL",
            Text = "Moon: Sooner or later these spawners will become active and spawn Aspects of Summer, which will aim for the Fire Altar. Once they've reached it, the Twilight Curse will take hold of them and transform them into powerful elemental beings."
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
            Name = "mt_show_kill_fireback_goal"
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
        MapTimerIsElapsed {
            Name = "mt_show_kill_fireback_goal",
            Seconds = 3
        }
    },
    Actions = {
        MissionTaskSetActive {
            Player = "All",
            TaskTag = "goal_kill_fireback", 
            TargetTag = "fireback", 
            Summary = "Kill Fireback."
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
        MapTimerIsElapsed {
            Name = "mt_fireback_killed",
            Seconds = 10
        }
    },
    Actions = {    
        MissionOutcry {
            PortraitFileName = "moon",
            DurationSeconds = 5,
            TextTag = "",
            Player = "ALL",
            Text = "Moon: The strongest minion of the prime evil Abaddon has been defeated."
        },
    }
};

OnOneTimeEvent {
    Conditions = {
        MapTimerIsElapsed {
            Name = "mt_fireback_killed",
            Seconds = 15
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
            Name = "mt_fireback_killed",
            Seconds = 20 --20
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
        MapTimerIsElapsed {
            Name = "mt_fireback_killed",
            Seconds = 25 --25
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
    }
};

OnOneTimeEvent {
    Conditions = {
        MapTimerIsElapsed {
            Name = "mt_fireback_killed",
            Seconds = 30 --30
        }
    },
    Actions = {
        MissionOutcry {
            PortraitFileName = "moon",
            DurationSeconds = 10,
            TextTag = "",
            Player = "ALL",
            Text = "Moon: The spawners in the east are magically bond to those volcanos in the west and can't be attacked. Kill the volcanos first, then the spawners! But watch out for waves in the east"        
        },
        FogOfWarObserve {
            TargetTag = "volcano_a_spawner",
            Team = "tm_Team1",
            Range = 20
        },
        FogOfWarObserve {
            TargetTag = "volcano_b_spawner",
            Team = "tm_Team1",
            Range = 20
        },
        FogOfWarObserve {
            TargetTag = "volcano_a",
            Team = "tm_Team1",
            Range = 20
        },
        FogOfWarObserve {
            TargetTag = "volcano_b",
            Team = "tm_Team1",
            Range = 20
        },
    }
};

OnOneTimeEvent {
    Conditions = {
        MapTimerIsElapsed {
            Name = "mt_fireback_killed",
            Seconds = 40
        },
    },
    Actions = {
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
    Conditions =
    {
        MapFlagIsTrue {
            Name = "mf_goal_destroy_both_volcanos_solved"
        },
        MapFlagIsTrue {
            Name = "mf_goal_withstand_the_incoming_waves_solved"
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
        MapTimerStart {
            Name = "mt_open_the_gate"
        },
        EffectStart {
            Tag = "left_gate_forcefield",
            Effect = "effect_global_level_magicgate_destruction"
        },
        EffectStart {
            Tag = "right_gate_forcefield",
            Effect = "effect_global_level_magicgate_destruction"
        },
    }
};

OnOneTimeEvent {
    Conditions = {
        MapTimerIsElapsed {
            Name = "mt_open_the_gate",
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
        },
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

State {
    StateName = "INIT"
};