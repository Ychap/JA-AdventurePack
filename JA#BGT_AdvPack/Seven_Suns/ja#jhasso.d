// ADD_STATE_TRIGGER JHASSO 16 ~!Global("JA#JHASSO_MOVE","GLOBAL",0)~
ADD_STATE_TRIGGER JHASSO 0 ~Global("JA#JHASSO_MOVE","GLOBAL",0)~
ADD_STATE_TRIGGER JHASSO 7 ~Global("JA#JHASSO_CH7_TALK","LOCALS",0)~


REPLACE_ACTION_TEXT JHASSO
~EscapeArea\(Destroy\)?([0-9]*)~
~SetGlobal("JA#JHASSO_MOVE","GLOBAL",1) \0~


ALTER_TRANS JHASSO
BEGIN 0 END
BEGIN 0 END
BEGIN
  "TRIGGER" ~Global("TalkedToScar","GLOBAL",1)~ // BGT
  "ACTION" ~SetGlobal("JA#JHASSO_TALK","LOCALS",1)~
END

ALTER_TRANS JHASSO
BEGIN 2 END
BEGIN 1 END
BEGIN
  "TRIGGER" ~Global("TalkedToScar","GLOBAL",1)~ // BGT
  "ACTION" ~SetGlobal("JA#JHASSO_TALK","LOCALS",1)~
END


ALTER_TRANS JHASSO
BEGIN 3 END
BEGIN 0 1 END
BEGIN
  "TRIGGER" ~Global("JA#DOPPSE_TALK","GLOBAL",1)~
END

ALTER_TRANS JHASSO
BEGIN 3 END
BEGIN 1 END
BEGIN
  "EPILOGUE" ~GOTO 18~
END

ALTER_TRANS JHASSO
BEGIN 3 END
BEGIN 2 END
BEGIN
  "TRIGGER" ~Global("JA#DOPPSE_TALK","GLOBAL",0)~
  "EPILOGUE" ~GOTO JA#JHASSO_02~
END

EXTEND_TOP JHASSO 3 #2
  IF ~Global("JA#DOPPSE_TALK","GLOBAL",0)~ THEN REPLY @0 GOTO JA#JHASSO_03
  IF ~Global("JA#DOPPSE_TALK","GLOBAL",0)~ THEN REPLY @1 GOTO JA#JHASSO_03
END


ALTER_TRANS JHASSO
BEGIN 4 END
BEGIN 0 END
BEGIN
  "TRIGGER" ~Global("JA#DOPPSE_TALK","GLOBAL",1)~
END

EXTEND_TOP JHASSO 4 #1
  IF ~Global("JA#DOPPSE_TALK","GLOBAL",0)~ THEN REPLY @2 GOTO JA#JHASSO_03
END


ADD_TRANS_ACTION JHASSO
BEGIN 7 END
BEGIN END
~SetGlobal("JA#JHASSO_CH7_TALK","LOCALS",1)~


ADD_TRANS_ACTION JHASSO
BEGIN 9 END
BEGIN END
~SetGlobal("JA#JHASSO_CH7_TALK","LOCALS",100)~


ALTER_TRANS JHASSO
BEGIN 14 END
BEGIN END
BEGIN
  "ACTION" ~SetGlobal("JA#JHASSO_QUEST","GLOBAL",1)~
  "UNSOLVED_JOURNAL" ~@1012~
END



APPEND JHASSO

IF ~Global("JA#JHASSO_MOVE","GLOBAL",0) Global("JA#JHASSO_TALK","LOCALS",0)~ THEN JA#JHASSO_01
  SAY @4
  IF ~Global("TalkedToScar","GLOBAL",1)~ THEN REPLY @5 DO ~SetGlobal("JA#JHASSO_TALK","LOCALS",1)~ GOTO 4
  IF ~Global("TalkedToScar","GLOBAL",1)~ THEN REPLY @6 DO ~SetGlobal("JA#JHASSO_TALK","LOCALS",1)~ GOTO 3
  IF ~~ THEN REPLY @7 EXIT
END

IF ~~ THEN JA#JHASSO_02
  SAY @8
  COPY_TRANS_LATE JHASSO 18
END

IF ~~ THEN JA#JHASSO_03
  SAY @9
  IF ~~ THEN REPLY @10 DO ~SetGlobal("JA#JHASSO_TALK","LOCALS",1)~ EXIT
  IF ~~ THEN REPLY @11 GOTO JA#JHASSO_02
END

IF ~Global("JA#JHASSO_MOVE","GLOBAL",0) Global("JA#JHASSO_TALK","LOCALS",1)~ THEN JA#JHASSO_04
  SAY @12
  IF ~Global("JA#DOPPSE_TALK","GLOBAL",1)~ THEN REPLY @13 DO ~SetGlobal("JA#JHASSO_MOVE","GLOBAL",1)~ GOTO JA#JHASSO_05
  IF ~Global("JA#DOPPSE_TALK","GLOBAL",0)~ THEN REPLY @14 GOTO JA#JHASSO_02
  IF ~Global("JA#DOPPSE_TALK","GLOBAL",0)~ THEN REPLY @15 EXIT
