OnRespawnEvent {
    StartDespawned = false,
    TargetTag = "moloch_spawnpoint",
    RespawnDelaySeconds = 120,
    HealthPercent = 100,
    Conditions = {
        MapFlagIsTrue {
            Name = "mf_spawn_wave_moloch",
        },
        BuildingIsAlive {
            For = "ALL", 
            Tag = "moloch_spawner"
        }
    },
    Actions = {
        SquadGridGoto {
            Tag = "moloch", 
            TargetTag = "moloch_target"
        }
    }
};

OnOneTimeEvent {
    Conditions = {
        EntityHealthIsLess {
            For = "ANY", 
            Tag = "moloch_spawner", 
            Percent = 80
        }
    },
    Actions = {
        PlayerSquadSpawn {
            TargetTag = "moloch_spawnpoint",
            Player = "pl_Enemy1",
            SquadId = 39012
        },
        PlayerSquadSpawn {
            TargetTag = "moloch_spawnpoint",
            Player = "pl_Enemy1",
            SquadId = 39012
        },
        PlayerSquadSpawn {
            TargetTag = "moloch_spawnpoint",
            Player = "pl_Enemy1",
            SquadId = 39012
        },
        PlayerSquadSpawn {
            TargetTag = "moloch_spawnpoint",
            Player = "pl_Enemy1",
            SquadId = 39012
        }
    }
};

OnOneTimeEvent {
    Conditions = {
        EntityHealthIsLess {
            For = "ANY", 
            Tag = "moloch_spawner", 
            Percent = 60
        }
    },
    Actions = {
        PlayerSquadSpawn {
            TargetTag = "moloch_spawnpoint",
            Player = "pl_Enemy1",
            SquadId = 39014
        },
        PlayerSquadSpawn {
            TargetTag = "moloch_spawnpoint",
            Player = "pl_Enemy1",
            SquadId = 39014
        },
        PlayerSquadSpawn {
            TargetTag = "moloch_spawnpoint",
            Player = "pl_Enemy1",
            SquadId = 39014
        }
    }
};

OnOneTimeEvent {
    Conditions = {
        EntityHealthIsLess {
            For = "ANY", 
            Tag = "moloch_spawner", 
            Percent = 40
        }
    },
    Actions = {
        PlayerSquadSpawn {
            TargetTag = "moloch_spawnpoint",
            Player = "pl_Enemy1",
            SquadId = 39022
        },
        PlayerSquadSpawn {
            TargetTag = "moloch_spawnpoint",
            Player = "pl_Enemy1",
            SquadId = 39022
        }
    }
};

OnOneTimeEvent {
    Conditions = {
        EntityHealthIsLess {
            For = "ANY", 
            Tag = "moloch_spawner", 
            Percent = 20
        }
    },
    Actions = {
        PlayerSquadSpawn {
            TargetTag = "moloch_spawnpoint",
            Player = "pl_Enemy1",
            SquadId = 39021
        }
    }
};

State {
    StateName = "INIT"
};