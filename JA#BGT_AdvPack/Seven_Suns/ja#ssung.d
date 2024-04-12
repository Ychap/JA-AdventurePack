BEGIN ~JA#SSGU1~

IF ~StateCheck(Myself,STATE_CHARMED)~ THEN 6
  SAY @0
  IF ~~ THEN EXIT
END

IF ~Global("JA#DLG_GUA","LOCALS",1)~ THEN JA#SSUNGU_03
  SAY @7
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~NumTimesTalkedTo(0)~ THEN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
  IF ~~ THEN REPLY @3 GOTO 2
  IF ~~ THEN REPLY @4 EXIT
END

IF ~~ THEN 1
  SAY @5
  IF ~~ THEN DO ~SetGlobal("JA#7SUNS_GUARDDEAD","GLOBAL",1) MoveToPoint([546.215]) DestroySelf()~ EXIT
END

IF ~~ THEN 2
  SAY @6
  IF ~~ THEN EXIT
END

IF ~NumTimesTalkedToGT(0)~ THEN JA#SSUNGU_01
  SAY @8
  IF ~~ THEN REPLY @2 GOTO 1
  IF ~~ THEN REPLY @9 EXIT
END

// END JA#SSGU1



BEGIN ~JA#SSGU3~

IF ~Global("Doppleganger","GLOBAL",0)~ THEN 0
  SAY @12
  IF ~~ THEN GOTO 1
END

IF ~~ THEN 1
  SAY @13
  IF ~~ THEN REPLY @14 GOTO 2
  IF ~~ THEN REPLY @15 DO ~
ActionOverride(Player1,LeaveAreaLUA("%SWBaldursGate%","",[3648.1404],14))
ActionOverride(Player2,LeaveAreaLUA("%SWBaldursGate%","",[3596.1427],14))
ActionOverride(Player3,LeaveAreaLUA("%SWBaldursGate%","",[3615.1374],14))
ActionOverride(Player4,LeaveAreaLUA("%SWBaldursGate%","",[3567.1389],14))
ActionOverride(Player5,LeaveAreaLUA("%SWBaldursGate%","",[3577.1348],14))
ActionOverride(Player6,LeaveAreaLUA("%SWBaldursGate%","",[3533.1367],14))~ EXIT
END

IF ~~ THEN 2
  SAY @16
  IF ~~ THEN DO ~SetGlobal("Doppleganger","GLOBAL",1)~ EXIT
END

// END JA#SSGU3



BEGIN ~JA#SSGU4~

IF ~~ THEN 0
  SAY @10
  IF ~~ THEN EXTERN JA#SSMR3 2 // in ja#doppse.d
END

IF ~NumTimesTalkedTo(0)~ THEN 1
  SAY @11
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END

// END JA#SSGU4
