BEGIN ~JA#STH01~

IF ~RandomNum(3,1)~ THEN JA#STH01_1
  SAY @0
  IF ~~ THEN EXIT
END

IF ~RandomNum(3,2)~ THEN JA#STH01_2
  SAY @1
  IF ~~ THEN EXIT
END

IF ~RandomNum(3,3)~ THEN JA#STH01_3
  SAY @2
  IF ~~ THEN EXIT
END

// END JA#STH01
