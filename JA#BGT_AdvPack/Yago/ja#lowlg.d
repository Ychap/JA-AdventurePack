REPLACE_ACTION_TEXT BRIELB
~SetGlobal("BrielbaraMove","GLOBAL",1)~
~\0 SetGlobal("JA#LOWLG","GLOBAL",0)~


BEGIN ~JA#LOWLG~

IF WEIGHT #1 ~Global("JA#LOWLG","GLOBAL",0)~ THEN BEGIN 0
  SAY @2
  IF ~~ THEN REPLY @3 GOTO 1
  IF ~Global("BrielbaraMove","GLOBAL",1)~ THEN REPLY @4 GOTO 2
  IF ~Global("BrielbaraMove","GLOBAL",1)~ THEN REPLY @5 GOTO 4
  IF ~~ THEN REPLY @6
  DO ~ActionOverride(Player1,LeaveAreaLUA("%BaldursGateDocks%","",[3464.3054],8)) ActionOverride(Player2,LeaveAreaLUA("%BaldursGateDocks%","",[2891.2715],8)) ActionOverride(Player3,LeaveAreaLUA("%BaldursGateDocks%","",[3416.3091],8)) ActionOverride(Player4,LeaveAreaLUA("%BaldursGateDocks%","",[3480.3090],8)) ActionOverride(Player5,LeaveAreaLUA("%BaldursGateDocks%","",[3384.3114],8)) ActionOverride(Player6,LeaveAreaLUA("%BaldursGateDocks%","",[3432.3150],8))~ EXIT
END

IF ~~ THEN BEGIN 1
  SAY @7
  IF ~PartyGoldGT(0) NumInPartyAlive(1)~ THEN REPLY @15 GOTO JA#LOWLG_1
  IF ~PartyGoldGT(1) NumInPartyAliveGT(1) NumInPartyAliveLT(3)~ THEN REPLY @15 GOTO JA#LOWLG_2
  IF ~PartyGoldGT(2) NumInPartyAliveGT(2) NumInPartyAliveLT(4)~ THEN REPLY @15 GOTO JA#LOWLG_3
  IF ~PartyGoldGT(3) NumInPartyAliveGT(3) NumInPartyAliveLT(5)~ THEN REPLY @15 GOTO JA#LOWLG_4
  IF ~PartyGoldGT(4) NumInPartyAliveGT(4) NumInPartyAliveLT(6)~ THEN REPLY @15 GOTO JA#LOWLG_5
  IF ~PartyGoldGT(5) NumInPartyAlive(6)~ THEN REPLY @15 GOTO JA#LOWLG_6
  IF ~~ THEN REPLY @16
  DO ~ActionOverride(Player1,LeaveAreaLUA("%BaldursGateDocks%","",[3464.3054],8)) ActionOverride(Player2,LeaveAreaLUA("%BaldursGateDocks%","",[2891.2715],8)) ActionOverride(Player3,LeaveAreaLUA("%BaldursGateDocks%","",[3416.3091],8)) ActionOverride(Player4,LeaveAreaLUA("%BaldursGateDocks%","",[3480.3090],8)) ActionOverride(Player5,LeaveAreaLUA("%BaldursGateDocks%","",[3384.3114],8)) ActionOverride(Player6,LeaveAreaLUA("%BaldursGateDocks%","",[3432.3150],8))~ EXIT
  IF ~~ THEN REPLY @17
  DO ~ActionOverride(Player1,LeaveAreaLUA("%BaldursGateDocks%","",[3464.3054],8)) ActionOverride(Player2,LeaveAreaLUA("%BaldursGateDocks%","",[2891.2715],8)) ActionOverride(Player3,LeaveAreaLUA("%BaldursGateDocks%","",[3416.3091],8)) ActionOverride(Player4,LeaveAreaLUA("%BaldursGateDocks%","",[3480.3090],8)) ActionOverride(Player5,LeaveAreaLUA("%BaldursGateDocks%","",[3384.3114],8)) ActionOverride(Player6,LeaveAreaLUA("%BaldursGateDocks%","",[3432.3150],8))~ EXIT
