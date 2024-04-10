REPLACE_STATE_TRIGGER KELDDA 3 ~%state01_trigger%~

SET_WEIGHT KELDDA 3 #%state01_weight%


ADD_STATE_TRIGGER KELDDA 1
~Global("JA#MARL_GUARD","GLOBAL",0)~


ALTER_TRANS KELDDA
BEGIN 3 END
BEGIN END
BEGIN
  "ACTION" ~SetGlobal("B!GavinBassilusQuest","GLOBAL",5) %state01_response0_action%~
  "SOLVED_JOURNAL" ~@0~
END


ALTER_TRANS KELDDA
BEGIN 4 END
BEGIN 0 END
BEGIN
  "ACTION" ~SetGlobal("JA#MARL_GUARD","GLOBAL",3) TakePartyGold(300) ActionOverride("JA#GUAB1",EscapeArea()) ActionOverride("JA#GUAB2",EscapeArea()) ActionOverride("JA#GUAB3",EscapeArea())~
END


ALTER_TRANS KELDDA
BEGIN 5 END
BEGIN 0 END
BEGIN
  "ACTION" ~SetGlobal("JA#MARL_GUARD","GLOBAL",3) TakePartyGold(200) ActionOverride("JA#GUAB1",EscapeArea()) ActionOverride("JA#GUAB2",EscapeArea()) ActionOverride("JA#GUAB3",EscapeArea())~
END
