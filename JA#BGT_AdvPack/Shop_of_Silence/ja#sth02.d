BEGIN ~JA#STH02~

IF ~ReputationLT(LastTalkedToBy,16)~ THEN JA#STH02_1
  SAY @0 = @1
  IF ~~ THEN REPLY @2 GOTO JA#STH02_2
  IF ~Global("JA#KNOW_MASKTEMPLE","GLOBAL",1)~ THEN REPLY @3 GOTO JA#STH02_6
END

IF ~~ THEN JA#STH02_2
  SAY @4
  IF ~~ THEN DO ~SetGlobal("JA#KNOW_MASKTEMPLE","GLOBAL",1) EscapeArea()~ EXIT
END

IF ~ReputationGT(LastTalkedToBy,15) RandomNum(3,1)~ THEN JA#STH02_3
  SAY @6
  IF ~~ THEN EXIT
END

IF ~ReputationGT(LastTalkedToBy,15) RandomNum(3,2)~ THEN JA#STH02_4
  SAY @7
  IF ~~ THEN EXIT
END

IF ~ReputationGT(LastTalkedToBy,15) RandomNum(3,3)~ THEN JA#STH02_5
  SAY @8
  IF ~~ THEN EXIT
END

IF ~~ THEN JA#STH02_6
  SAY @9
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END

// END JA#STH02
