REPLACE_STATE_TRIGGER DUNKIN 5 ~Global("JA#DUNKIN","%Beregost_FeldepostsInn_L1%",1)~


ADD_TRANS_ACTION DUNKIN
BEGIN 5 END
BEGIN END
~SetGlobal("JA#DUNKIN","%Beregost_FeldepostsInn_L1%",2) ChangeEnemyAlly("Marl",NEUTRAL) ClearAllActions()~
