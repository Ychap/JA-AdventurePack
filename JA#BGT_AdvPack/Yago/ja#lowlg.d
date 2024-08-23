BEGIN ~JA#LOWLG~

IF ~StateCheck(Myself,STATE_CHARMED)~ THEN BEGIN 5
  SAY @0
  IF ~~ THEN EXIT
END

IF ~Global("YagoFight","GLOBAL",1)~ THEN BEGIN 6
  SAY @1
  IF ~~ THEN EXIT
END

IF ~Global("JA#LOWLG","GLOBAL",0)~ THEN 0
  SAY @2
  IF ~~ THEN REPLY @3 GOTO 1
  IF ~Global("BrielbaraMove","GLOBAL",1)~ THEN REPLY @4 GOTO 2
  IF ~Global("BrielbaraMove","GLOBAL",1)~ THEN REPLY @5 GOTO 4
  IF ~~ THEN REPLY @6 DO ~MOVEPARTY~ EXIT
END

IF ~~ THEN 1
  SAY @7
  IF ~PartyGoldGT(0) NumInPartyAlive(1)~                        THEN REPLY @15 DO ~TakePartyGold(1)~ GOTO JA#LOWLG_1
  IF ~PartyGoldGT(1) NumInPartyAliveGT(1) NumInPartyAliveLT(3)~ THEN REPLY @15 DO ~TakePartyGold(2)~ GOTO JA#LOWLG_1
  IF ~PartyGoldGT(2) NumInPartyAliveGT(2) NumInPartyAliveLT(4)~ THEN REPLY @15 DO ~TakePartyGold(3)~ GOTO JA#LOWLG_1
  IF ~PartyGoldGT(3) NumInPartyAliveGT(3) NumInPartyAliveLT(5)~ THEN REPLY @15 DO ~TakePartyGold(4)~ GOTO JA#LOWLG_1
  IF ~PartyGoldGT(4) NumInPartyAliveGT(4) NumInPartyAliveLT(6)~ THEN REPLY @15 DO ~TakePartyGold(5)~ GOTO JA#LOWLG_1
  IF ~PartyGoldGT(5) NumInPartyAlive(6)~                        THEN REPLY @15 DO ~TakePartyGold(5)~ GOTO JA#LOWLG_1
  IF ~~ THEN REPLY @16 DO ~MOVEPARTY~ EXIT
  IF ~~ THEN REPLY @17 DO ~MOVEPARTY~ EXIT
END

IF ~~ THEN 2
  SAY @8
  IF ~~ THEN REPLY @9 GOTO 1
  IF ~~ THEN REPLY @10 GOTO 3
END

IF ~~ THEN 3
  SAY @11
  IF ~~ THEN REPLY @9 GOTO 1
  IF ~~ THEN REPLY @12 DO ~MOVEPARTY~ EXIT
END

IF ~~ THEN 4
  SAY @13
  IF ~~ THEN DO ~MOVEPARTY~ EXIT
END

IF ~~ THEN JA#LOWLG_1
  SAY @14
  IF ~~ THEN DO ~SetGlobal("JA#LOWLG","GLOBAL",1)~ EXIT
END

IF ~True()~ THEN BEGIN 7
  SAY @18
  IF ~~ THEN EXIT
END

// END JA#LOWLG
