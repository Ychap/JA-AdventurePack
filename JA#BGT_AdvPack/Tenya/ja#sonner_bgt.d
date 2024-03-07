REPLACE_TRANS_ACTION SONNER
BEGIN 8 END
BEGIN END
~ActionOverride("Telman",EscapeAreaDestroy(90))[%WNL%%MNL%%LNL%%TAB% ]*ActionOverride("Jebadoh",EscapeAreaDestroy(90))[%WNL%%MNL%%LNL%%TAB% ]*EscapeAreaDestroy(90)~
~NoAction()~

REPLACE_TRANS_ACTION SONNER
BEGIN 10 END
BEGIN END
~ActionOverride("Telman",EscapeAreaDestroy(90))[%WNL%%MNL%%LNL%%TAB% ]*ActionOverride("Jebadoh",EscapeAreaDestroy(90))[%WNL%%MNL%%LNL%%TAB% ]*EscapeAreaDestroy(90)~
~SetGlobal("HostileFishermen","GLOBAL",1)~

REPLACE_TRANS_ACTION SONNER
BEGIN 17 END
BEGIN END
~SetGlobal("HostileFishermen","GLOBAL",1)~
~ActionOverride("Telman",EscapeAreaDestroy(90)) ActionOverride("Jebadoh",EscapeAreaDestroy(90)) EscapeAreaDestroy(90)~
