BEGIN ~JA#VELVE~

IF ~NumTimesTalkedTo(0) Global("JA#BRAUN_TOT","%NashkelCarnival%",0) Global("JA#WEISS_TOT","%NashkelCarnival%",0) Exists("JA#COCK1") Exists("JA#COCK2")~ THEN 0
  SAY @1
  IF ~~ THEN REPLY @2 DO ~SetGlobal("JA#VELVET_BRAUN","LOCALS",1)~ GOTO 1
  IF ~~ THEN REPLY @3 DO ~SetGlobal("JA#VELVET_WEISS","LOCALS",1)~ GOTO 1
  IF ~~ THEN REPLY @4 GOTO 11
  IF ~~ THEN REPLY @5 GOTO 2
END

IF ~~ THEN 1
  SAY @6
  IF ~PartyGoldGT(34)~ THEN REPLY @7 DO ~SetGlobal("JA#VELVET_MONEY","LOCALS",35) TakePartyGold(35)~ GOTO 10
  IF ~PartyGoldGT(64)~ THEN REPLY @8 DO ~SetGlobal("JA#VELVET_MONEY","LOCALS",65) TakePartyGold(65)~ GOTO 10
  IF ~PartyGoldGT(99)~ THEN REPLY @9 DO ~SetGlobal("JA#VELVET_MONEY","LOCALS",100) TakePartyGold(100)~ GOTO 10
  IF ~~ THEN REPLY @10 DO ~SetGlobal("JA#VELVET_BRAUN","LOCALS",0) SetGlobal("JA#VELVET_WEISS","LOCALS",0)~ GOTO 2
  IF ~~ THEN REPLY @11 DO ~SetGlobal("JA#VELVET_BRAUN","LOCALS",0) SetGlobal("JA#VELVET_WEISS","LOCALS",0)~ GOTO 12
END

IF ~~ THEN 2
  SAY @12
  IF ~~ THEN EXIT
END


IF ~Global("JA#VELVET_WIN","LOCALS",1) Global("JA#VELVET_MONEY","LOCALS",35)~ THEN 3
  SAY @13
  IF ~~ THEN DO ~SetGlobal("JA#VELVET_WIN","LOCALS",0) GiveGoldForce(35) GiveGoldForce(30)~ EXIT
END

IF ~Global("JA#VELVET_WIN","LOCALS",1) Global("JA#VELVET_MONEY","LOCALS",65)~ THEN 4
  SAY @14
  IF ~~ THEN DO ~SetGlobal("JA#VELVET_WIN","LOCALS",0) GiveGoldForce(65) GiveGoldForce(60)~ EXIT
END

IF ~Global("JA#VELVET_WIN","LOCALS",1) Global("JA#VELVET_MONEY","LOCALS",100)~ THEN 5
  SAY @15
  IF ~~ THEN DO ~SetGlobal("JA#VELVET_WIN","LOCALS",0) GiveGoldForce(100) GiveGoldForce(95)~ EXIT
END

IF ~Global("JA#VELVET_WIN","LOCALS",2)~ THEN 6
  SAY @16
  IF ~~ THEN DO ~SetGlobal("JA#VELVET_WIN","LOCALS",0)~ EXIT
END


IF ~Global("JA#BRAUN_TOT","%NashkelCarnival%",0) Global("JA#WEISS_TOT","%NashkelCarnival%",0) Exists("JA#COCK1") Exists("JA#COCK2")~ THEN 7
  SAY @17
  IF ~~ THEN REPLY @2 DO ~SetGlobal("JA#VELVET_BRAUN","LOCALS",1)~ GOTO 1
  IF ~~ THEN REPLY @3 DO ~SetGlobal("JA#VELVET_WEISS","LOCALS",1)~ GOTO 1
  IF ~~ THEN REPLY @4 GOTO 11
  IF ~~ THEN REPLY @18 GOTO 2
  IF ~~ THEN REPLY @11 DO ~SetGlobal("JA#VELVET_BRAUN","LOCALS",0) SetGlobal("JA#VELVET_WEISS","LOCALS",0)~ GOTO 12
END


IF WEIGHT #-1 ~Class(LastTalkedToBy(Myself),PALADIN)~ THEN 8
  SAY @0
  IF ~~ THEN EXIT
END


IF ~OR(2) Global("JA#BRAUN_TOT","%NashkelCarnival%",1) Global("JA#WEISS_TOT","%NashkelCarnival%",1) OR(2) Global("JA#BRAUN_TOT","%NashkelCarnival%",0) Global("JA#WEISS_TOT","%NashkelCarnival%",0)~ THEN 9
  SAY @19
  IF ~~ THEN EXIT
END


IF ~~ THEN 10
  SAY @20
  IF ~~ THEN DO ~ClearAllActions() FaceObject("JA#COCK2") StartCutSceneMode() StartCutScene("JA#CCKF1")~ JOURNAL @21 EXIT
END


IF ~Global("JA#BRAUN_TOT","%NashkelCarnival%",1) Global("JA#WEISS_TOT","%NashkelCarnival%",1)~ THEN 11
  SAY @22
  IF ~~ THEN EXIT
END


IF ~~ THEN 12
  SAY @23
  IF ~~ THEN EXIT
END

// END JA#VELVE
