ADD_STATE_TRIGGER MERCHG 5 ~!Global("HelpAldeth","GLOBAL",2)~
REPLACE_STATE_TRIGGER MERCHG 6 ~ReactionLT(LastTalkedToBy,NEUTRAL_LOWER)~
ADD_STATE_TRIGGER MERCHG 0 ~NumTimesTalkedTo(0)~
ADD_STATE_TRIGGER MERCHG 1 ~!Global("HelpAldeth","GLOBAL",2)~ UNLESS ~!Global("HelpAldeth","GLOBAL",2)~
ADD_STATE_TRIGGER MERCHG 1 ~Global("JA#MERCHG_HELP","%SWBaldursGate_MerchantLeague_L1%",0)~


ADD_TRANS_ACTION MERCHG
BEGIN 1 END
BEGIN 0 END
~SetGlobal("JA#MERCHG_HELP","%SWBaldursGate_MerchantLeague_L1%",1) IncrementGlobal("JA#MERCLEAGUE_INSP","GLOBAL",1)~


ALTER_TRANS MERCHG
BEGIN 3 END
BEGIN 0 END
BEGIN
  "ACTION" ~IncrementGlobal("JA#MERCLEAGUE_INSP","GLOBAL",1)~
  "UNSOLVED_JOURNAL" ~@1030~
END
