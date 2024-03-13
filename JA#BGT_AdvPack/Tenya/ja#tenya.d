
/* This is a fix */
ALTER_TRANS TENYA // file name
BEGIN 5 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Global("HostileFishermen","GLOBAL",0)~
END

/* this doesn't change anything in my install */
ALTER_TRANS TENYA // file name
BEGIN 8 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Dead("Jebadoh")
Dead("Telman")
Dead("Sonner")~
END

/* this doesn't change anything in my install */
ALTER_TRANS TENYA // file name
BEGIN 8 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~PartyHasItem("MISC53")~
END

/* this won't show because Garrick (bg1npc + GToaT and Finch have I_C_T and are likely to be installed before JAP */
EXTEND_BOTTOM TENYA 8
IF ~PartyHasItem("MISC53")
Dead("Jebadoh")
Dead("Telman")
Dead("Sonner")~ THEN REPLY @25 GOTO 10
END
