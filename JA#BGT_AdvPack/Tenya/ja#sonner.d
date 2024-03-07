ADD_TRANS_ACTION SONNER
BEGIN 13 17 END
BEGIN END
~%state18_response0_action_end%~


EXTEND_BOTTOM SONNER 14
IF ~~ THEN REPLY @0 EXTERN SONNER JA#SONNER_1
END

CHAIN
IF ~~ THEN SONNER JA#SONNER_1
 @1 DO ~SetGlobal("HostileFishermen","GLOBAL",1) SetGlobal("JA#KillFishermen","%FishingVillage%",1)~
  = @2
  == JEBADO @3
  == SONNER @4
  == TELMAN @5
EXIT
