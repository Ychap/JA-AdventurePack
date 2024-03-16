/* this won't show if garrick-tt would be installed before */
EXTEND_TOP TENYA 8 #1
IF ~PartyHasItem("MISC53") Dead("Jebadoh") Dead("Telman") Dead("Sonner")~ THEN REPLY @0 GOTO 10
END
