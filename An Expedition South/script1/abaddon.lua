State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = {
        },
        Actions = {
            EntityAbilityAdd
        }
    };

    OnOneTimeEvent {
        Conditions = {
            SquadIsDead {
                Tag = "abaddon",
            }
        }, 
        Actions = {
            MissionTimerStart {
                Name = "mt_winning_delay"
            }
            MissionOutcry {
                TextTag = "",
                Player = "ALL",
                Text = "Moon: You killed Abaddon, good work!",
                PortraitFileName = "moon",
                DurationSeconds = 5
            },
        }
    };

    OnOneTimeEvent {
        Conditions = {
            MapTimerIsElapsed {
                Name = "mt_winning_delay",
                Seconds = 6
            }
        }, 
        Actions = {
            PlayerGameWon {
                Player = "All"
            }
        }
    };
};