END

IF ~~ THEN BEGIN 2
  SAY @8
  IF ~~ THEN REPLY @9 GOTO 1
  IF ~~ THEN REPLY @10 GOTO 3
END

IF ~~ THEN BEGIN 3
  SAY @11
  IF ~~ THEN REPLY @9 GOTO 1
  IF ~~ THEN REPLY @12
  DO ~ActionOverride(Player1,LeaveAreaLUA("%BaldursGateDocks%","",[3464.3054],8)) ActionOverride(Player2,LeaveAreaLUA("%BaldursGateDocks%","",[2891.2715],8)) ActionOverride(Player3,LeaveAreaLUA("%BaldursGateDocks%","",[3416.3091],8)) ActionOverride(Player4,LeaveAreaLUA("%BaldursGateDocks%","",[3480.3090],8)) ActionOverride(Player5,LeaveAreaLUA("%BaldursGateDocks%","",[3384.3114],8)) ActionOverride(Player6,LeaveAreaLUA("%BaldursGateDocks%","",[3432.3150],8))~ EXIT
END

IF ~~ THEN BEGIN 4
  SAY @13
  IF ~~ THEN DO ~ActionOverride(Player1,LeaveAreaLUA("%BaldursGateDocks%","",[3464.3054],8)) ActionOverride(Player2,LeaveAreaLUA("%BaldursGateDocks%","",[2891.2715],8)) ActionOverride(Player3,LeaveAreaLUA("%BaldursGateDocks%","",[3416.3091],8)) ActionOverride(Player4,LeaveAreaLUA("%BaldursGateDocks%","",[3480.3090],8)) ActionOverride(Player5,LeaveAreaLUA("%BaldursGateDocks%","",[3384.3114],8)) ActionOverride(Player6,LeaveAreaLUA("%BaldursGateDocks%","",[3432.3150],8))~ EXIT
END


IF WEIGHT #0 ~OR(2) StateCheck(Myself,STATE_CHARMED) Global("JA#LOWLG","GLOBAL",1)~ THEN BEGIN 5
  SAY @0
  IF ~~ THEN EXIT
END


IF WEIGHT #-1 ~Global("YagoFight","GLOBAL",1)~ THEN BEGIN 6
  SAY @1
  IF ~~ THEN EXIT
END


IF ~~ THEN BEGIN JA#LOWLG_1
  SAY @14
  IF ~~ THEN DO ~SetGlobal("JA#LOWLG","GLOBAL",1) TakePartyGold(1)~ EXIT
END

IF ~~ THEN BEGIN JA#LOWLG_2
  SAY @14
  IF ~~ THEN DO ~SetGlobal("JA#LOWLG","GLOBAL",1) TakePartyGold(2)~ EXIT
END

IF ~~ THEN BEGIN JA#LOWLG_3
  SAY @14
  IF ~~ THEN DO ~SetGlobal("JA#LOWLG","GLOBAL",1) TakePartyGold(3)~ EXIT
END

IF ~~ THEN BEGIN JA#LOWLG_4
  SAY @14
  IF ~~ THEN DO ~SetGlobal("JA#LOWLG","GLOBAL",1) TakePartyGold(4)~ EXIT
END

IF ~~ THEN BEGIN JA#LOWLG_5
  SAY @14
  IF ~~ THEN DO ~SetGlobal("JA#LOWLG","GLOBAL",1) TakePartyGold(5)~ EXIT
END

IF ~~ THEN BEGIN JA#LOWLG_6
  SAY @14
  IF ~~ THEN DO ~SetGlobal("JA#LOWLG","GLOBAL",1) TakePartyGold(6)~ EXIT
END

// END JA#LOWLG
