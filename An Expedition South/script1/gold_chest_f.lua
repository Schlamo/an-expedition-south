State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = {
            TeamSquadIsInRange {
                Team = "tm_Team1",
                TargetTag = "gold_chest_f",
                Range = 10
            }
        },
        Actions = {
            PlayerPowerGive {
                Player = "pl_Player1", 
                Amount = 20
            },
            PlayerPowerGive {
                Player = "pl_Player2", 
                Amount = 20
            },
            MissionOutcry {
                PortraitFileName = "goldChest",
                DurationSeconds = 3,
                TextTag = "",
                Player = "ALL",
                Text = "Some gold has been looted!"
            },
        }
    };
};
