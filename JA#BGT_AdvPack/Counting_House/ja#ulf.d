// Check for c#q14rng.itm to avoid similar response of bgqe at the same time
EXTEND_BOTTOM ULF 0
  IF ~!PartyHasItem("c#q14rng") GlobalGT("AldethMove","GLOBAL",0)~ THEN REPLY @0 GOTO JA#ULF_0
END


APPEND ULF

IF ~~ THEN JA#ULF_0
  SAY @1
  IF ~~ THEN EXIT
END

END // APPEND ULF
