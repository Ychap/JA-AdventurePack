REPLACE_STATE_TRIGGER DENKOD 0 ~NumTimesTalkedTo(0)~


APPEND DENKOD

IF ~Global("ENDOFBG1","GLOBAL",0)~ THEN JA#DENKOD_1
  SAY @3
  IF ~~ THEN EXIT
END

IF ~GlobalGT("ENDOFBG1","GLOBAL",0)~ THEN JA#DENKOD_2
  SAY @4
  IF ~~ THEN EXIT
END

END // APPEND DENKOD
