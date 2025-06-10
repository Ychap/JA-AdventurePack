BEGIN ~JA#GALTO~

IF ~NumTimesTalkedTo(0)~ THEN 0
  SAY @0
  IF ~~ THEN REPLY @1 DO ~StartStore("ja#galto",LastTalkedToBy(Myself))~ EXIT
  IF ~~ THEN REPLY @2 EXIT
END

IF ~True()~ THEN 1
  SAY @3
  IF ~~ THEN REPLY @4 DO ~StartStore("ja#galto",LastTalkedToBy(Myself))~ EXIT
  IF ~~ THEN REPLY @2 EXIT
END

// END JA#GALTO
