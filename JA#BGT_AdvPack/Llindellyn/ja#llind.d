BEGIN ~JA#LLIND~

IF ~NumTimesTalkedTo(0)~ THEN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN 1
  SAY @3
  IF ~~ THEN REPLY @4 GOTO 2
END

IF ~~ THEN 2
  SAY @5
  IF ~~ THEN DO ~SetGlobal("JA#LLIND_JOB","LOCALS",1)~ UNSOLVED_JOURNAL @6 EXIT
END

IF ~Global("JA#LLIND_JOB","LOCALS",1)!PartyHasItem("JA#LLIND")~ THEN 3
  SAY @7
  IF ~~ THEN EXIT
END

IF ~ReactionLT(LastTalkedToBy,NEUTRAL_LOWER)PartyHasItem("JA#LLIND")~ THEN 4
  SAY @8
  IF ~~ THEN DO ~TakePartyItem("JA#LLIND")GiveItem("AROW11",LastTalkedToBy(Myself))SetGlobal("JA#LLIND_JOB","LOCALS",2)AddexperienceParty(150)EraseJournalEntry(@6)~ SOLVED_JOURNAL @9 EXIT
END

IF ~ReactionGT(LastTalkedToBy,HOSTILE_UPPER)ReactionLT(LastTalkedToBy,FRIENDLY_LOWER)PartyHasItem("JA#LLIND")~ THEN 5
  SAY @10
  IF ~~ THEN DO ~TakePartyItem("JA#LLIND")GiveItem("AROW10",LastTalkedToBy(Myself))SetGlobal("JA#LLIND_JOB","LOCALS",2)AddexperienceParty(150)EraseJournalEntry(@6)~ SOLVED_JOURNAL @9 EXIT
END

IF ~PartyHasItem("JA#LLIND")ReactionGT(LastTalkedToBy,NEUTRAL_UPPER)~ THEN 6
  SAY @11
  IF ~~ THEN DO ~TakePartyItem("JA#LLIND")GiveItem("AROW06",LastTalkedToBy(Myself))SetGlobal("JA#LLIND_JOB","LOCALS",2)AddexperienceParty(150)EraseJournalEntry(@6)~ SOLVED_JOURNAL @9 EXIT
END

IF ~~ THEN 7
  SAY @12
  IF ~~ THEN EXIT
END

IF ~Global("JA#LLIND_JOB","LOCALS",2)~ THEN 8
  SAY @13
  IF ~~ THEN EXIT
END
