local OrdinalNumbers = {
    [1] = "first",
    [2] = "second",
    [3] = "third",
    [4] = "fourth",
};

aspectInitialDelay = 60; --default 60
aspectFrequencyInSeconds = 120; --default 90
maxAspectsPerSpawner = 3;

function AspectSpawnerByIndex (index)
    return "camp_"..OrdinalNumbers[index].."_aspect_spawner"
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

------------------------------
-- Map Flags
------------------------------

------------------------------
-- Timer
------------------------------

OnOneTimeEvent {
    Conditions = {
    },
    Actions = {
        EntityAbilityRemove {
            Tag = "fire_crystal",
            AbilityId = 435
        },
        EntityAbilityRemove {
            Tag = "fire_crystal",
            AbilityId = 1297
        },
        EntityAbilityRemove {
            Tag = "fire_crystal",
            AbilityId = 2089
        },
        EntityAbilityRemove {
            Tag = "fire_crystal",
            AbilityId = 993
        },
        EntityAbilityRemove {
            Tag = "fire_crystal",
            AbilityId = 1201
        },
        EntityAbilityRemove {
            Tag = "fire_crystal",
            AbilityId = 1213
        },
        EntityAbilityRemove {
            Tag = "fire_crystal",
            AbilityId = 3595
        },
        EntityAbilityRemove {
            Tag = "fire_crystal",
            AbilityId = 434
        },
        PlayerCardSpellFakePlay {
            TargetTag = "dummy_target",
            Player = "pl_Player2",
            CardSpellId = 947
        },
        MapValueSet {
            Name = "mv_total_aspects_spawned",
            Value = 0
        },
        MapTimerStart {
            Name = "mt_global"
        },
        FogOfWarObserve {
            TargetTag = "marker_fow_glance",
            Team = "tm_Team1",
            Range = 40
        },
        FogOfWarObserve {
            TargetTag = "fire_crystal",
            Team = "tm_Team1",
            Range = 30
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "fire_crystal",
            MaxHealthAbsolute = 10000
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "volcano_a",
            MaxHealthAbsolute = 20000
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "volcano_b",
            MaxHealthAbsolute = 20000
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "final_camp_volcano_left",
            MaxHealthAbsolute = 10000
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "fireback",
            MaxHealthAbsolute = 25000
        },
        EntitySetMaxHealthAbsolute {
            TargetTag = "final_camp_volcano_right",
            MaxHealthAbsolute = 10000
        },
        --CutsceneCameraPlay{
        --    Camera = "MolochCam"
        --}
    }
};

------------------------------
-- First Mission
------------------------------

OnOneTimeEvent {
    Conditions = {
        MapTimerIsElapsed {
            Name = "mt_global",
            Seconds = 3
        }
    },
    Actions = {
		EntitySpellCast{
			Tag = "test",
			TargetTag = "test2",
			SpellId = 2806
		},
    }
};
OnOneTimeEvent {
    Conditions = {
        MapTimerIsElapsed {
            Name = "mt_global",
            Seconds = 10
        }
    },
    Actions = {
        MissionTaskSetActive {  
            Player = "All",
            TaskTag = "goal_capture_first_wall", 
            TargetTag = "first_wall_left", 
            Summary = "Recapture territory from the fire troops."
        },
        MissionTaskSetActive {
            Player = "All",
            TaskTag = "goal_destroy_first_aspect_spawner", 
            TargetTag = "camp_first_aspect_spawner", 
            Summary = "Destroy the first aspect spawner."
        }
    }
};

OnOneTimeEvent {
    Conditions = {
        BuildingIsDestroyed { Tag = AspectSpawnerByIndex(1) },
        BuildingIsAlive { Tag = AspectSpawnerByIndex(2) }
    },
    Actions = {
        MissionTaskSetActive {
            Player = "All",
            TaskTag = "goal_destroy_second_aspect_spawner", 
            TargetTag = "camp_second_aspect_spawner", 
            Summary = "Destroy the second aspect spawner."
        }
    }
};

OnOneTimeEvent {
    Conditions = {
        BuildingIsDestroyed { Tag = AspectSpawnerByIndex(1) }
    },
    Actions = {
        MissionTaskSetSolved {  
            Player = "All",
            TaskTag = "goal_destroy_first_aspect_spawner", 
            TargetTag = "camp_first_aspect_spawner", 
            Summary = "Destroy the first aspect spawner."
        },
    }
};

OnOneTimeEvent {
    Conditions = {
        BuildingIsDestroyed { Tag = AspectSpawnerByIndex(2) }
    },
    Actions = {
        MissionTaskSetSolved {  
            Player = "All",
            TaskTag = "goal_second_first_wall", 
            TargetTag = "second_wall_left", 
            Summary = "Recapture territory from the fire troops."
        },
    }
};

