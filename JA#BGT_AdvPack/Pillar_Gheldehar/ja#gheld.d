BEGIN ~JA#GHELD~

IF ~StateCheck(Myself,STATE_CHARMED) Global("JA#PILAR_JOB","GLOBAL",1)~ THEN JA_CHARM1
  SAY @0
  IF ~Global("JA#GHELDCHARM","LOCALS",0)~ THEN REPLY @1 DO ~SetGlobal("JA#GHELDCHARM","LOCALS",1)~ GOTO JA_CHARM2
  IF ~~ THEN REPLY @2 EXIT
END

IF ~~ THEN JA_CHARM2
  SAY @3
  IF ~~ THEN DO ~GiveItem("JA#PILAR",LastTalkedToBy)~ EXIT
END

IF ~Class(LastTalkedToBy(Myself),CLERIC_ALL)~ THEN 0
  SAY @4
  IF ~~ THEN EXIT
END

IF ~Global("JA#GHELD_JOB","GLOBAL",0)~ THEN 1
  SAY @5
  IF ~~ THEN REPLY @6 DO ~SetGlobal("JA#GHELD_JOB","GLOBAL",1)~ UNSOLVED_JOURNAL @1037 EXIT
  IF ~~ THEN REPLY @8 DO ~SetGlobal("JA#GHELD_JOB","GLOBAL",2)~ GOTO 7
END

IF ~!PartyHasItem("JA#GHELD") Global("JA#GHELD_JOB","GLOBAL",1)~ THEN 2
  SAY @9
  IF ~~ THEN EXIT
END

IF ~PartyHasItem("JA#GHELD") Global("JA#GHELD_JOB","GLOBAL",1) Dead("JA#PILAR")~ THEN 3
  SAY @10
  IF ~~ THEN DO ~TakePartyItem("JA#GHELD") SetGlobal("JA#GHELD_JOB","GLOBAL",2) DestroyItem("JA#GHELD") AddexperienceParty(400) EraseJournalEntry(@1035) EraseJournalEntry(@1037)~ SOLVED_JOURNAL @1038 EXIT
END

IF ~PartyHasItem("JA#GHELD")
Global("JA#GHELD_JOB","GLOBAL",1)
!Dead("JA#PILAR")
HPPercentGT(Player1,90)
HPPercentGT(Player2,90)
HPPercentGT(Player3,90)
HPPercentGT(Player4,90)
HPPercentGT(Player5,90)
HPPercentGT(Player6,90)~ THEN 4
  SAY @12
  IF ~~ THEN DO ~TakePartyItem("JA#GHELD") SetGlobal("JA#GHELD_JOB","GLOBAL",2) DestroyItem("JA#GHELD") GiveGoldForce(90) AddexperienceParty(400) EraseJournalEntry(@1037)~ SOLVED_JOURNAL @1038 EXIT
END

IF ~PartyHasItem("JA#GHELD")
Global("JA#GHELD_JOB","GLOBAL",1)
!Dead("JA#PILAR")
OR(6)
HPPercentLT(Player1,91)
HPPercentLT(Player2,91)
HPPercentLT(Player3,91)
HPPercentLT(Player4,91)
HPPercentLT(Player5,91)
HPPercentLT(Player6,91)~ THEN 5
  SAY @13
  IF ~~ THEN DO ~TakePartyItem("JA#GHELD") SetGlobal("JA#GHELD_JOB","GLOBAL",2) DestroyItem("JA#GHELD") AddexperienceParty(400) EraseJournalEntry(@1037) ForceSpell([PC],CLERIC_MASS_CURE)~ SOLVED_JOURNAL @1038 EXIT
END

IF ~True()~ THEN 6
  SAY @14
  IF ~~ THEN EXIT
END

IF ~~ THEN 7
  SAY @15
  IF ~~ THEN EXIT
END

// END JA#GHELD
