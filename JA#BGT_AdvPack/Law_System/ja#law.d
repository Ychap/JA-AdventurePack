BEGIN ~JA#LAW01~

IF ~NumTimesTalkedTo(0)~ THEN 0
  SAY @0 = @1
  IF ~~ THEN REPLY @2 GOTO 1
  IF ~~ THEN REPLY @3 DO ~SetGlobalTimer("JA#ELFSBLOCKED","GLOBAL",FIVE_DAYS) TakePartyGold(200)~ JOURNAL @4 GOTO 2
END

IF ~~ THEN 1
  SAY @5
  IF ~~ THEN DO ~SetGlobal("JA#HOSTILEGUA","MYAREA",1) Enemy()~ EXIT
END

IF ~~ THEN 2
  SAY @6
  IF ~~ THEN
    DO ~SetGlobal("JA#DESTOYGUA","MYAREA",1)
        ActionOverride(Player1,LeaveAreaLUA("%EBaldursGate%","",[1816.2513],0))
        ActionOverride(Player2,LeaveAreaLUA("%EBaldursGate%","",[1752.2502],0))
        ActionOverride(Player3,LeaveAreaLUA("%EBaldursGate%","",[1832.2466],0))
        ActionOverride(Player4,LeaveAreaLUA("%EBaldursGate%","",[1768.2454],0))
        ActionOverride(Player5,LeaveAreaLUA("%EBaldursGate%","",[1848.2430],0))
        ActionOverride(Player6,LeaveAreaLUA("%EBaldursGate%","",[1784.2418],0))~
  EXIT
END

// END JA#LAW01


BEGIN ~JA#LAW03~

IF ~AreaCheck("%FriendlyArmInn%") GlobalGT("JA#FRIEND_RAUS","GLOBAL",0)~ THEN 0
  SAY @7
  IF ~~ THEN DO ~ReputationInc(-1) MoveToPoint([1587.2836]) DestroySelf()~ EXIT
END

IF ~Global("JA#FRIEND_RAUS","GLOBAL",0)~ THEN 3
  SAY @8
  IF ~ReactionLT(LastTalkedToBy,NEUTRAL_LOWER)~ THEN GOTO 4
  IF ~ReactionGT(LastTalkedToBy,HOSTILE_UPPER)~ THEN GOTO 5
END

IF ~~ THEN 4
  SAY @9
  IF ~~ THEN REPLY @10 DO ~Enemy()~ EXIT
  IF ~~ THEN REPLY @11
    DO ~TakePartyGold(200)
        SetGlobalTimer("JA#FRBLOCKED","GLOBAL",EIGHT_DAYS)
        IncrementGlobal("JA#FRIEND_RAUS","GLOBAL",1)
        ClearAllActions()
        StartCutSceneMode()
        StartCutScene("JA#FRCUT")~
    JOURNAL @12
  EXIT
END

IF ~~ THEN 5
  SAY @13
  IF ~~ THEN REPLY @10 DO ~Enemy()~ EXIT
  IF ~~ THEN REPLY @11
    DO ~SetGlobalTimer("JA#FRBLOCKED","GLOBAL",EIGHT_DAYS)
        IncrementGlobal("JA#FRIEND_RAUS","GLOBAL",1)
        ClearAllActions()
        StartCutSceneMode()
        StartCutScene("JA#FRCUT")~
    JOURNAL @12
  EXIT
END

IF ~Global("JA#FRIEND_RAUS","GLOBAL",1)~ THEN 6
  SAY @14 = @15
  IF ~~ THEN REPLY @16 DO ~Enemy()~ EXIT
  IF ~~ THEN REPLY @17
    DO ~TakePartyGold(500)
        SetGlobalTimer("JA#FRBLOCKED","GLOBAL",TEN_DAYS)
        IncrementGlobal("JA#FRIEND_RAUS","GLOBAL",1)
        ClearAllActions()
        StartCutSceneMode()
        StartCutScene("JA#FRCUT")~
    JOURNAL @18
  EXIT
END

IF ~Global("JA#FRIEND_RAUS","GLOBAL",2)~ THEN 7
  SAY @19 = @20
  IF ~~ THEN DO ~IncrementGlobal("JA#FRIEND_RAUS","GLOBAL",1) Enemy()~ EXIT
END

// END JA#LAW03


BEGIN ~JA#LAW05~

IF ~NumTimesTalkedTo(0)~ THEN 0
  SAY @21 = @22
  IF ~~ THEN REPLY @2 GOTO 1
  IF ~~ THEN REPLY @3 DO ~TakePartyGold(100)~ GOTO 2
END

IF ~~ THEN 1
  SAY @5
  IF ~~ THEN DO ~SetGlobal("JA#HOSTILEGUA","MYAREA",1) Enemy()~ EXIT
END

IF ~~ THEN 2
  SAY @6
  IF ~~ THEN
    DO ~SetGlobal("JA#DESTOYGUA","MYAREA",1)
        ActionOverride(Player1,LeaveAreaLUA("%NEBaldursGate%","",[103.1854],0))
        ActionOverride(Player2,LeaveAreaLUA("%NEBaldursGate%","",[40.1854],0))
        ActionOverride(Player3,LeaveAreaLUA("%NEBaldursGate%","",[118.1818],0))
        ActionOverride(Player4,LeaveAreaLUA("%NEBaldursGate%","",[72.1770],0))
        ActionOverride(Player5,LeaveAreaLUA("%NEBaldursGate%","",[56.1806],0))
        ActionOverride(Player6,LeaveAreaLUA("%NEBaldursGate%","",[134.1782],0))~
  EXIT
END

// END JA#LAW05
