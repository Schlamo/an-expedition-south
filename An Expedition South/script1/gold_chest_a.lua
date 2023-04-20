State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = {
            TeamSquadIsInRange {
                Team = "tm_Team1",
                TargetTag = "gold_chest_a",
                Range = 10
            }
        },
        Actions = {
            PlayerPowerGive {
                Player = "pl_Player1", 
                Amount = 10
            },
            PlayerPowerGive {
                Player = "pl_Player2", 
                Amount = 10
            },
            MissionOutcry {
                PortraitFileName = "goldChest",
                DurationSeconds = 3,
                TextTag = "",
                Player = "ALL",
                Text = "You found some treasure!"
            },
            EffectStart {
                Tag = "gold_chest_a",
                Effect = "effect_building_quest_goldchest_complete"
            }
        }
    };
};
