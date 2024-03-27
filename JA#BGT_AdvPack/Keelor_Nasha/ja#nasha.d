BEGIN ~JA#NASHA~

IF ~Global("JA#NASHA","GLOBAL",0)~ THEN 0
  SAY @0
  IF ~~ THEN EXIT
END

IF ~Global("JA#NASHA","GLOBAL",1)~ THEN 1
  SAY @1
  IF ~~ THEN DO ~SetGlobal("JA#NASHA","GLOBAL",2)~ EXIT
END

IF ~Global("JA#NASHA","GLOBAL",2) HPPercentLT(LastTalkedToBy,100)~ THEN 2
  SAY @2
  IF ~~ THEN DO ~ForceSpell(LastTalkedToBy,CLERIC_HEAL)~ EXIT
END

IF ~HPPercent(LastTalkedToBy,100)~ THEN 3
  SAY @3
  IF ~~ THEN EXIT
END

IF ~False()~ THEN 4
  SAY @4
  IF ~~ THEN DO ~~ EXIT
END

// END JA#NASHA
