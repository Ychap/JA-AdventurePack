// BGEE/EET
ADD_TRANS_ACTION RAMAZI
BEGIN 11 END
BEGIN 0 END
~SetGlobal("RamazithMove","GLOBAL",2)~
UNLESS ~SetGlobal("RamazithMove","GLOBAL",2)~

// BGT (better check for failed quest (similar as in BGEE/EET))
REPLACE_TRANS_TRIGGER RAMAZI
BEGIN 11 END
BEGIN 0 END
~!PartyHasItem("MISC68")~
~OR(2) Dead("Abela") Global("AbelaTeleport","GLOBAL",1)~

// BGT (add missing QUICK_TELEPORT on teleport)
REPLACE_ACTION_TEXT RAMAZI
~ForceSpell(LastTalkedToBy(Myself),WIZARD_LIGHTNING_BOLT)~
~ForceSpell(LastTalkedToBy(Myself),WIZARD_LIGHTNING_BOLT) Wait(1) ForceSpellPoint([169.147],QUICK_TELEPORT)~
UNLESS ~ForceSpellPoint(\[169.147\],QUICK_TELEPORT)~

// BGEE/EET (add missing WIZARD_LIGHTNING_BOLT on teleport)
REPLACE_ACTION_TEXT RAMAZI
~ForceSpellPoint(\[169.147\],QUICK_TELEPORT)~
~ForceSpell(LastTalkedToBy(Myself),WIZARD_LIGHTNING_BOLT) Wait(1) ForceSpellPoint([169.147],QUICK_TELEPORT)~
UNLESS ~ForceSpell(LastTalkedToBy(Myself),WIZARD_LIGHTNING_BOLT)~


ADD_STATE_TRIGGER RAMAZI 0
~!AreaCheck("%NBaldursGate_RamazithsTower_L3%")
!AreaCheck("%NBaldursGate_RamazithsTower_L5%")
!AreaCheck("%NBaldursGate_RamazithsTower_L6%")~

ADD_STATE_TRIGGER RAMAZI 2
~!AreaCheck("%NBaldursGate_RamazithsTower_L3%")
!AreaCheck("%NBaldursGate_RamazithsTower_L5%")
!AreaCheck("%NBaldursGate_RamazithsTower_L6%")~

ADD_STATE_TRIGGER RAMAZI 11
~Global("JA#ABELA_FREE","GLOBAL",0)
!AreaCheck("%NBaldursGate_RamazithsTower_L3%")
!AreaCheck("%NBaldursGate_RamazithsTower_L5%")
!AreaCheck("%NBaldursGate_RamazithsTower_L6%")~

ADD_STATE_TRIGGER RAMAZI 13
~!AreaCheck("%NBaldursGate_RamazithsTower_L3%")
!AreaCheck("%NBaldursGate_RamazithsTower_L5%")
!AreaCheck("%NBaldursGate_RamazithsTower_L6%")~

REPLACE_STATE_TRIGGER RAMAZI 22
~Global("HelpRamazith","GLOBAL",1) !PartyHasItem("MISC68")~
IF ~True()~

// BGT (spawn at same postion as in BGEE/EET)
REPLACE_TRANS_TRIGGER RAMAZI
BEGIN 13 END
BEGIN 0 END
~CreateCreature("ABELA",[260.170],0)~
~CreateCreature("ABELA",[376.228],2) ActionOverride("Abela",Wait(1))~


ALTER_TRANS RAMAZI
BEGIN 15 END
BEGIN 0 END
BEGIN
  "REPLY" ~@15~
  "EPILOGUE" ~GOTO JA#RAMAZITH_15~
END

EXTEND_BOTTOM RAMAZI 15
IF ~~ THEN REPLY @1 DO ~%state15_actions%~ GOTO JA#RAMAZITH_6
IF ~~ THEN REPLY @17 DO ~%state15_actions%~ GOTO JA#RAMAZITH_8
END

ADD_TRANS_ACTION RAMAZI
BEGIN 15 END
BEGIN 0 1 2 END
~AddexperienceParty(400)~

ADD_TRANS_ACTION RAMAZI
BEGIN 15 END
BEGIN 0 2 END
~ReputationInc(-2)~


EXTEND_BOTTOM RAMAZI 16 18
IF ~~ THEN REPLY @17 GOTO JA#RAMAZITH_8
END


