BEGIN ~JA#AMNI2~

IF WEIGHT #0 ~NumTimesTalkedTo(0)~ THEN 0
  SAY @0
  IF ~~ THEN REPLY @1 EXIT
  IF ~~ THEN REPLY @2 GOTO 1
  IF ~~ THEN REPLY @3 GOTO 2
END

IF ~~ THEN 1
  SAY @4
  IF ~~ THEN EXIT
END

IF ~~ THEN 2
  SAY @5
  IF ~~ THEN EXIT
END

IF WEIGHT #2 ~ReactionGT(LastTalkedToBy(Myself),9)~ THEN 3
  SAY @6
  IF ~~ THEN EXIT
END

IF WEIGHT #1 ~StateCheck(Myself,STATE_CHARMED)~ THEN 4
  SAY @7
  IF ~~ THEN EXIT
END

IF ~ReactionLT(LastTalkedToBy(Myself),10)~ THEN 5
  SAY @8
  IF ~~ THEN EXIT
END

// END JA#AMNI2
