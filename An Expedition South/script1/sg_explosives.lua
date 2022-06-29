State {
    StateName = "INIT",
    OnOneTimeEvent {
        Conditions = {
            ScriptGroupAliveAmountIsLessOrEqual {
                Group = "sg_explosives", 
                Value  = 2, 
            }
        },
        Actions = {
            BuildingDestroy {
                Tag = "sg_explosives"
            }
        }
    };
};
 