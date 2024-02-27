ADD_STATE_TRIGGER IRLENT 0 ~Global("JA#IRLENT_CUT01","%SWBaldursGate_MerchantLeague_L1%",0)~
REPLACE_STATE_TRIGGER IRLENT 6 ~Global("JA#IRLENT_CUT01","%SWBaldursGate_MerchantLeague_L1%",5)~
REPLACE_STATE_TRIGGER IRLENT 5 ~!Global("JA#IRLENT_CUT01","%SWBaldursGate_MerchantLeague_L1%",2) !Global("JA#IRLENT_CUT01","%SWBaldursGate_MerchantLeague_L1%",5)
OR(2) AreaCheck("%SWBaldursGate_MerchantLeague_L1%") AreaCheck("%SWBaldursGate_MerchantLeague_L3%")~


/* Irlentree remains at the 1st level
ALTER_TRANS IRLENT
BEGIN 2 END
BEGIN 0 1 END
BEGIN
  "ACTION" ~MoveToPoint([394.342])
DestroySelf()~
END
*/

ALTER_TRANS IRLENT
BEGIN 6 END
BEGIN 0 END
BEGIN
  "EPILOGUE" ~GOTO JA#IRLENT_02~
END

APPEND IRLENT

IF ~Global("JA#IRLENT_CUT01","%SWBaldursGate_MerchantLeague_L1%",2)~ THEN BEGIN JA#IRLENT_01
SAY @0 = @1
IF ~~ THEN DO ~SetGlobal("JA#IRLENT_CUT01","%SWBaldursGate_MerchantLeague_L1%",3) SetGlobal("JA#DOPPELGANGER_SPAWN","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN JA#IRLENT_02
SAY @2
IF ~~ THEN DO ~SetGlobal("JA#IRLENT_CUT01","%SWBaldursGate_MerchantLeague_L1%",6) SetGlobal("JA#SENDZORL","GLOBAL",1)
SetGlobal("C#JA#_CorpseDrop","GLOBAL",1)
EscapeAreaMove("%SWBaldursGate_MerchantLeague_L3%",622,563,7)~ UNSOLVED_JOURNAL @1027 EXIT
END

END // APPEND IRLENT
