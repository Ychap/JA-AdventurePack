REPLACE_ACTION_TEXT DRYAD
~EscapeArea\(Destroy\)?([0-9]*)~
~ForceSpell(Myself,DRYAD_TELEPORT) Wait(1) DestroySelf()~


APPEND DRYAD

IF WEIGHT #3 ~Global("JA#CALDOQU1","%DryadFalls%",1)~ THEN BEGIN JA#DRYAD_1
  SAY @0
  IF ~~ THEN GOTO 6
END

END // APPEND DRYAD