ALTER_TRANS RAMAZI
BEGIN 19 END
BEGIN 0 END
BEGIN
  "ACTION" ~~
  "REPLY" ~@14~
  "EPILOGUE" ~GOTO JA#RAMAZITH_19~
END

EXTEND_BOTTOM RAMAZI 19
IF ~~ THEN REPLY @2 GOTO JA#RAMAZITH_4
IF ~~ THEN REPLY @17 GOTO JA#RAMAZITH_8
END


ALTER_TRANS RAMAZI
BEGIN ~%default_dialog_state%~ END // 10(BGEE/EET) or 22(BGT)
BEGIN 0 END
BEGIN
  "TRIGGER" ~Global("HelpRamazith","GLOBAL",1) !PartyHasItem("MISC68")~
  "ACTION" ~~
  "REPLY" ~@16~
  "EPILOGUE" ~GOTO JA#RAMAZITH_22~
END

EXTEND_BOTTOM RAMAZI ~%default_dialog_state%~ // 10(BGEE/EET) or 22(BGT)
IF ~Global("HelpRamazith","GLOBAL",1) !PartyHasItem("MISC68")~ THEN
REPLY @3
GOTO JA#RAMAZITH_19
END

/*
REPLACE_ACTION_TEXT RAMAZI
~SetGlobalTimer("Ramazith","GLOBAL",[^)]+)~
~~*/

REPLACE_STATE_TRIGGER RAMAZI 16 ~AreaCheck("%NBaldursGate_RamazithsTower_L1%")
!GlobalGT("RamazithMove","GLOBAL",1)
Global("HelpRamazith","GLOBAL",3)~



APPEND RAMAZI


IF ~GlobalTimerExpired("JA#RamazithItem","GLOBAL") Global("JA#RamazithDeal","GLOBAL",1)~ THEN BEGIN JA#RAMAZITH_X0
SAY @20
IF ~~ THEN REPLY @21 DO ~ClearAllActions() StartCutSceneMode() StartCutScene("JA#CURA1")~ EXIT
IF ~~ THEN REPLY @22 GOTO JA#RAMAZITH_X1
END

IF ~~ THEN BEGIN JA#RAMAZITH_X1
SAY @23
IF ~~ THEN DO ~SetGlobal("JA#RamazithDeal","GLOBAL",10) ForceSpell(Myself,WIZARD_STONE_SKIN) Enemy()~ EXIT
END

IF ~Global("JA#RamazithDeal","GLOBAL",2)~ THEN BEGIN JA#RAMAZITH_X2
SAY @24
IF ~PartyGoldGT(199)~ THEN REPLY @25 DO ~SetGlobal("JA#RamazithDeal","GLOBAL",4)~ GOTO JA#RAMAZITH_X3
IF ~~ THEN REPLY @26 DO ~SetGlobal("JA#RamazithDeal","GLOBAL",3)~ GOTO JA#RAMAZITH_X4
END

IF ~~ THEN BEGIN JA#RAMAZITH_X3
SAY @27
IF ~~ THEN DO ~TakePartyGold(200) GiveItemCreate("CLCK07",LastTalkedToBy(Myself),0,0,0)~ EXIT
END

IF ~~ THEN BEGIN JA#RAMAZITH_X4
SAY @28
IF ~~ THEN EXIT
END

IF ~Global("JA#RamazithDeal","GLOBAL",3)~ THEN BEGIN JA#RAMAZITH_X5
SAY @29
IF ~PartyGoldGT(199)~ THEN REPLY @25 DO ~SetGlobal("JA#RamazithDeal","GLOBAL",4)~ GOTO JA#RAMAZITH_X3
IF ~~ THEN REPLY @30 EXIT
END

IF ~Global("JA#RamazithDeal","GLOBAL",4)~ THEN BEGIN JA#RAMAZITH_X6
SAY @31
IF ~~ THEN EXIT
END

IF ~GlobalTimerNotExpired("JA#RamazithItem","GLOBAL") Global("JA#RamazithDeal","GLOBAL",1)~ THEN BEGIN JA#RAMAZITH_X7
SAY @32
IF ~~ THEN EXIT
END


IF WEIGHT #0 ~AreaCheck("%NBaldursGate_RamazithsTower_L3%") GlobalGT("RamazithMove","GLOBAL",1)~
THEN BEGIN JA#RAMAZITH_1
SAY @5
IF ~~ THEN DO ~ForceSpell(LastTalkedToBy(Myself),SPIDER_SUMMON)
Wait(1)
ForceSpell(Myself,DRYAD_TELEPORT)
Wait(1)
DestroySelf()~ EXIT
END

