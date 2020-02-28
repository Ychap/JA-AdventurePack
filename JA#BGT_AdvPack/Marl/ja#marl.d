//Marl misc.d

ALTER_TRANS MARL // file name
BEGIN 16 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#MARLDLG","LOCALS",1)ChangeEnemyAlly(Myself,NEUTRAL)MoveToPoint([701.773])~
END

ADD_STATE_TRIGGER MARL 18 ~Global("JA#MARLDLG","LOCALS",0)~

ALTER_TRANS MARL // file name
BEGIN 18 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#MARLDLG","LOCALS",1)~
END

APPEND MARL

IF ~Global("JA#MARLDLG","LOCALS",1)~ THEN BEGIN JA#MARL_1
SAY @9
IF ~~ THEN EXIT
END

END