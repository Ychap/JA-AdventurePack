REPLACE_STATE_TRIGGER SILENC 5 // threaten Mongo
~Global("NoPayment","GLOBAL",1) GlobalLT("Chapter","GLOBAL",%tutu_chapter_7%)~

REPLACE_STATE_TRIGGER SILENC 3 // payday
~Global("NoPayment","GLOBAL",0) GlobalLT("Chapter","GLOBAL",%tutu_chapter_7%) NumTimesTalkedToGT(4) ReactionLT(LastTalkedToBy,FRIENDLY_LOWER)~

REPLACE_STATE_TRIGGER SILENC 10 // turn hostile
~Global("NoPayment","GLOBAL",2)~


ADD_TRANS_TRIGGER SILENC 1 // initial neutral
~PartyGoldGT(4)~ DO 1

ADD_TRANS_TRIGGER SILENC 3 // payday
~PartyGoldGT(4)~ DO 1


ADD_TRANS_ACTION SILENC
BEGIN 9 0 6 END // charmed + initial friendly + last chapter not seen
BEGIN END
~SetGlobal("SeenSanctuary","GLOBAL",1)~

ADD_TRANS_ACTION SILENC
BEGIN 1 END // initial neutral
BEGIN 1 END
~SetGlobal("SeenSanctuary","GLOBAL",1)~


REPLACE_TRANS_ACTION SILENC
BEGIN 4 END // follow up initial neutral
BEGIN END
~Wait([0-9]+)[%WNL%%MNL%%LNL%%TAB% ]*CreateCreature("GUARD",[^)]+)~
~NoAction()~


ALTER_TRANS SILENC
BEGIN 2 END // initial hostile
BEGIN 0 END
BEGIN
  "ACTION" ~SetGlobal("NoPayment","GLOBAL",1)~
END


ALTER_TRANS SILENC
BEGIN 5 END // threaten Mongo
BEGIN END
BEGIN
  "ACTION" ~SetGlobal("NoPayment","GLOBAL",2)~
END


ALTER_TRANS SILENC
BEGIN 3 END // payday
BEGIN 1 END
BEGIN
  "ACTION" ~TakePartyGold(5) SetNumTimesTalkedTo(1) StartStore("stosilen",LastTalkedToBy(Myself))~
END
