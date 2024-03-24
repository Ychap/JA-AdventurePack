APPEND CALDO

IF WEIGHT #-1 ~StateCheck(Myself,STATE_CHARMED) !Dead("CDryad")~ THEN JA#CALDO_1
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 6
  IF ~~ THEN REPLY @2 GOTO JA#CALDO_2
  IF ~~ THEN REPLY @3 GOTO 2
END

IF WEIGHT #-1 ~StateCheck(Myself,STATE_CHARMED) Dead("CDryad")~ THEN JA#CALDO_3
  SAY @5
  IF ~~ THEN DO ~ActionOverride("Krumm",EscapeArea()) EscapeArea()~ EXIT
END

END // APPEND CALDO


CHAIN CALDO JA#CALDO_2
  @4
  == KRUMM @7 DO ~SetGlobal("JA#CALDOQU1","%DryadFalls%",1) ActionOverride("Caldo",EscapeArea()) EscapeArea()~
EXIT


APPEND KRUMM

IF WEIGHT #-1 ~NumTimesTalkedTo(0)~ THEN JA#KRUMM_1
  SAY @6
  IF ~~ THEN EXTERN CALDO 0
END

END // APPEND KRUMM
