ADD_STATE_TRIGGER NILA 0 ~Global("JA#NILA","%NBaldursGate_DucalPalace_L2%",0) Global("JA#CONTAINER2","%NBaldursGate_DucalPalace_L2%",0)~
ADD_STATE_TRIGGER NILA 1 ~Global("JA#NILA","%NBaldursGate_DucalPalace_L2%",0) Global("JA#CONTAINER2","%NBaldursGate_DucalPalace_L2%",0)~

REPLACE_STATE_TRIGGER NILA 7 ~Global("JA#NILA","%NBaldursGate_DucalPalace_L2%",3) Global("JA#CONTAINER2","%NBaldursGate_DucalPalace_L2%",2)~
REPLACE_STATE_TRIGGER NILA 8 ~True()~
REPLACE_STATE_TRIGGER NILA 2 ~Global("JA#CONTAINER2","%NBaldursGate_DucalPalace_L2%",1)~

SET_WEIGHT NILA 2 #-1


ADD_TRANS_ACTION NILA
BEGIN 3 END
BEGIN END
~SetGlobal("JA#CONTAINER2","%NBaldursGate_DucalPalace_L2%",2) MoveToPoint([522.640])~


ADD_TRANS_TRIGGER NILA 0 ~False()~
ADD_TRANS_TRIGGER NILA 1 ~False()~

EXTEND_BOTTOM NILA 0 1
  IF ~~ THEN REPLY @8 DO ~SetGlobal("JA#NILA_WHO","LOCALS",1)~ GOTO JA#NILA_3
  IF ~~ THEN REPLY @0 DO ~SetGlobal("JA#SARE","LOCALS",1)~ GOTO JA#NILA_4
  IF ~~ THEN REPLY @1 GOTO JA#NILA_5
END


APPEND NILA

IF WEIGHT #-1 ~Global("JA#NILA","%NBaldursGate_DucalPalace_L2%",1)~ THEN JA#NILA_1
  SAY @2
  IF ~~ THEN DO ~SetGlobal("JA#NILA","%NBaldursGate_DucalPalace_L2%",2)
                 DialogInterrupt(FALSE)
                 MoveToPoint([587.578])
                 Face(6)
                 Wait(2)
                 PlaySound("AMB_D21")
                 Unlock("Container 1")
                 Wait(1)
                 DialogInterrupt(TRUE)
                 Dialogue([PC])~ EXIT
END

IF WEIGHT #-1 ~Global("JA#NILA","%NBaldursGate_DucalPalace_L2%",2)~ THEN JA#NILA_2
  SAY @3
  IF ~~ THEN DO ~SetGlobal("JA#NILA","%NBaldursGate_DucalPalace_L2%",3) MoveToPoint([522.640])~ EXIT
END


IF ~~ THEN JA#NILA_3
  SAY @4
  IF ~Global("JA#SARE","LOCALS",0)~ THEN REPLY @0 DO ~SetGlobal("JA#SARE","LOCALS",1)~ GOTO JA#NILA_4
  IF ~~ THEN REPLY @1 GOTO JA#NILA_5
END

IF ~~ THEN JA#NILA_4
  SAY @5
  IF ~Global("JA#NILA_WHO","LOCALS",0)~ THEN REPLY @6 DO ~SetGlobal("JA#NILA_WHO","LOCALS",1)~ GOTO JA#NILA_3
  IF ~~ THEN REPLY @1 GOTO JA#NILA_5
END

IF ~~ THEN JA#NILA_5
  SAY @7
  COPY_TRANS NILA 0
END

END // APPEND NILA