OnOneTimeEvent {
    Conditions = {
        BuildingIsDestroyed { Tag = AspectSpawnerByIndex(3) }
    },
    Actions = {
        MissionTaskSetSolved {  
            Player = "All",
            TaskTag = "goal_capture_third_wall", 
            TargetTag = "third_wall_left", 
            Summary = "Recapture territory from the fire troops."
        },
    }
};

OnOneTimeEvent {
    Conditions = {
        BuildingIsDestroyed { Tag = AspectSpawnerByIndex(4) }
    },
    Actions = {
        MissionTaskSetSolved {  
            Player = "All",
            TaskTag = "goal_capture_fourth_wall", 
            TargetTag = "fourth_wall_left", 
            Summary = "Recapture territory from the fire troops."
        },
    }
};

------------------------------
-- Aspects
------------------------------
for aspectCounter = 1,12 do --max 3 spawns per Spawner (12 in total)
    --Minimap Alerts
    OnIntervalEvent {
        Seconds = 1,
        Conditions = { 
            SquadIsAlive {
                Tag = "aspect_"..aspectCounter,
            }
        },
        Actions = {
            MiniMapAlert {
                TargetTag = "aspect_"..aspectCounter,
                AlertType = AlertQuest
            }
        }
    };

    OnIntervalEvent {
        Seconds = 1,
        Conditions = { 
            SquadIsAlive {
                Tag = "converted_aspect_"..aspectCounter,
            }
        },
        Actions = {
            MiniMapAlert {
                TargetTag = "converted_aspect_"..aspectCounter,
                AlertType = AlertQuest
            }
        }
    };

    --Aspect Mission Timer
    OnOneTimeEvent {
        Conditions = { 
            MapTimerIsElapsed {
                Name = "mt_global",
                Seconds = aspectFrequencyInSeconds * aspectCounter
            },
            BuildingIsAlive { 
                Tag = GetSpawnerTagByAspectIndex(aspectCounter) 
            }
        },
        Actions = {
            MissionTimerStart {
                TimerTag = "missiontimer_aspect_"..aspectCounter,
                LocaTag = "",
                Seconds = aspectInitialDelay
            }
        }
    };

    OnOneTimeEvent {
        Conditions = {
            OR {
                MissionTimerHasRunOut {
                    TimerTag = "missiontimer_aspect_"..aspectCounter
                },
                BuildingIsDestroyed {
                    Tag = GetSpawnerTagByAspectIndex(aspectCounter) 
                }
            }
        },
        Actions = {
            MissionTimerStop {
                TimerTag = "missiontimer_aspect_"..aspectCounter
            }
        }
    }

    --First Spawner
    OnOneTimeEvent {
        Conditions = { 
            MapTimerIsElapsed {
                Name = "mt_global",
                Seconds = aspectInitialDelay + aspectFrequencyInSeconds * aspectCounter
            },
            BuildingIsAlive { 
                Tag = GetSpawnerTagByAspectIndex(aspectCounter) 
            },
        },
        Actions = {
            PlayerSquadSpawnWithTag {
                Tag = "aspect_"..aspectCounter,
                TargetTag = GetSpawnpointTagByAspectIndex(aspectCounter),
                Player = "pl_Enemy1",
                SquadId = 30007
            },
            MapFlagSetTrue {
                Name = "mf_aspect_"..aspectCounter.."_spawned"
            }
        }
    };

    --Spawn UX
    OnOneTimeEvent {
        Conditions = { 
            MapFlagIsTrue {
                Name = "mf_aspect_"..aspectCounter.."_spawned"
            }
        },
        Actions = {
            AudioSoundUIPlay {
                Sound = "sfx_global_horn"
            },
            MissionOutcry {
                PortraitFileName = "moon",
                DurationSeconds = 8,
                TextTag = "",
                Player = "ALL",
                Text = "A new fire aspect aspect spawned!"
            },
            AudioSoundUIPlay {
                Sound = "sfx_global_horn"
            },
            FogOfWarObserve {
                TargetTag = "aspect_"..aspectCounter,
                Range = 20,
                Team = "tm_Team1"
            },
            MiniMapAlert {
                TargetTag = "aspect_"..aspectCounter,
                AlertType = 5
            },
            SquadGotoForced {
                Tag = "aspect_"..aspectCounter, 
                TargetTag = "aspect_target"
            },
            EntitySetMaxHealthAbsolute {
                TargetTag = "aspect_"..aspectCounter,
                MaxHealthAbsolute = 1000 + 500 * (aspectCounter-1)
            },
            FogOfWarObserve {
                TargetTag = "aspect_"..aspectCounter,
                Range = 15,
                Team = "tm_Team1"
            }
        }
    };

    --Aspect Conversion
    OnOneTimeEvent {
        Conditions = { 
            EntityIsInRange {
                Tag = "aspect_"..aspectCounter,
                TargetTag = "aspect_target",
                Range = 15
            }
        },
        Actions = {
            MapTimerStart {
                Name = "mt_aspect_"..aspectCounter.."_reached_the_crystal"
            },
        }
    };
    OnOneTimeEvent {
        Conditions = {
            MapTimerIsElapsed {
                Name = "mt_aspect_"..aspectCounter.."_reached_the_crystal",
                Seconds = 5
            }
        },
        Actions = {
            EffectStart {
                Tag = "aspect_"..aspectCounter,
                Effect = "test_mb_explosion"
            }
        }
    };

    OnOneTimeEvent {
        Conditions = {
            MapTimerIsElapsed {
                Name =  "mt_aspect_"..aspectCounter.."_reached_the_crystal",
                Seconds = 7
            }
        },
        Actions = {
            SquadVanish {
                Tag = "aspect_"..aspectCounter
            },
            EffectStopAll {
                Tag = "aspect_"..aspectCounter
            },
            PlayerSquadSpawnWithTag {
                Tag = "converted_aspect_"..aspectCounter,
                TargetTag = "aspect_target",
                Player = "pl_Enemy1",
                SquadId = 30001
            },
            MapFlagSetTrue {
                Name = "mf_converted_aspect_"..aspectCounter.."_spawned"
            },
            EffectStart {
                Tag = "converted_aspect_"..aspectCounter,
                Effect = "effect_story_templeheadexplode"
            },
            EntitySetMaxHealthAbsolute {
                TargetTag = "converted_aspect_"..aspectCounter,
                MaxHealthAbsolute = 2000
            }
        }
    };

    OnOneTimeEvent {
        Conditions = {
            MapTimerIsElapsed {
                Name = "mt_aspect_"..aspectCounter.."_reached_the_crystal",
                Seconds = 9
            }
        },
        Actions = {
            SquadGridGoto {
                Tag = "converted_aspect_"..aspectCounter,
                TargetTag = "converted_aspect_target"
            },
            MapTimerStop {
                Name = "mt_aspect_"..aspectCounter.."_reached_the_crystal"
            }
        }
    };
