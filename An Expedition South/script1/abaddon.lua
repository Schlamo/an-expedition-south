local barrelExplosionEffect = "effect_je_fire_unit_firesworn_imp";

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
            SquadWasJustHit {
                Tag = "abaddon"
            }
        },
        Actions = {
            MapFlagSetTrue {
                Name = "mf_abaddon_fight_ongoing"
            }
        }
    };

    OnOneTimeEvent {
        Conditions = {
            EntityHealthIsLess {
                Tag = "abaddon",
                Percent = 50
            }
        },
        Actions = {
            MapTimerStart {
                Name = "mt_abaddon_second_phase"
            },
            MissionOutcry {
                PortraitFileName = "abaddon",
                DurationSeconds = 5,
                TextTag = "",
                Player = "ALL",
                Text = "Abaddon: You are challenging me!?"
            },
            AudioSoundUIPlay {
                Sound = "ack_batariel_powenemyspotted1"
            },
        }
    };

    OnOneTimeEvent {
        Conditions = {
            MapTimerIsElapsed {
                Name = "mt_abaddon_second_phase",
                Seconds = 4
            }
        },
        Actions = {
            EffectStart {
                Tag = "abaddon_explosion_marker3",
                Effect = barrelExplosionEffect
            },
        }
    };

    OnOneTimeEvent {
        Conditions = {
            MapTimerIsElapsed {
                Name = "mt_abaddon_second_phase",
                Seconds = 4.3
            }
        },
        Actions = {
            EffectStart {
                Tag = "abaddon_explosion_marker2",
                Effect = barrelExplosionEffect
            },
        }
    };

    OnOneTimeEvent {
        Conditions = {
            MapTimerIsElapsed {
                Name = "mt_abaddon_second_phase",
                Seconds = 4.6
            }
        },
        Actions = {
            EffectStart {
                Tag = "abaddon_explosion_marker1",
                Effect = barrelExplosionEffect
            },
        }
    };

    OnOneTimeEvent {
        Conditions = {
            MapTimerIsElapsed {
                Name = "mt_abaddon_second_phase",
                Seconds = 4.9
            }
        },
        Actions = {
            EffectStart {
                Tag = "abaddon_explosion_marker",
                Effect = barrelExplosionEffect
            },
        }
    };

    OnOneTimeEvent {
        Conditions = {
            MapTimerIsElapsed {
                Name = "mt_abaddon_second_phase",
                Seconds = 5
            }
        },
        Actions = {
            ObjectVanish {
                Tag = "sg_abaddon_fence"
            },
            ObjectVanish {
                Tag = "sg_abaddon_barrel"
            },
            ObjectVanish {
                Tag = "abaddon_rock"
            },
        }
    };

    OnOneTimeEvent {
        Conditions = {
            MapTimerIsElapsed {
                Name = "mt_abaddon_second_phase",
                Seconds = 7
            }
        },
        Actions = {
            PlayerCardSquadFakePlayWithTag {
                TargetTag = "abaddon_miniboss_target",
                Player = "pl_Enemy1",
                Direction = 180,
                CardSquadId = 30000,
                Tag = "vulcanos"
            },
            MapFlagSetTrue {
                Name = "mf_vulcano_spawned"
            },
            EntitySetMaxHealthAbsolute {
                TargetTag = "vulcanos",
                MaxHealthAbsolute = 5000
            },
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
};
