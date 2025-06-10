ADD_STATE_TRIGGER LOUISE 1 ~Global("HelpLaerta","GLOBAL",0) !Dead("Laerta")~


ALTER_TRANS LAERTA
BEGIN 1 END
BEGIN 0 END
BEGIN
  "REPLY" ~@87~
END

ALTER_TRANS LOUISE
BEGIN 1 END
BEGIN 0 END
BEGIN
  "REPLY" ~@87~
END


EXTEND_BOTTOM LAERTA 1
  IF ~!Dead("Louise")~ THEN REPLY @53 GOTO JA_LAERTA_3
  IF ~~ THEN REPLY @54 GOTO JA_LAERTA_1
  IF ~Global("JA#LAERTA_GERV","%NWBaldursGate_LaertasHouse_L1%",0) Global("JA#KNOWGERVIS","%NWBaldursGate_LaertasHouse_L1%",1)~ THEN REPLY @55 DO ~SetGlobal("JA#LAERTA_GERV","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_8
  IF ~Global("JA#LAERTA_VOLT","%NWBaldursGate_LaertasHouse_L1%",0) Global("JA#VOLT_SPWN","%NWBaldursGate_LaertasHouse_L1%",52)~ THEN REPLY @56 DO ~SetGlobal("JA#LAERTA_VOLT","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_9
END

EXTEND_BOTTOM LOUISE 1
  IF ~~ THEN REPLY @53 EXTERN LAERTA JA_LAERTA_3
  IF ~~ THEN REPLY @54 EXTERN LAERTA JA_LAERTA_1
  IF ~Global("JA#LAERTA_GERV","%NWBaldursGate_LaertasHouse_L1%",0) Global("JA#KNOWGERVIS","%NWBaldursGate_LaertasHouse_L1%",1)~ THEN REPLY @55 DO ~SetGlobal("JA#LAERTA_GERV","%NWBaldursGate_LaertasHouse_L1%",1)~ EXTERN LAERTA JA_LAERTA_8
  IF ~Global("JA#LAERTA_VOLT","%NWBaldursGate_LaertasHouse_L1%",0) Global("JA#VOLT_SPWN","%NWBaldursGate_LaertasHouse_L1%",52)~ THEN REPLY @56 DO ~SetGlobal("JA#LAERTA_VOLT","%NWBaldursGate_LaertasHouse_L1%",1)~ EXTERN LAERTA JA_LAERTA_9
END


EXTEND_BOTTOM LAERTA 4
  IF ~Dead("Voltine") %state04_response0_trigger%~ THEN DO ~%state04_response0_action%~ SOLVED_JOURNAL @57 EXIT
  IF ~Dead("Gervisse") %state04_response0_trigger%~ THEN DO ~%state04_response0_action%~ SOLVED_JOURNAL @58 EXIT
  IF ~Dead("Gervisse") Dead("Voltine") %state04_response0_trigger%~ THEN DO ~%state04_response0_action%~ SOLVED_JOURNAL @81 EXIT
END


APPEND LAERTA

IF ~~ THEN JA_LAERTA_1
  SAY @59
  IF ~~ THEN REPLY @60 GOTO JA_LAERTA_2
  IF ~~ THEN REPLY @61 EXIT
END

IF ~~ THEN JA_LAERTA_2
  SAY @62
  IF ~!Dead("Louise")~ THEN REPLY @63 GOTO JA_LAERTA_3
  IF ~Global("JA#LAERTA_GERV","%NWBaldursGate_LaertasHouse_L1%",0) Global("JA#KNOWGERVIS","%NWBaldursGate_LaertasHouse_L1%",1)~ THEN REPLY @55 DO ~SetGlobal("JA#LAERTA_GERV","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_8
  IF ~Global("JA#LAERTA_VOLT","%NWBaldursGate_LaertasHouse_L1%",0) Global("JA#VOLT_SPWN","%NWBaldursGate_LaertasHouse_L1%",52)~ THEN REPLY @56 GOTO JA_LAERTA_9
  IF ~~ THEN REPLY @64 EXIT
END

IF ~~ THEN JA_LAERTA_3
  SAY @65
  IF ~~ THEN EXTERN LOUISE JA_LOUISE_1
END

IF ~~ THEN JA_LAERTA_4
  SAY @66 = @67
  IF ~Global("JA#LAERTA_SPOK","%NWBaldursGate_LaertasHouse_L1%",0)~ THEN REPLY @68 DO ~SetGlobal("JA#LAERTA_SPOK","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_5
  IF ~Global("JA#LAERTA_FACE","%NWBaldursGate_LaertasHouse_L1%",0)~ THEN REPLY @69 DO ~SetGlobal("JA#LAERTA_FACE","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_6
  IF ~Global("JA#LAERTA_SEX","%NWBaldursGate_LaertasHouse_L1%",0)~ THEN REPLY @70 DO ~SetGlobal("JA#LAERTA_SEX","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_7
  IF ~Global("JA#LAERTA_GERV","%NWBaldursGate_LaertasHouse_L1%",0) Global("JA#KNOWGERVIS","%NWBaldursGate_LaertasHouse_L1%",1)~ THEN REPLY @55 DO ~SetGlobal("JA#LAERTA_GERV","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_8
  IF ~Global("JA#LAERTA_VOLT","%NWBaldursGate_LaertasHouse_L1%",0) Global("JA#VOLT_SPWN","%NWBaldursGate_LaertasHouse_L1%",52)~ THEN REPLY @56 DO ~SetGlobal("JA#LAERTA_VOLT","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_9
  IF ~~ THEN REPLY @71 EXIT
END

IF ~~ THEN JA_LAERTA_5
  SAY @72
  IF ~Global("JA#LAERTA_FACE","%NWBaldursGate_LaertasHouse_L1%",0)~ THEN REPLY @69 DO ~SetGlobal("JA#LAERTA_FACE","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_6
  IF ~Global("JA#LAERTA_SEX","%NWBaldursGate_LaertasHouse_L1%",0)~ THEN REPLY @70 DO ~SetGlobal("JA#LAERTA_SEX","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_7
  IF ~Global("JA#LAERTA_GERV","%NWBaldursGate_LaertasHouse_L1%",0) Global("JA#KNOWGERVIS","%NWBaldursGate_LaertasHouse_L1%",1)~ THEN REPLY @55 DO ~SetGlobal("JA#LAERTA_GERV","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_8
  IF ~Global("JA#LAERTA_VOLT","%NWBaldursGate_LaertasHouse_L1%",0) Global("JA#VOLT_SPWN","%NWBaldursGate_LaertasHouse_L1%",52)~ THEN REPLY @56 DO ~SetGlobal("JA#LAERTA_VOLT","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_9
  IF ~~ THEN REPLY @71 EXIT
END

IF ~~ THEN JA_LAERTA_6
  SAY @73
  IF ~Global("JA#LAERTA_SPOK","%NWBaldursGate_LaertasHouse_L1%",0)~ THEN REPLY @68 DO ~SetGlobal("JA#LAERTA_SPOK","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_5
  IF ~Global("JA#LAERTA_SEX","%NWBaldursGate_LaertasHouse_L1%",0)~ THEN REPLY @70 DO ~SetGlobal("JA#LAERTA_SEX","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_7
  IF ~Global("JA#LAERTA_GERV","%NWBaldursGate_LaertasHouse_L1%",0) Global("JA#KNOWGERVIS","%NWBaldursGate_LaertasHouse_L1%",1)~ THEN REPLY @55 DO ~SetGlobal("JA#LAERTA_GERV","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_8
  IF ~Global("JA#LAERTA_VOLT","%NWBaldursGate_LaertasHouse_L1%",0) Global("JA#VOLT_SPWN","%NWBaldursGate_LaertasHouse_L1%",52)~ THEN REPLY @56 DO ~SetGlobal("JA#LAERTA_VOLT","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_9
  IF ~~ THEN REPLY @71 EXIT
END

IF ~~ THEN JA_LAERTA_7
  SAY @74
  IF ~Global("JA#LAERTA_SPOK","%NWBaldursGate_LaertasHouse_L1%",0)~ THEN REPLY @68 DO ~SetGlobal("JA#LAERTA_SPOK","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_5
  IF ~Global("JA#LAERTA_FACE","%NWBaldursGate_LaertasHouse_L1%",0)~ THEN REPLY @69 DO ~SetGlobal("JA#LAERTA_FACE","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_6
  IF ~Global("JA#LAERTA_GERV","%NWBaldursGate_LaertasHouse_L1%",0) Global("JA#KNOWGERVIS","%NWBaldursGate_LaertasHouse_L1%",1)~ THEN REPLY @55 DO ~SetGlobal("JA#LAERTA_GERV","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_8
  IF ~Global("JA#LAERTA_VOLT","%NWBaldursGate_LaertasHouse_L1%",0) Global("JA#VOLT_SPWN","%NWBaldursGate_LaertasHouse_L1%",52)~ THEN REPLY @56 DO ~SetGlobal("JA#LAERTA_VOLT","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_9
  IF ~~ THEN REPLY @71 EXIT
END

IF ~~ THEN JA_LAERTA_8
  SAY @75
  IF ~Global("JA#LAERTA_SPOK","%NWBaldursGate_LaertasHouse_L1%",0)~ THEN REPLY @68 DO ~SetGlobal("JA#LAERTA_SPOK","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_5
  IF ~Global("JA#LAERTA_FACE","%NWBaldursGate_LaertasHouse_L1%",0)~ THEN REPLY @69 DO ~SetGlobal("JA#LAERTA_FACE","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_6
  IF ~Global("JA#LAERTA_SEX","%NWBaldursGate_LaertasHouse_L1%",0)~ THEN REPLY @70 DO ~SetGlobal("JA#LAERTA_SEX","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_7
  IF ~Global("JA#LAERTA_VOLT","%NWBaldursGate_LaertasHouse_L1%",0) Global("JA#VOLT_SPWN","%NWBaldursGate_LaertasHouse_L1%",52)~ THEN REPLY @56 DO ~SetGlobal("JA#LAERTA_VOLT","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_9
  IF ~~ THEN REPLY @71 EXIT
END

IF ~~ THEN JA_LAERTA_9
  SAY @76
  IF ~Global("JA#LAERTA_SPOK","%NWBaldursGate_LaertasHouse_L1%",0)~ THEN REPLY @68 DO ~SetGlobal("JA#LAERTA_SPOK","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_5
  IF ~Global("JA#LAERTA_FACE","%NWBaldursGate_LaertasHouse_L1%",0)~ THEN REPLY @69 DO ~SetGlobal("JA#LAERTA_FACE","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_6
  IF ~Global("JA#LAERTA_SEX","%NWBaldursGate_LaertasHouse_L1%",0)~ THEN REPLY @70 DO ~SetGlobal("JA#LAERTA_SEX","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_7
  IF ~Global("JA#LAERTA_GERV","%NWBaldursGate_LaertasHouse_L1%",0) Global("JA#KNOWGERVIS","%NWBaldursGate_LaertasHouse_L1%",1)~ THEN REPLY @55 DO ~SetGlobal("JA#LAERTA_GERV","%NWBaldursGate_LaertasHouse_L1%",1)~ GOTO JA_LAERTA_8
  IF ~~ THEN REPLY @71 EXIT
END

END // APPEND LAERTA


APPEND LOUISE

IF ~Global("HelpLaerta","GLOBAL",1) !Dead("Laerta")~ THEN JA_LOUISE_2
  SAY @77
  IF ~~ THEN EXTERN LAERTA 4
END

IF ~Global("HelpLaerta","GLOBAL",2)~ THEN JA_LOUISE_SAVED
  SAY @78
  IF ~~ THEN EXIT
END

IF ~~ THEN JA_LOUISE_1
  SAY @79 = @80
  IF ~~ THEN EXTERN LAERTA JA_LAERTA_4
END

END // APPEND LOUISE
