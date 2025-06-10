ADD_STATE_TRIGGER ALDETH 14 ~Global("ZorlDopple","GLOBAL",0)~


EXTEND_BOTTOM ALDETH 14
  IF ~PartyHasItem("SCRL2P")~ THEN REPLY @1 DO ~SetGlobal("JA#ALDETH_KNOWDOPP","GLOBAL",1)~ UNSOLVED_JOURNAL @1025 GOTO JA#ALDETH_30
  IF ~!PartyHasItem("SCRL2P") GlobalGT("JA#DOPPELGANGER_SPAWN","GLOBAL",0) Global("JA#SENDZORL","GLOBAL",2)~ THEN REPLY @2 GOTO JA#ALDETH_31
END


APPEND ALDETH

IF ~~ THEN JA#ALDETH_30
  SAY @31 = @32
  IF ~~ THEN DO ~SetGlobal("JA#CUIRL","GLOBAL",1) SetGlobal("JA#ALD_MOVE1","%SWBaldursGate_MerchantLeague_L2%",1) EscapeArea()~ EXIT
END

IF ~~ THEN JA#ALDETH_31
  SAY @33
  IF ~~ THEN DO ~SetGlobal("JA#CUIRL","GLOBAL",1) SetGlobal("JA#ALD_MOVE1","%SWBaldursGate_MerchantLeague_L2%",1) EscapeArea()~ EXIT
END

/* new dialogue state - if PC attacked Zorl or Irlentree and forced them to change without the invitation to the 2nd floor */
IF WEIGHT #0 ~Global("ZorlDopple","GLOBAL",1) GlobalLT("AldethDopple","GLOBAL",6) Global("Chapter","GLOBAL",%tutu_chapter_5%) Global("HelpAldeth","GLOBAL",1)~ THEN fight_started
  SAY @69
  IF ~~ THEN EXIT
END

END // APPEND ALDETH


CHAIN IF WEIGHT #-1 ~Global("JA#CUTSCENE_ACTIVE","%SWBaldursGate_MerchantLeague_L3%",1) Global("JA#ALDETH_KNOWDOPP","GLOBAL",0)~ THEN ALDETH JA#ALDETH_01
  @24
EXTERN IRLENT 3 // leads to IRLENT 4 which leads ZORL 7


CHAIN IF WEIGHT #-1 ~Global("JA#CUTSCENE_ACTIVE","%SWBaldursGate_MerchantLeague_L3%",1) Global("JA#ALDETH_KNOWDOPP","GLOBAL",1)~ THEN ALDETH JA#ALDETH_Y1
  @25 = @26
  == ZORL @42
EXTERN IRLENT 4 // leads to ZORL 7
