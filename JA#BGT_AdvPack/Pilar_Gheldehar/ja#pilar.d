BEGIN ~JA#PILAR~

IF ~StateCheck(Myself,STATE_CHARMED) Global("JA#GHELD_JOB","GLOBAL",1)~ THEN JA_CHARM1
  SAY @0
  IF ~Global("JA#PILARCHARM","LOCALS",0)~ THEN REPLY @1 DO ~SetGlobal("JA#PILARCHARM","LOCALS",1)~ GOTO JA_CHARM2
  IF ~~ THEN REPLY @2 EXIT
END

IF ~~ THEN JA_CHARM2
  SAY @3
  IF ~~ THEN DO ~GiveItem("JA#GHELD",LastTalkedToBy)~ EXIT
END

IF ~NumTimesTalkedTo(0)~ THEN 0
  SAY @4
  IF ~~ THEN REPLY @5 DO ~TakePartyGold(8)~ GOTO 1
  IF ~~ THEN REPLY @6 GOTO 6
END

IF ~~ THEN 1
  SAY @7
  IF ~~ THEN REPLY @8 DO ~SetGlobal("JA#PILAR_JOB","GLOBAL",1)~ UNSOLVED_JOURNAL @1035 EXIT
  IF ~~ THEN REPLY @10 GOTO 2
END

IF ~~ THEN 2
  SAY @11
  IF ~~ THEN EXIT
END

IF ~!PartyHasItem("JA#PILAR") Global("JA#PILAR_JOB","GLOBAL",1)~ THEN 3
  SAY @12
  IF ~~ THEN EXIT
END

IF ~PartyHasItem("JA#PILAR") Global("JA#PILAR_JOB","GLOBAL",1) Dead("JA#GHELD")~ THEN 4
  SAY @13
  IF ~~ THEN DO ~TakePartyItem("JA#PILAR") SetGlobal("JA#PILAR_JOB","GLOBAL",2) DestroyItem("JA#PILAR") EraseJournalEntry(@1035) EraseJournalEntry(@1037) AddexperienceParty(280)~ SOLVED_JOURNAL @1036 EXIT
END

IF ~PartyHasItem("JA#PILAR") Global("JA#PILAR_JOB","GLOBAL",1)~ THEN 5
  SAY @15
  IF ~~ THEN DO ~TakePartyItem("JA#PILAR") SetGlobal("JA#PILAR_JOB","GLOBAL",2) DestroyItem("JA#PILAR") EraseJournalEntry(@1035) GiveItem("JA#PILAX",LastTalkedToBy) AddexperienceParty(280) ReputationInc(1)~ SOLVED_JOURNAL @1036 EXIT
END

IF ~~ THEN 6
  SAY @16
  IF ~~ THEN EXIT
END

IF ~True()~ THEN 7
  SAY @17
  IF ~~ THEN EXIT
END
