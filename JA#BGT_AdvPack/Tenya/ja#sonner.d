// BGT (make in SONNER.DLG state 9 available)
REPLACE_TRANS_ACTION SONNER
BEGIN 8 END
BEGIN END
~ActionOverride("Telman",EscapeAreaDestroy(90))[%WNL%%MNL%%LNL%%TAB% ]*ActionOverride("Jebadoh",EscapeAreaDestroy(90))[%WNL%%MNL%%LNL%%TAB% ]*EscapeAreaDestroy(90)~
~NoAction()~

// BGEE/EET (make in SONNER.DLG state 9 available)
REPLACE_TRANS_ACTION SONNER
BEGIN 8 END
BEGIN END
~SetGlobal("HelpJebadoh","GLOBAL",3)~
~SetGlobal("HelpJebadoh","GLOBAL",2)~


// Fishermen escape area instead of turning hostile
REPLACE_TRANS_ACTION SONNER
BEGIN 10 13 17 END
BEGIN END
~SetGlobal("HostileFishermen","GLOBAL",1)~
~NoAction()~

// Change state 10 only in BGEE/EET
ADD_TRANS_ACTION SONNER
BEGIN 10 13 17 END
BEGIN END
~%fishermenEscapeArea%~
UNLESS ~EscapeArea~


EXTEND_BOTTOM SONNER 14
  IF ~~ THEN REPLY @0 EXTERN SONNER JA#SONNER_1
END

CHAIN SONNER JA#SONNER_1
  @1 = @2
  == JEBADO @3
  == SONNER @4
  == TELMAN @5 DO ~SetGlobal("HostileFishermen","GLOBAL",1)~
EXIT
