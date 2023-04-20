State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = {

        },
        Actions = {
            EntityAbilityAdd {
                Tag = "screaming_stone",
                AbilityId = 190
            },
        }
    };
    OnToggleEvent {
        OnConditions = {
            PlayerSquadIsInRange {
                Player = "pl_Player1",
                TargetTag = "screaming_stone",
                Range = 10
            },
            EntityIsOwnedByPlayer {
                Tag = "screaming_stone",
                Player = "gaia",
            }
        },
        OnActions = {
            EntityPlayerSet {
                Tag = "screaming_stone", 
                Player = "pl_Player1"
            },
            MissionOutcry {
                PortraitFileName = "moon",
                DurationSeconds = 8,
                TextTag = "",
                Player = "ALL",
                Text = "Moon: You reached a magical Amii Screaming Stone or stuff. Use the screaming stone for some other stuff!"
            },
        },
        OffConditions = {
            EntityIsOwnedByPlayer {
                Tag = "screaming_stone",
                Player = "pl_Player1",
            },
            PlayerSquadIsNotInRange {
                Player = "pl_Player1",
                TargetTag = "screaming_stone",
                Range = 10
            }
        },
        OffActions = {
            EntityPlayerSet {
                Tag = "screaming_stone", 
                Player = "gaia"
            },
        }
    };

    OnToggleEvent {
        OnConditions = {
            PlayerSquadIsInRange {
                Player = "pl_Player2",
                TargetTag = "screaming_stone",
                Range = 10
            },
            EntityIsOwnedByPlayer {
                Tag = "screaming_stone",
                Player = "gaia",
            }
        },
        OnActions = {
            EntityPlayerSet {
                Tag = "screaming_stone", 
                Player = "pl_Player2"
            },
            MissionOutcry {
                PortraitFileName = "moon",
                DurationSeconds = 8,
                TextTag = "",
                Player = "ALL",
                Text = "You reached a magical Amii Screaming Stone or stuff. Use the screaming stone for some other stuff!"
            },
        },
        OffConditions = {
            EntityIsOwnedByPlayer {
                Tag = "screaming_stone",
                Player = "pl_Player2",
            },
            PlayerSquadIsNotInRange {
                Player = "pl_Player2",
                TargetTag = "screaming_stone",
                Range = 10
            }
        },
        OffActions = {
            EntityPlayerSet {
                Tag = "screaming_stone", 
                Player = "gaia"
            },
        }
    };
};
