BEGIN ~JA#LLIND~

IF ~NumTimesTalkedTo(0)~ THEN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN 1
  SAY @3
  IF ~~ THEN GOTO 2
END

IF ~~ THEN 2
  SAY @5
  IF ~~ THEN DO ~SetGlobal("JA#LLIND_JOB","LOCALS",1)~ UNSOLVED_JOURNAL @6 EXIT
END

IF ~Global("JA#LLIND_JOB","LOCALS",1) !PartyHasItem("JA#LLIND")~ THEN 3
  SAY @7
  IF ~~ THEN GOTO 9
END

IF ~PartyHasItem("JA#LLIND") ReactionLT(LastTalkedToBy,NEUTRAL_LOWER)~ THEN 4
  SAY @8
  IF ~~ THEN DO ~TakePartyItem("JA#LLIND") GiveItem("AROW11",LastTalkedToBy) SetGlobal("JA#LLIND_JOB","LOCALS",2) AddexperienceParty(150) EraseJournalEntry(@6)~ SOLVED_JOURNAL @9 EXIT
END

IF ~PartyHasItem("JA#LLIND") ReactionGT(LastTalkedToBy,HOSTILE_UPPER) ReactionLT(LastTalkedToBy,FRIENDLY_LOWER)~ THEN 5
  SAY @10
  IF ~~ THEN DO ~TakePartyItem("JA#LLIND") GiveItem("AROW10",LastTalkedToBy) SetGlobal("JA#LLIND_JOB","LOCALS",2) AddexperienceParty(150) EraseJournalEntry(@6)~ SOLVED_JOURNAL @9 EXIT
END

IF ~PartyHasItem("JA#LLIND") ReactionGT(LastTalkedToBy,NEUTRAL_UPPER)~ THEN 6
  SAY @11
  IF ~~ THEN DO ~TakePartyItem("JA#LLIND") GiveItem("AROW06",LastTalkedToBy) SetGlobal("JA#LLIND_JOB","LOCALS",2) AddexperienceParty(150) EraseJournalEntry(@6)~ SOLVED_JOURNAL @9 EXIT
END

IF ~~ THEN 7
  SAY @12
  IF ~~ THEN EXIT
END

IF ~Global("JA#LLIND_JOB","LOCALS",2)~ THEN 8
  SAY @13
  IF ~~ THEN EXIT
END

IF ~~ THEN 9
  SAY @4
  IF ~~ THEN EXIT
END

// END JA#LLIND
