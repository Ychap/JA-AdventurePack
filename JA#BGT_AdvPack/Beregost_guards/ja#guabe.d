BEGIN ~JA#GUAB4~

IF ~GlobalLT("Chapter","GLOBAL",%tutu_chapter_4%) NumTimesTalkedTo(0)~ THEN 1
  SAY @5
  IF ~~ THEN EXIT
END

IF ~ReactionLT(LastTalkedToBy,NEUTRAL_LOWER)~ THEN 15
  SAY @6
  IF ~~ THEN EXIT
END

IF ~True()~ THEN 4
  SAY @7
  IF ~~ THEN EXIT
END

// END JA#GUAB4


BEGIN ~JA#GUAB5~

IF ~GlobalLT("Chapter","GLOBAL",%tutu_chapter_4%) NumTimesTalkedTo(0)~ THEN 2
  SAY @8
  IF ~~ THEN JOURNAL @9 GOTO 3
END

IF ~~ THEN 3
  SAY @10
  IF ~~ THEN EXIT
END

IF ~ReactionLT(LastTalkedToBy,NEUTRAL_LOWER)~ THEN 15
  SAY @6
  IF ~~ THEN EXIT
END

IF ~True()~ THEN 4
  SAY @7
  IF ~~ THEN EXIT
END

// END JA#GUAB5


BEGIN ~JA#GUAB6~

IF ~OR(4) !Dead("Bassilus") Global("wyvernp","GLOBAL",0) !Dead("Mulahey") GlobalLT("Chapter","GLOBAL",%tutu_chapter_4%)
    OR(4) !Dead("Bassilus") !PartyHasItem("MISC52") !Dead("Mulahey") GlobalLT("Chapter","GLOBAL",%tutu_chapter_4%)
    NumTimesTalkedTo(0)~ THEN JA#GUAB4_1
  SAY @11
  IF ~~ THEN REPLY @12 GOTO 14
  IF ~~ THEN REPLY @13 EXIT
END

IF ~~ THEN JA#GUAB4_2
  SAY @14
  IF ~~ THEN GOTO 10
END

IF ~~ THEN 0
  SAY @15
  IF ~~ THEN JOURNAL @16 EXIT
END

IF ~~ THEN 6
  SAY @17
  IF ~~ THEN EXIT
END

IF ~~ THEN 7
  SAY @18
  IF ~~ THEN GOTO 8
END

IF ~~ THEN 8
  SAY @19
  IF ~~ THEN JOURNAL @20 EXIT
END

IF ~~ THEN 10
  SAY @21
  IF ~~ THEN UNSOLVED_JOURNAL @22 EXIT
END

IF ~ReactionLT(LastTalkedToBy,NEUTRAL_LOWER)~ THEN 15
  SAY @6
  IF ~~ THEN EXIT
END

IF ~OR(4) !Dead("Bassilus") Global("wyvernp","GLOBAL",0) !Dead("Mulahey") GlobalLT("Chapter","GLOBAL",%tutu_chapter_4%)
    OR(4) !Dead("Bassilus") !PartyHasItem("MISC52") !Dead("Mulahey") GlobalLT("Chapter","GLOBAL",%tutu_chapter_4%)~ THEN 14
  SAY @23
  IF ~!Dead("Bassilus")~ THEN REPLY @24 GOTO JA#GUAB4_2
  IF ~Global("wyvernp","GLOBAL",0) !PartyHasItem("MISC52")~ THEN REPLY @25 GOTO 0
  IF ~!Dead("Mulahey")~ THEN REPLY @26 GOTO 7
  IF ~GlobalLT("Chapter","GLOBAL",%tutu_chapter_4%)~ THEN REPLY @27 GOTO 6
  IF ~~ THEN REPLY @28 EXIT
END


IF ~True()~ THEN 4
  SAY @7
  IF ~~ THEN EXIT
END

// END JA#GUAB6


BEGIN ~JA#GUAB7~

IF ~ReactionLT(LastTalkedToBy,NEUTRAL_LOWER)~ THEN 1
  SAY @6
  IF ~~ THEN EXIT
END

IF ~RandomNum(2,1)~ THEN 2
  SAY @7
  IF ~~ THEN EXIT
END

IF ~RandomNum(2,2)~ THEN 3
  SAY @29
  IF ~~ THEN EXIT
END

// END JA#GUAB7


BEGIN ~JA#GUAB8~

IF ~RandomNum(2,1)~ THEN 1
  SAY @30
  IF ~~ THEN EXIT
END

IF ~RandomNum(2,2)~ THEN 2
  SAY @31
  IF ~~ THEN EXIT
END

// END JA#GUAB8

BEGIN ~JA#GUAB9~

IF ~RandomNum(2,1)~ THEN 1
  SAY @32
  IF ~~ THEN EXIT
END

IF ~RandomNum(2,2)~ THEN 2
  SAY @33
  IF ~~ THEN EXIT
END

// END JA#GUAB9


CHAIN IF WEIGHT #-1 ~Global("JA#GUABE_ROB","%Beregost_JovialJuggler_L1%",1)~ THEN JA#GUAB8 JA#GUAB8_2
  @49 DO ~SetGlobal("JA#GUABE_ROB","%Beregost_JovialJuggler_L1%",2)~
  == JA#GUAB9 @50
  == JA#GUAB8 @51
  == JA#GUAB9 @52
  == JA#GUAB8 @53
  == JA#GUAB9 @54
  == JA#GUAB8 @55
END
  IF ~~ THEN JOURNAL @1021 EXIT

CHAIN IF WEIGHT #-1 ~Global("JA#GUABE_NAS","%Beregost_JovialJuggler_L1%",1)~ THEN JA#GUAB8 JA#GUAB8_3
  @43 DO ~SetGlobal("JA#GUABE_NAS","%Beregost_JovialJuggler_L1%",2)~
  = @44
  == JA#GUAB9 @45
  == JA#GUAB8 @46
  == JA#GUAB9 @47
  == JA#GUAB8 @48
EXIT

CHAIN IF WEIGHT #-1 ~Global("JA#GUABE_BAS","%Beregost_JovialJuggler_L1%",1)~ THEN JA#GUAB8 JA#GUAB8_1
  @34 DO ~SetGlobal("JA#GUABE_BAS","%Beregost_JovialJuggler_L1%",2)~
  == JA#GUAB9 @35
  == JA#GUAB8 @36
  == JA#GUAB9 @37
  == JA#GUAB8 @38
  == JA#GUAB9 @39
  == JA#GUAB8 @40 = @41
  == JA#GUAB9 @42
END
  IF ~~ THEN JOURNAL @1020 EXIT


ADD_TRANS_ACTION KELDDA
BEGIN 1 3 END
BEGIN END
~EraseJournalEntry(@22) EraseJournalEntry(@1020)~
