BEGIN ~JA#WARE1~

IF ~NumTimesTalkedTo(0)~ THEN JA#WARE1_1
  SAY @0
  IF ~~ THEN DO ~GiveGoldForce(32) EscapeArea()~ EXIT
END

// END JA#WARE1
