BEGIN ~JA#IRONH~

IF ~Dead("ZHALIMAR") Dead("ALAI") Dead("AASIM") Dead("DIYAB") Dead("GARDUSH") Dead("NAAMAN")~ THEN 0
  SAY @0
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~StateCheck(Myself,STATE_CHARMED)~ THEN 1
  SAY @0
  IF ~~ THEN DO ~Unlock("DOOR0611") OpenDoor("DOOR0611") EscapeArea()~ EXIT
END

IF ~Global("SearchIronThrone","GLOBAL",1)~ THEN 2
  SAY @1
  IF ~~ THEN DO ~Enemy()~ EXIT
END

IF ~True()~ THEN 3
  SAY @2
  IF ~~ THEN EXIT
END

// END JA#IRONH
