BEGIN ~JA#NOB15~

IF ~RandomNum(4,1)~ THEN 0
  SAY @0
  IF ~~ THEN EXIT
END

IF ~RandomNum(4,2)~ THEN 1
  SAY @1
  IF ~~ THEN EXIT
END

IF ~RandomNum(4,3)~ THEN 2
  SAY @2
  IF ~~ THEN EXIT
END

IF ~RandomNum(4,4)~ THEN 3
  SAY @3
  IF ~~ THEN EXIT
END

// END JA#NOB15
