BEGIN ~JA#FTOB3~

IF ~NumTimesTalkedTo(0)~ THEN 0
  SAY @0
  IF ~~ THEN EXIT
END

IF ~NumTimesTalkedTo(1)~ THEN 1
  SAY @1
  IF ~~ THEN EXIT
END

IF ~NumTimesTalkedTo(2)~ THEN 2
  SAY @2
  IF ~~ THEN EXIT
END

IF ~True()~ THEN 3
  SAY @3
  IF ~~ THEN EXIT
END

IF ~~ THEN 4
  SAY @4
  IF ~~ THEN EXIT
END

IF ~~ THEN 5
  SAY @5
  IF ~~ THEN EXIT
END

// END JA#FTOB3
