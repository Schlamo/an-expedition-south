State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = {
        },
        Actions = {
            EntityAbilityAdd {
                Tag = "abaddon",
                AbilityId = 435
            }
        }
    };

    OnOneTimeEvent {
        Conditions = {
            SquadIsDead {
                Tag = "abaddon",
            }
        }, 
        Actions = {
            MapTimerStart {Name = "mt_victory_timer"},
            MissionTaskSetSolved {
                Player = "All",
                TaskTag = "goal_kill_abaddon", 
                TargetTag = "abaddon", 
                Summary = "Kill Abaddon."
            },
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
            SquadWasJustHit {
                Tag = "abaddon"
            }
        },
        Actions = {
            MapFlagSetTrue {
                Name = "mf_abaddon_fight_ongoing"
            }
        }
    }
};
