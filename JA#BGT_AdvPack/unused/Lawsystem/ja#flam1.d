BEGIN ~JA#FLAM1~

IF ~True()~ THEN JA#FLAM1_0
  SAY @34
  IF ~~ THEN REPLY @35 EXIT
  IF ~~ THEN REPLY @36 GOTO JA#FLAM1_1
  IF ~~ THEN REPLY @37 GOTO JA#FLAM1_2
END

IF ~~ THEN JA#FLAM1_1
  SAY @38
  IF ~~ THEN DO ~SetGlobal("JA#ENEMY","%NBaldursGate_DucalPalace_Cellar%",1) Enemy()~ EXIT
END

IF ~~ THEN JA#FLAM1_2
  SAY @39
  IF ~~ THEN DO ~SetGlobal("JA#ENEMY","%NBaldursGate_DucalPalace_Cellar%",1) Enemy()~ EXIT
END

// END JA#FLAM1