END

IF ~~ THEN JA#JHASSO_05
  SAY @16
  IF ~~ THEN GOTO 5
END


IF ~Global("JA#JHASSO_MOVE","GLOBAL",2) Global("JA#DOPPSE_TALK","GLOBAL",0)~ THEN JA#JHASSO_06
  SAY @17
  IF ~~ THEN EXIT
END


IF ~Global("JA#JHASSO_MOVE","GLOBAL",2) Global("JA#DOPPSE_TALK","GLOBAL",1)~ THEN JA#JHASSO_09
  SAY @18
  IF ~~ THEN DO ~SetGlobal("JA#JHASSO_MOVE","GLOBAL",3)~ JOURNAL @19 EXIT
END


IF ~Global("JA#JHASSO_MOVE","GLOBAL",3) GlobalLT("Chapter","GLOBAL",%tutu_chapter_7%)~ THEN JA#JHASSO_10
  SAY @20
  IF ~~ THEN EXIT
END

// JHASSO-QUEST:


IF ~Global("JA#JHASSO_CH7_TALK","LOCALS",100)~ THEN JA#JHASSO_HOSTILE
  SAY @21
  IF ~~ THEN EXIT
END


IF ~Global("JA#JHASSO_QUEST","GLOBAL",0) !Global("ENDOFBG1","GLOBAL",2)~ THEN JA#JHASSO_11
  SAY @22
  IF ~~ THEN REPLY @23 GOTO 13
  IF ~~ THEN REPLY @24 EXIT
END


// BGT sets GLOBAL "TalkedToIvanne" in IVANNE.DLG
// EE sets GLOBAL "IvanneStoryTold" in IVANNE.DLG
IF ~Global("JA#JHASSO_QUEST","GLOBAL",1)~ THEN JA#JHASSO_12
  SAY @25
  IF ~OR(2) Global("TalkedToIvanne","GLOBAL",1) Global("IvanneStoryTold","GLOBAL",1) !Dead("RASHAD")~ THEN REPLY @26 GOTO JA#JHASSO_13
  IF ~OR(2) Global("TalkedToIvanne","GLOBAL",1) Global("IvanneStoryTold","GLOBAL",1)  Dead("RASHAD")~ THEN REPLY @27 GOTO JA#JHASSO_18
  IF ~~ THEN REPLY @28 EXIT
END

IF ~~ THEN JA#JHASSO_13
  SAY @29
  IF ~~ THEN REPLY @30 GOTO JA#JHASSO_14
  IF ~~ THEN REPLY @31 GOTO JA#JHASSO_16
END

IF ~~ THEN JA#JHASSO_14
  SAY @32
  IF ~~ THEN REPLY @33 GOTO JA#JHASSO_15
  IF ~~ THEN REPLY @34 GOTO JA#JHASSO_16
END

IF ~~ THEN JA#JHASSO_15
  SAY @35 = @36 = @37
  IF ~~ THEN DO ~SetGlobal("JA#JHASSO_QUEST","GLOBAL",2)~ UNSOLVED_JOURNAL @1014 EXIT
END

IF ~~ THEN JA#JHASSO_16
  SAY @38 = @39
  IF ~~ THEN DO ~SetGlobal("JA#JHASSO_QUEST","GLOBAL",2)~ UNSOLVED_JOURNAL @1013 EXIT
END


IF ~Global("JA#JHASSO_QUEST","GLOBAL",2)~ THEN JA#JHASSO_17
  SAY @40
  IF ~Dead("RASHAD")~ THEN REPLY @41 GOTO JA#JHASSO_18
  IF ~~ THEN REPLY @42 EXIT
END

IF ~~ THEN JA#JHASSO_18
  SAY @43
  IF ~~ THEN REPLY @44 GOTO JA#JHASSO_19
  IF ~~ THEN REPLY @45 GOTO JA#JHASSO_19
END

IF ~~ THEN JA#JHASSO_19
  SAY @46 = @47
  IF ~~ THEN REPLY @48 GOTO JA#JHASSO_20
  IF ~~ THEN REPLY @49 GOTO JA#JHASSO_21
END

IF ~~ THEN JA#JHASSO_20
  SAY @50
  IF ~~ THEN DO ~SetGlobal("JA#JHASSO_QUEST","GLOBAL",3) ReputationInc(1) GiveGoldForce(1000)~ EXIT
END

IF ~~ THEN JA#JHASSO_21
  SAY @52
  IF ~~ THEN DO ~SetGlobal("JA#JHASSO_QUEST","GLOBAL",3) ReputationInc(1)~ EXIT
END


IF ~Global("JA#JHASSO_QUEST","GLOBAL",3) !Global("ENDOFBG1","GLOBAL",2)~ THEN JA#JHASSO_22
  SAY @53
  IF ~~ THEN EXIT
END

END // APPEND JHASSO
