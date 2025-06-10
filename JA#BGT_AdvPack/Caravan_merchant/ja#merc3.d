BEGIN ~JA#MERC3~

IF ~Global("JA#_HelpedMechant","MYAREA",0)~ THEN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 2
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN 1
  SAY @3
  IF ~~ THEN DO ~SetGlobal("JA#_HelpedMechant","MYAREA",1) SetGlobalTimer("JA#MERC3","GLOBAL",TWO_DAYS)~ UNSOLVED_JOURNAL @1008 EXIT
END

IF ~~ THEN 2
  SAY @4
  IF ~PartyHasItem("POTN08")~ THEN REPLY @5 DO ~TakePartyItemNum("POTN08",1)~ EXIT
  IF ~PartyHasItem("POTN17")~ THEN REPLY @6 DO ~TakePartyItemNum("POTN17",1)~ EXIT
  IF ~PartyHasItem("GBERRY")~ THEN REPLY @7 DO ~TakePartyItemNum("GBERRY",1)~ EXIT
  IF ~~ THEN REPLY @8 DO ~SetGlobal("JA#_HelpedMechant","MYAREA",1) SetGlobalTimer("JA#MERC3","GLOBAL",TWO_DAYS)~ UNSOLVED_JOURNAL @1008 EXIT
  IF ~~ THEN REPLY @9 GOTO 1
END


IF ~Global("JA#_HelpedMechant","MYAREA",2)~ THEN 3
  SAY @11
  IF ~~ THEN REPLY @12 DO ~EraseJournalEntry(@1008)~ SOLVED_JOURNAL @13 GOTO 4
  IF ~~ THEN REPLY @14 DO ~EraseJournalEntry(@1008)~ SOLVED_JOURNAL @15 GOTO 6
  IF ~~ THEN REPLY @16 DO ~EraseJournalEntry(@1008)~ SOLVED_JOURNAL @15 GOTO 5
  IF ~~ THEN REPLY @17 DO ~EraseJournalEntry(@1008)~ SOLVED_JOURNAL @18 GOTO 5
END

IF ~~ THEN 4
  SAY @19
  IF ~~ THEN DO ~SetGlobal("JA#_HelpedMechant","MYAREA",3) ReputationInc(-1) AddExperienceParty(150) EscapeArea()~ EXIT
END

IF ~~ THEN 5
  SAY @20
  IF ~~ THEN DO ~SetGlobal("JA#_HelpedMechant","MYAREA",3) AddExperienceParty(150) EscapeArea()~ EXIT
END

IF ~~ THEN 6
  SAY @21
  IF ~~ THEN DO ~SetGlobal("JA#_HelpedMechant","MYAREA",3) ReputationInc(1) AddExperienceParty(150) EscapeArea()~ JOURNAL @22 EXIT
END

IF ~~ THEN 7
  SAY @23
  IF ~~ THEN DO ~SetGlobal("JA#_HelpedMechant","MYAREA",3) ReputationInc(1) AddExperienceParty(150) EscapeArea()~ JOURNAL @24 EXIT
END

IF ~~ THEN 8
  SAY @25
  IF ~~ THEN EXIT
END


IF ~Global("JA#_HelpedMechant","MYAREA",1)~ THEN 9
  SAY @26
  IF ~PartyHasItem("POTN08")~ THEN REPLY @5 DO ~TakePartyItemNum("POTN08",1)~ EXIT
  IF ~PartyHasItem("POTN17")~ THEN REPLY @6 DO ~TakePartyItemNum("POTN17",1)~ EXIT
  IF ~PartyHasItem("GBERRY")~ THEN REPLY @7 DO ~TakePartyItemNum("GBERRY",1)~ EXIT
  IF ~~ THEN REPLY @27 EXIT
  IF ~~ THEN REPLY @9 DO ~SetGlobalTimer("JA#MERC3","GLOBAL",TWO_MINUTES)~ EXIT
END

// END JA#MERC3
