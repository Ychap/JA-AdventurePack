BEGIN ~JA#FLAM2~

IF ~StateCheck(Myself,STATE_CHARMED)~ THEN JA#FLAM2_0
  SAY @25
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~NumTimesTalkedTo(0)~ THEN JA#FLAM2_1
  SAY @26
  IF ~~ THEN DO ~SetGlobal("JA#ALERT","MYAREA",1) Shout(99) Enemy()~ EXIT
END

// END JA#FLAM2
