ADD_STATE_TRIGGER ZORL 4 ~AreaCheck("%SWBaldursGate_MerchantLeague_L3%") Global("JA#CUIRL","GLOBAL",50)~


ALTER_TRANS ZORL
BEGIN 4 END
BEGIN 0 END
BEGIN
  "ACTION" ~SetGlobal("ZorlDopple","GLOBAL",1)~
  "UNSOLVED_JOURNAL" ~@1025~
END


ALTER_TRANS ZORL
BEGIN 7 END
BEGIN 0 END
BEGIN
  "ACTION" ~SetGlobal("ZorlDopple","GLOBAL",1)~
  "EPILOGUE" ~GOTO 11~
END

ADD_TRANS_ACTION ZORL
BEGIN 11 END
BEGIN END
~SetGlobal("JA#CUTSCENE_ACTIVE","%SWBaldursGate_MerchantLeague_L3%",2)~ // Cutescene is over


APPEND ZORL

IF ~AreaCheck("%SWBaldursGate_MerchantLeague_L3%") Global("JA#CUIRL","GLOBAL",0)~ THEN JA#ZORL_04
  SAY @10
  IF ~~ THEN EXIT
END

END // APPEND ZORL