IF WEIGHT #0 ~AreaCheck("%NBaldursGate_RamazithsTower_L6%") GlobalGT("RamazithMove","GLOBAL",1)~
THEN BEGIN JA#RAMAZITH_2
SAY @6
IF ~~ THEN DO ~ForceSpell(Myself,WIZARD_STONE_SKIN)
Wait(1)
ForceSpell(Myself,SUMMON_SHADOW)~ EXIT
END

IF WEIGHT #0 ~AreaCheck("%NBaldursGate_RamazithsTower_L5%") GlobalGT("RamazithMove","GLOBAL",1)~
THEN BEGIN JA#RAMAZITH_3
SAY @7
IF ~~ THEN DO ~Wait(1)
ForceSpell(Myself,DRYAD_TELEPORT)
Wait(1)
DestroySelf()~ EXIT
END

/*
IF ~Global("JA#ABELA_FREE","GLOBAL",1) !PartyHasItem("MISC68")~ THEN BEGIN JA#RAMAZITH_7
SAY @13
IF ~~ THEN DO ~ForceSpell(LastTalkedToBy(Myself),WIZARD_LIGHTNING_BOLT)
Wait(1)
SetGlobal("RamazithMove","GLOBAL",2)
ForceSpell(Myself,DRYAD_TELEPORT)
Wait(1)
DestroySelf()~ EXIT
END
*/

IF ~~ THEN BEGIN JA#RAMAZITH_4
SAY @8
IF ~~ THEN EXIT
END


IF ~True()~ THEN BEGIN JA#RAMAZITH_5
SAY @9
IF ~~ THEN REPLY @10 GOTO JA#RAMAZITH_6
IF ~~ THEN REPLY @11 EXIT
END


IF ~~ THEN BEGIN JA#RAMAZITH_6
SAY @12
IF ~~ THEN DO ~DialogInterrupt(FALSE)
ForceSpell(LastTalkedToBy(Myself),WIZARD_LIGHTNING_BOLT)
SetGlobal("RamazithMove","GLOBAL",2)
DialogInterrupt(TRUE)
ForceSpell(Myself,DRYAD_TELEPORT)
Wait(1)
DestroySelf()~ EXIT
END


IF ~~ THEN BEGIN JA#RAMAZITH_8
SAY @19
IF ~~ THEN DO ~DialogInterrupt(FALSE)
SetGlobalTimer("JA#RamazithItem","GLOBAL",TWO_DAYS)
SetGlobal("JA#RamazithDeal","GLOBAL",1)
DialogInterrupt(TRUE)
ForceSpell(Myself,DRYAD_TELEPORT)
Wait(1)
DestroySelf()~ SOLVED_JOURNAL @18 EXIT
END


IF ~~ THEN BEGIN JA#RAMAZITH_15
SAY @40
IF ~~ THEN EXIT
END


IF ~~ THEN BEGIN JA#RAMAZITH_19
SAY @12
COPY_TRANS RAMAZI 19
END


IF ~~ THEN BEGIN JA#RAMAZITH_22
SAY @4
IF ~~ THEN EXIT
END


END // APPEND RAMAZI



BEGIN JA#RAMAZ

IF ~NumTimesTalkedTo(0)~ THEN BEGIN JA#RAMAZ_0
SAY @33
IF ~~ THEN REPLY @34 GOTO JA#RAMAZ_1
IF ~~ THEN REPLY @35 GOTO JA#RAMAZ_2
IF ~~ THEN REPLY @36 GOTO JA#RAMAZ_1
END

IF ~~ THEN BEGIN JA#RAMAZ_1
SAY @37
IF ~~ THEN DO ~ForceSpell(LastTalkedToBy(Myself),WIZARD_LIGHTNING_BOLT)
Wait(1)
SetGlobal("RamazithMove","GLOBAL",2)
ForceSpell(Myself,DRYAD_TELEPORT)
Wait(1)
DestroySelf()~ EXIT
END

IF ~~ THEN BEGIN JA#RAMAZ_2
SAY @38
IF ~~ THEN DO ~ForceSpell(LastTalkedToBy(Myself),WIZARD_LIGHTNING_BOLT)
Wait(1)
SetGlobal("RamazithMove","GLOBAL",2)
ForceSpell(Myself,DRYAD_TELEPORT)
Wait(1)
DestroySelf()~ EXIT
END
