// garrick-tt does INTERJECT TENYA 8
EXTEND_TOP TENYA 8 #1
  IF ~Dead("Jebadoh") Dead("Telman") Dead("Sonner") PartyHasItem("MISC53")~ THEN REPLY @0 GOTO 10
END



REPLACE_TRANS_TRIGGER TENYA2
BEGIN 0 END
BEGIN 2 3 END
~Dead("Jebadoh")~
~Global("HostileFishermen","GLOBAL",1)~
