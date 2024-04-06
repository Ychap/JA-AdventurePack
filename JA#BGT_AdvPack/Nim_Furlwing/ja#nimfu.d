BEGIN ~JA#NIMFU~

IF ~NumDeadLT("JA#HOUND",3) NumDeadGT("JA#HOUND",1) Global("JA#CUNIM","%Peldvale%",1)~ THEN 0
  SAY @0
  IF ~~ THEN DO ~SetGlobal("JA#CUNIM","%Peldvale%",2) AddExperienceParty(120)~ JOURNAL @1 EXIT
END

IF ~NumDead("JA#HOUND",3) Global("JA#CUNIM","%Peldvale%",1)~ THEN 1
  SAY @2
  IF ~~ THEN DO ~SetGlobal("JA#CUNIM","%Peldvale%",2)~ JOURNAL @1 EXIT
END

IF ~NumDeadLT("JA#HOUND",2) Global("JA#CUNIM","%Peldvale%",1)~ THEN 2
  SAY @3
  IF ~~ THEN DO ~SetGlobal("JA#CUNIM","%Peldvale%",2) AddExperienceParty(280) GiveItem("JA#PR402",LastTalkedToBy)~ JOURNAL @4 EXIT
END

IF ~NumTimesTalkedToGT(0)~ THEN 3
  SAY @5
  IF ~~ THEN EXIT
END

IF ~StateCheck(Myself,STATE_CHARMED)~ THEN 4
  SAY @6
  IF ~~ THEN EXIT
END

// END JA#NIMFU
