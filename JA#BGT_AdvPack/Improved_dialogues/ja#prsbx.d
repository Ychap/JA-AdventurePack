BEGIN ~JA#PRS01~

IF ~RandomNum(3,1) Gender(LastTalkedToBy(Myself),MALE)~ THEN JA#PRSBX_A_1
  SAY @0
  IF ~~ THEN EXIT
END

IF ~RandomNum(3,2) Gender(LastTalkedToBy(Myself),MALE)~ THEN JA#PRSBX_A_2
  SAY @1
  IF ~~ THEN EXIT
END

IF ~RandomNum(3,3) Gender(LastTalkedToBy(Myself),MALE)~ THEN JA#PRSBX_A_3
  SAY @2
  IF ~~ THEN EXIT
END

IF ~RandomNum(3,1) Gender(LastTalkedToBy(Myself),FEMALE)~ THEN JA#PRSBX_A_4
  SAY @3
  IF ~~ THEN EXIT
END

IF ~RandomNum(3,2) Gender(LastTalkedToBy(Myself),FEMALE)~ THEN JA#PRSBX_A_5
  SAY @4
  IF ~~ THEN EXIT
END

IF ~RandomNum(3,3) Gender(LastTalkedToBy(Myself),FEMALE)~ THEN JA#PRSBX_A_6
  SAY @5
  IF ~~ THEN EXIT
END

// END JA#PRS01


BEGIN ~JA#PRS02~

IF ~RandomNum(3,1) Gender(LastTalkedToBy(Myself),MALE)~ THEN JA#PRSBX_B_1
  SAY @6
  IF ~~ THEN EXIT
END

IF ~RandomNum(3,2) Gender(LastTalkedToBy(Myself),MALE)~ THEN JA#PRSBX_B_2
  SAY @7
  IF ~~ THEN EXIT
END

IF ~RandomNum(3,3) Gender(LastTalkedToBy(Myself),MALE)~ THEN JA#PRSBX_B_3
  SAY @8
  IF ~~ THEN EXIT
END

IF ~Gender(LastTalkedToBy(Myself),FEMALE)~ THEN JA#PRSBX_B_4
  SAY @9
  IF ~~ THEN EXIT
END

// END JA#PRS02


BEGIN ~JA#PRS03~

IF ~RandomNum(3,1) Gender(LastTalkedToBy(Myself),MALE)~ THEN JA#PRSBX_C_1
  SAY @10
  IF ~~ THEN EXIT
END

IF ~RandomNum(3,2) Gender(LastTalkedToBy(Myself),MALE)~ THEN JA#PRSBX_C_2
  SAY @11
  IF ~~ THEN EXIT
END

IF ~RandomNum(3,3) Gender(LastTalkedToBy(Myself),MALE)~ THEN JA#PRSBX_C_3
  SAY @12
  IF ~~ THEN EXIT
END

IF ~RandomNum(2,1) Gender(LastTalkedToBy(Myself),FEMALE)~ THEN JA#PRSBX_C_4
  SAY @13
  IF ~~ THEN EXIT
END

IF ~RandomNum(2,2) Gender(LastTalkedToBy(Myself),FEMALE)~ THEN JA#PRSBX_C_5
  SAY @14
  IF ~~ THEN EXIT
END

// END JA#PRS03
