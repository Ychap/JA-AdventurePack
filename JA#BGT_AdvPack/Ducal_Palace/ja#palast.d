BEGIN ~JA#NOPA6~

IF ~StateCheck(Myself,STATE_CHARMED)~ THEN JA#ODELI_0
  SAY @0
  IF ~~ THEN EXIT
END

IF ~NumTimesTalkedTo(0)~ THEN JA#ODELI_1
  SAY @1
  IF ~~ THEN REPLY @2 GOTO JA#ODELI_2
  IF ~~ THEN REPLY @3 GOTO JA#ODELI_3
  IF ~~ THEN REPLY @4 GOTO JA#ODELI_4
  IF ~~ THEN REPLY @5 EXIT
END

IF ~~ THEN JA#ODELI_2
  SAY @6 = @7
  IF ~~ THEN EXIT
END

IF ~~ THEN JA#ODELI_3
  SAY @8
  IF ~~ THEN EXIT
END

IF ~~ THEN JA#ODELI_4
  SAY @9
  IF ~~ THEN EXIT
END

IF ~RandomNum(3,1)~ THEN JA#ODELI_5
  SAY @10
  IF ~~ THEN EXIT
END

IF ~RandomNum(3,2)~ THEN JA#ODELI_6
  SAY @11
  IF ~~ THEN EXIT
END

IF ~RandomNum(3,3)~ THEN JA#ODELI_7
  SAY @12
  IF ~~ THEN EXIT
END

// END JA#NOPA6


BEGIN ~JA#KAEM1~

IF ~NumTimesTalkedTo(0)~ THEN JA#KAEM1_0
  SAY @13
  IF ~~ THEN REPLY @14 GOTO JA#KAEM1_1
  IF ~~ THEN REPLY @15 GOTO JA#KAEM1_5
  IF ~~ THEN REPLY @16 GOTO JA#KAEM1_4
END

IF ~~ THEN JA#KAEM1_1
  SAY @17
  IF ~~ THEN REPLY @18 GOTO JA#KAEM1_2
  IF ~~ THEN REPLY @16 GOTO JA#KAEM1_4
END

IF ~~ THEN JA#KAEM1_2
  SAY @19
  IF ~~ THEN REPLY @20 GOTO JA#KAEM1_3
  IF ~~ THEN REPLY @21 GOTO JA#KAEM1_4
END

IF ~~ THEN JA#KAEM1_3
  SAY @22
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~~ THEN JA#KAEM1_4
  SAY @23
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~~ THEN JA#KAEM1_5
  SAY @24
  IF ~~ THEN REPLY @14 GOTO JA#KAEM1_1
  IF ~~ THEN REPLY @16 GOTO JA#KAEM1_4
END

// END JA#KAEM1


// ~JA#FLAM2~ moved to Lawsystem


BEGIN ~JA#FLAM3~

IF ~RandomNum(3,1)~ THEN JA#FLAM3_1
  SAY @27
  IF ~~ THEN EXIT
END

IF ~RandomNum(3,2)~ THEN JA#FLAM3_2
  SAY @28
  IF ~~ THEN EXIT
END

IF ~RandomNum(3,3)~ THEN JA#FLAM3_3
  SAY @29
  IF ~~ THEN EXIT
END

// END JA#FLAM3


BEGIN ~JA#FLAM4~

IF ~RandomNum(3,1)~ THEN JA#FLAM4_1
  SAY @30
  IF ~~ THEN EXIT
END

IF ~RandomNum(3,2)~ THEN JA#FLAM4_2
  SAY @31
  IF ~~ THEN EXIT
END

IF ~RandomNum(3,3)~ THEN JA#FLAM4_3
  SAY @32
  IF ~~ THEN EXIT
END

// END JA#FLAM4


BEGIN ~JA#NOB00~

IF ~RandomNum(3,1)~ THEN JA#NOB00_0
  SAY @33
  IF ~~ THEN EXIT
END

IF ~RandomNum(3,2)~ THEN JA#NOB00_1
  SAY @34
  IF ~~ THEN EXIT
END

IF ~RandomNum(3,3)~ THEN JA#NOB00_2
  SAY @35
  COPY_TRANS NOBLBA 2
END

// END JA#NOB00


BEGIN ~JA#NOB13~

IF ~RandomNum(3,1)~ THEN JA#NOB13_0
  SAY @36
  IF ~~ THEN EXIT
END

IF ~~ THEN JA#NOB13_1
  SAY @37
  IF ~~ THEN EXIT
END

IF ~RandomNum(3,2)~ THEN JA#NOB13_2
  SAY @38
  IF ~~ THEN EXIT
END

IF ~RandomNum(3,3)~ THEN JA#NOB13_3
  SAY @39
  COPY_TRANS NOBL12 2
END

// END JA#NOB13


BEGIN ~JA#NOBW6~

IF ~StateCheck(Myself,STATE_CHARMED)~ THEN JA#NOBW6_0
  SAY @39
  COPY_TRANS NOBL12 2
END

IF ~RandomNum(3,1)~ THEN JA#NOBW6_1
  SAY @40
  IF ~~ THEN EXIT
END

IF ~RandomNum(3,2)~ THEN JA#NOBW6_2
  SAY @41
  IF ~~ THEN EXIT
END

IF ~RandomNum(3,3)~ THEN JA#NOBW6_3
  SAY @42
  IF ~~ THEN EXIT
END

// END JA#NOBW6
