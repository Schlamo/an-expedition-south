local OrdinalNumbers = {
    [1] = "first",
    [2] = "second",
    [3] = "third",
    [4] = "fourth",
};

aspectInitialDelay = 10; --default 90
aspectFrequencyInSeconds = 5; --default 120
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
        --ToDo
        --CutsceneCameraPlay{
        --    Camera = "MolochCam"
        --}
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
        
    }
};

------------------------------
-- Destroy Spawner Missions
------------------------------
for spawnerIndex = 1,4
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

    }
end
------------------------------
-- First Missions Left Side
------------------------------
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
            Player = "All",
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
            "mf_goal_capture_first_wall_active"
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
            Player = "All",
            TaskTag = "goal_destroy_first_aspect_spawner", 
            TargetTag = "camp_first_aspect_spawner", 
            Summary = "Destroy the first aspect spawner."
        },
        MissionTaskSetActive {
            Player = "All",
            TaskTag = "goal_destroy_second_aspect_spawner", 
            TargetTag = "camp_second_aspect_spawner", 
            Summary = "Destroy the second aspect spawner."
        },
        MissionTaskSetActive {
            Player = "All",
            TaskTag = "goal_destroy_third_aspect_spawner", 
            TargetTag = "camp_third_aspect_spawner", 
            Summary = "Destroy the third aspect spawner."
        },
        MissionTaskSetActive {
            Player = "All",
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
        },
        MapFlagSetTrue {
            "mf_goal_destroy_first_aspect_spawner_active"
        }
    }
};
------------------------------
-- Stuff
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


------------------------------
-- Fire Altar has been destroyed
------------------------------
OnOneTimeEvent {
    Conditions = {
        BuildingIsDestroyed {
            Tag = "fire_altar"
        }
    },
    Actions = {
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
        -- Set all current Objectives done and next goal is to kill the fireback
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
        MissionOutcry {
            PortraitFileName = "moon",
            DurationSeconds = 8,
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
        },
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
        MapFlagSetTrue {
            "mf_goal_destroy_both_volcanos_active"
        },
        MapFlagSetTrue {
            "mf_goal_withstand_the_incoming_waves_active"
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

State {
    StateName = "INIT"
};