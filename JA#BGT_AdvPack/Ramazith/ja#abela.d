// BGT (Global introduced by BGEE/EET)
ADD_STATE_TRIGGER ABELA 5
~Global("RagefastDead","GLOBAL",0)~
UNLESS ~Global("RagefastDead","GLOBAL",0)~


// BGT (Global introduced by BGEE/EET)
ADD_TRANS_ACTION RAMAZI
BEGIN 13 END
BEGIN 0 END
~SetGlobal("RagefastDead","GLOBAL",1)~
UNLESS ~SetGlobal("RagefastDead","GLOBAL",1)~


APPEND ABELA

IF ~!Dead("Ramazith") Global("HelpRamazith","GLOBAL",3)~ THEN JA#ABELA_1
  SAY @0
  IF ~~ THEN EXIT
END

END // APPEND ABELA
