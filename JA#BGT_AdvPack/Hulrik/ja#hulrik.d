ADD_STATE_TRIGGER HULRIK 2
~Global("XvartsDead","GLOBAL",8)~

ADD_TRANS_ACTION HULRIK
BEGIN 2 END
BEGIN END
~IncrementGlobal("XvartsDead","GLOBAL",1)~


APPEND HULRIK

/* dialogue after event with Xvarts is done */
IF WEIGHT #%hulrik_state03_weight% ~OR(2) Dead("Mulahey") Dead("Nexlit") Global("JA#HULRIK","LOCALS",0)~ THEN JA#HULRIK_1
  SAY @0
  IF ~Dead("Mulahey") !Dead("Nexlit") Global("JA#HULRIK_MINES","LOCALS",0)~ THEN REPLY @1 DO ~SetGlobal("JA#HULRIK_MINES","LOCALS",1)~ GOTO JA#HULRIK_2
  IF ~!Dead("Mulahey") Dead("Nexlit")~ THEN REPLY @2 GOTO JA#HULRIK_5
  IF ~Dead("Mulahey") Dead("Nexlit") Global("JA#HULRIK_MINES","LOCALS",0)~ THEN REPLY @3 GOTO JA#HULRIK_6
  IF ~Dead("Mulahey") Dead("Nexlit") Global("JA#HULRIK_MINES","LOCALS",1)~ THEN REPLY @2 GOTO JA#HULRIK_5
  IF ~~ THEN REPLY @4 EXIT
END

IF ~~ THEN JA#HULRIK_2
  SAY @5
  IF ~~ THEN REPLY @6 GOTO JA#HULRIK_3
  IF ~~ THEN REPLY @7 GOTO JA#HULRIK_4
END

IF ~~ THEN JA#HULRIK_3
  SAY @8
  IF ~~ THEN EXIT
END

IF ~~ THEN JA#HULRIK_4
  SAY @9
  IF ~~ THEN EXIT
END

IF ~~ THEN JA#HULRIK_5
  SAY @10
  IF ~~ THEN DO ~SetGlobal("JA#HULRIK","LOCALS",1) ReputationInc(1)~ EXIT
END

IF ~~ THEN JA#HULRIK_6
  SAY @11
  IF ~~ THEN DO ~SetGlobal("JA#HULRIK","LOCALS",1) ReputationInc(1)~ EXIT
END


/* generic dialogues after event with Xvarts is done */
IF WEIGHT #%hulrik_state03_weight% ~Global("JA#HULRIK","LOCALS",1) RandomNum(4,1)~ THEN JA#HULRIK_7
  SAY @12
  IF ~~ THEN EXIT
END

IF WEIGHT #%hulrik_state03_weight% ~Global("JA#HULRIK","LOCALS",1) RandomNum(4,2)~ THEN JA#HULRIK_8
  SAY @13
  IF ~~ THEN EXIT
END

IF WEIGHT #%hulrik_state03_weight% ~Global("JA#HULRIK","LOCALS",1) RandomNum(4,3)~ THEN JA#HULRIK_9
  SAY @14
  IF ~~ THEN EXIT
END

END // APPEND HULRIK
