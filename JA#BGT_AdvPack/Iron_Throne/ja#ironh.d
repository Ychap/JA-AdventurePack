BEGIN ~JA#IRONH~

IF ~StateCheck(Myself,STATE_CHARMED) Global("JA#THRONE_DOOR","%BaldursGateDocks%",0)~ THEN 0
  SAY @0
  IF ~~ THEN DO ~SetGlobal("JA#THRONE_DOOR","%BaldursGateDocks%",1)~ EXIT
END

IF ~StateCheck(Myself,STATE_CHARMED)~ THEN 1
  SAY @0
  IF ~~ THEN EXIT
END

IF ~GlobalGT("SearchIronThrone","GLOBAL",0)~ THEN 2
  SAY @1
  IF ~~ THEN DO ~Enemy()~ EXIT
END

IF ~Global("JA#THRONE_DOOR","%BaldursGateDocks%",0)~ THEN 3
  SAY @2
  IF ~~ THEN EXIT
END

IF ~Global("JA#THRONE_DOOR","%BaldursGateDocks%",1)~ THEN 4
  SAY @3
  IF ~~ THEN EXIT
END

// END JA#IRONH
