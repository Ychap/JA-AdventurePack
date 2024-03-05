//de-bugged Jondalar Fix


ADD_STATE_TRIGGER JONDAL 0 ~Global("JonHit","GLOBAL",0)~
ADD_STATE_TRIGGER JONDAL 3 ~NumTimesTalkedToGT(0)~

APPEND JONDAL

IF ~NumTimesTalkedTo(0)
Global("JonHit","GLOBAL",1)~ THEN BEGIN JA#JONDAL_0
SAY @10
IF ~~ THEN DO ~SetGlobal("JonHit","GLOBAL",2)
ChangeEnemyAlly(Myself,NEUTRAL)
ChangeEnemyAlly("Erik",NEUTRAL)
ClearAllActions()
ActionOverride("Erik",EscapeAreaDestroy(90))
EscapeAreaDestroy(90)~ EXIT
END

END
