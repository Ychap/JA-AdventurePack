// Bentley's reaction to chapter 3 - Commented out, to make responeses in BENTLY 0 1 from SotSC and bg1re still accessible

// ADD_STATE_TRIGGER BENTLY 3 ~Dead("Mulahey")~

// SET_WEIGHT BENTLY 3 #0


ALTER_TRANS BENTLY
BEGIN 2 END
BEGIN 0 END
BEGIN
  "REPLY" ~@0~
END

EXTEND_BOTTOM BENTLY 2
  IF ~~ THEN REPLY @1 EXIT
END