end

------------------------------
-- Other Stuff
------------------------------

OnOneTimeEvent {
    Conditions = {
        OR {
            BuildingIsDestroyed {
                Tag = "camp_second_left_spawner"
            }
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
        BuildingIsDestroyed {
            Tag = "fire_crystal"
        }
    },
    Actions = {
        EffectVanish {
            Tag = "fire_crystal_effect"
        },
        EffectVanish {
            Tag = "fire_crystal_effect_glow"
        },
        EffectStart {
            Tag = "fire_crystal",
            Effect = "effect_flamechanter_imp"
        },
        MissionOutcry {
            PortraitFileName = "moon",
            DurationSeconds = 8,
            TextTag = "",
            Player = "ALL",
            Text = "The fire altar has been destroyed. Good work!"
        },
    }
};

------------------------------
-- Scythe Fiends Mini Event
------------------------------

OnOneTimeEvent {
    Conditions = {
        EntityIsOwnedByPlayer {
            Tag = "powerslot_scythefiends",
            Player = "Any"
        }
    },
    Actions = {
        MapTimerStart {
            Name = "powerslot_scythefiends_taken"
        },
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
        MapTimerIsElapsed {
            Name = "powerslot_scythefiends_taken",
            Seconds = 3
        }
    },
    Actions = {
        EffectStart {
            Tag = "powerslot_scythefiends_spawn3",
            Effect = "effect_fireworm_moveup"
        },
        PlayerSquadSpawn {
            TargetTag = "powerslot_scythefiends_spawn3",
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

------------------------------
-- Second Major Game Phase
------------------------------
OnOneTimeEvent {
    Conditions = {
        MapTimerIsElapsed {
            Name = "mt_fireback_killed",
            Seconds = 20 --20
        }
    },
    Actions = {
        MissionOutcry {
            PortraitFileName = "abaddon",
            DurationSeconds = 8,
            TextTag = "",
            Player = "ALL",
            Text = "That's not even my final form."        
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
            DurationSeconds = 8,
            TextTag = "",
            Player = "ALL",
            Text = "Thats not good."        
        },
    }
};
OnOneTimeEvent {
    Conditions = {
        MapTimerIsElapsed {
            Name = "mt_fireback_killed",
            Seconds = 40
        }
    },
    Actions = {
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
        MissionOutcry {
            PortraitFileName = "moon",
            DurationSeconds = 8,
            TextTag = "",
            Player = "ALL",
            Text = "The spawners in the east are magically bond to those volcanos in the west and can't be attacked n stuff. Kill the volcanos first, then the spawners!"        
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
        MissionTaskSetActive {  
            Player = "All",
            TaskTag = "goal_destroy_both_volcanos", 
            TargetTag = "sg_volcanos", 
            Summary = "Destroy both volcanos."
        },
        MissionTaskSetActive {  
            Player = "All",
            TaskTag = "goal_withstand_the_incoming_waves", 
            TargetTag = "sg_volcanos", 
            Summary = "Withstand the incoming waves."
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
State {
    StateName = "INIT"
};