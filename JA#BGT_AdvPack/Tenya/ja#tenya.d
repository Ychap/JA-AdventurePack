
/* This is a fix */
ALTER_TRANS TENYA
BEGIN 5 END
BEGIN 0 END
BEGIN
  "TRIGGER" ~Global("HostileFishermen","GLOBAL",0)~
END


/* this won't show if garrick-tt is installed before */
EXTEND_TOP TENYA 8 #1
IF ~PartyHasItem("MISC53") Dead("Jebadoh") Dead("Telman") Dead("Sonner")~ THEN REPLY @25 GOTO 10
END
