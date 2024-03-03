// GLOBAL "TalkedToZorlIrenl" is used in BGEE
ADD_TRANS_ACTION IRLENT
BEGIN 0 END
BEGIN END
~SetGlobal("TalkedToZorlIrenl","GLOBAL",1)~

ADD_TRANS_ACTION ZORL
BEGIN 0 END
BEGIN END
~SetGlobal("TalkedToZorlIrenl","GLOBAL",1)~

ADD_TRANS_TRIGGER ALDETH 14
~Global("TalkedToZorlIrenl","GLOBAL",1)~ DO 1


EXTEND_BOTTOM ALDETH 14
IF ~PartyHasItem("SCRL2P")~ THEN REPLY @1 DO ~SetGlobal("JA#ALDETH_KNOWDOPP","GLOBAL",1)~ UNSOLVED_JOURNAL @1025 GOTO JA#ALDETH_30
IF ~!PartyHasItem("SCRL2P") GlobalGT("JA#DOPPELGANGER_SPAWN","GLOBAL",0) Global("JA#SENDZORL","GLOBAL",2)~ THEN REPLY @2 GOTO JA#ALDETH_31
END


APPEND ALDETH

IF WEIGHT #-1 ~Global("JA#CUTSCENE_ACTIVE","%SWBaldursGate_MerchantLeague_L3%",1) Global("JA#ALDETH_KNOWDOPP","GLOBAL",0)~ THEN JA#ALDETH_01
SAY @24
IF ~~ THEN EXTERN IRLENT 3
END

IF WEIGHT #-1 ~Global("JA#CUTSCENE_ACTIVE","%SWBaldursGate_MerchantLeague_L3%",1) Global("JA#ALDETH_KNOWDOPP","GLOBAL",1)~ THEN JA#ALDETH_Y1
SAY @25 = @26
IF ~~ THEN EXTERN ZORL JA#ZORL_100
END

IF ~~ THEN BEGIN JA#ALDETH_30
SAY @31 = @32
IF ~~ THEN DO ~SetGlobal("JA#CUIRL","GLOBAL",1) SetGlobal("JA#ALD_MOVE1","%SWBaldursGate_MerchantLeague_L2%",1) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN JA#ALDETH_31
SAY @33
IF ~~ THEN DO ~SetGlobal("JA#CUIRL","GLOBAL",1) SetGlobal("JA#ALD_MOVE1","%SWBaldursGate_MerchantLeague_L2%",1) EscapeArea()~ EXIT
END

/* new dialogue state - if PC attacked Zorl or Irlentree and forced them to change without the invitation to the 2nd floor */

IF WEIGHT #-1
~Global("ZorlDopple","GLOBAL",1) GlobalLT("AldethDopple","GLOBAL",6)
Global("Chapter","GLOBAL",%tutu_chapter_5%)
Global("HelpAldeth","GLOBAL",1)~ THEN fight_started
SAY @69
IF ~~ THEN EXIT
END

END // APPEND ALDETH


ADD_STATE_TRIGGER ZORL 4
~AreaCheck("%SWBaldursGate_MerchantLeague_L3%") Global("JA#CUIRL","GLOBAL",50)~


ALTER_TRANS ZORL
BEGIN 7 END
BEGIN 0 END
BEGIN
  "ACTION" ~SetGlobal("ZorlDopple","GLOBAL",1)~
  "EPILOGUE" ~GOTO 11~
END


APPEND ZORL

IF ~~ THEN BEGIN JA#ZORL_100
SAY @42
IF ~~ THEN EXTERN IRLENT 4
END

IF ~AreaCheck("%SWBaldursGate_MerchantLeague_L3%") Global("JA#CUIRL","GLOBAL",0)~ THEN BEGIN JA#ZORL_04
SAY @110
IF ~~ THEN EXIT
END

END // APPEND ZORL
