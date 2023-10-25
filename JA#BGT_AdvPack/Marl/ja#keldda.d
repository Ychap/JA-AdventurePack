ALTER_TRANS KELDDA
BEGIN 4 END
BEGIN 0 END
BEGIN
  "ACTION" ~SetGlobal("JA#MARL_GUARD","GLOBAL",3)
ActionOverride("JA#GUAB1",EscapeArea())
ActionOverride("JA#GUAB2",EscapeArea())
ActionOverride("JA#GUAB3",EscapeArea())
TakePartyGold(300)~
END

ALTER_TRANS KELDDA
BEGIN 5 END
BEGIN 0 END
BEGIN
  "ACTION" ~SetGlobal("JA#MARL_GUARD","GLOBAL",3)
ActionOverride("JA#GUAB1",EscapeArea())
ActionOverride("JA#GUAB2",EscapeArea())
ActionOverride("JA#GUAB3",EscapeArea())
TakePartyGold(200)~
END


ADD_STATE_TRIGGER KELDDA 1
~GlobalLT("JA#MARL_GUARD","GLOBAL",1)~

SET_WEIGHT KELDDA 3 #%idx_state1_trigger%

REPLACE_STATE_TRIGGER KELDDA 3
~%state1_trigger%~

ALTER_TRANS KELDDA
BEGIN 3 END
BEGIN END
BEGIN
  "ACTION" ~SetGlobal("B!GavinBassilusQuest","GLOBAL",5) %state1_response0_action%~
  "SOLVED_JOURNAL" ~@0~
END
