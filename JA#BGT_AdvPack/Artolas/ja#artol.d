BEGIN ~JA#ARTOL~

IF ~NumTimesTalkedTo(0)~ THEN 0
  SAY @0
  IF ~~ THEN EXIT
END

IF ~Global("JA#TLK_ARTOLAS","LOCALS",1)~ THEN 1
  SAY @1 = @2 = @3
  IF ~~ THEN REPLY @4 DO ~EscapeArea()~ EXIT
  IF ~~ THEN REPLY @5 GOTO 2
END

IF ~~ THEN 2
  SAY @6
  IF ~~ THEN DO ~Enemy()~ EXIT
END

// END JA#ARTOL
