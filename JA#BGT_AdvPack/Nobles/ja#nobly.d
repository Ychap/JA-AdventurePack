BEGIN ~JA#NOBLY~

IF ~NumTimesTalkedTo(0)~ THEN 0
  SAY @0
  IF ~~ THEN EXIT
END

IF ~RandomNum(3,1)~ THEN 1
  SAY @1
  IF ~~ THEN EXIT
END

IF ~RandomNum(3,2)~ THEN 2
  SAY @2
  IF ~~ THEN EXIT
END

IF ~RandomNum(3,3)~ THEN 3
  SAY @3
  IF ~~ THEN EXIT
END

// END JA#NOBLY
