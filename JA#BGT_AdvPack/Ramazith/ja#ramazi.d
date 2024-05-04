// BGT (add missing Enemy() and QUICK_TELEPORT when Ramazith teleports)
REPLACE_ACTION_TEXT RAMAZI
~ForceSpell(LastTalkedToBy(Myself),WIZARD_LIGHTNING_BOLT)~
~ForceSpell(LastTalkedToBy(Myself),WIZARD_LIGHTNING_BOLT) Enemy() ForceSpellPoint([169.147],QUICK_TELEPORT)~
UNLESS ~QUICK_TELEPORT~

// BGEE/EET (add missing WIZARD_LIGHTNING_BOLT when Ramazith teleports)
REPLACE_ACTION_TEXT RAMAZI
~Enemy()[%WNL%%MNL%%LNL%%TAB% ]*ForceSpellPoint(\[169.147\],QUICK_TELEPORT)~
~ForceSpell(LastTalkedToBy(Myself),WIZARD_LIGHTNING_BOLT) Enemy() ForceSpellPoint([169.147],QUICK_TELEPORT)~
UNLESS ~WIZARD_LIGHTNING_BOLT~


// BGT (Fix: better check for failed quest (similar as in BGEE/EET))
ADD_STATE_TRIGGER RAMAZI 11
~OR(2) Dead("Abela") Global("AbelaTeleport","GLOBAL",1)~
UNLESS ~Global("AbelaTeleport","GLOBAL",1)~
UNLESS ~Global("AbelaNotExists","GLOBAL",1)~


// BGEE/EET (set "RamazithMove" to 2 as in BGT)
ADD_TRANS_ACTION RAMAZI
BEGIN 11 12 22 END
BEGIN END
~SetGlobal("RamazithMove","GLOBAL",2)~
IF ~Enemy()~
IF ~QUICK_TELEPORT~
UNLESS ~SetGlobal("RamazithMove","GLOBAL",[23])~


// BGT (only trigger while on quest)
REPLACE_STATE_TRIGGER RAMAZI 22
~Global("HelpRamazith","GLOBAL",1) !PartyHasItem("MISC68")~
IF ~True()~


// BGT (Unlocks door to tower, when quest taken)
ADD_TRANS_ACTION RAMAZI
BEGIN 9 END
BEGIN END
~Unlock("Door0137")~
IF ~EscapeArea\(Destroy\)?([0-9]*)~


// BGT (spawn at same postion as in BGEE/EET)
REPLACE_TRANS_ACTION RAMAZI
BEGIN 13 END
BEGIN 0 END
~CreateCreature("ABELA",\[260.170\],0)~
~CreateCreature("ABELA",[376.228],2) ActionOverride("Abela",Wait(1))~



ALTER_TRANS RAMAZI
BEGIN 15 END
BEGIN 0 END
BEGIN
  "REPLY" ~@15~
  "ACTION" ~ReputationInc(-2) AddexperienceParty(400) %state15_response0_action%~
END

EXTEND_BOTTOM RAMAZI 15
  IF ~~ THEN REPLY @1 DO ~AddexperienceParty(400) %state15_response0_action%~ GOTO 17
END


EXTEND_BOTTOM RAMAZI 16 18
  IF ~InMyArea("Abela")~ THEN REPLY @17 GOTO JA#RAMAZITH_8
END


ALTER_TRANS RAMAZI
BEGIN 19 END
BEGIN 0 END
BEGIN
  "REPLY" ~@14~
  "ACTION" ~~ // state 17 has exact same trans action
  "EPILOGUE" ~GOTO JA#RAMAZITH_6~
END

EXTEND_BOTTOM RAMAZI 19
  IF ~~ THEN REPLY @2 GOTO JA#RAMAZITH_4
  IF ~InMyArea("Abela")~ THEN REPLY @17 GOTO JA#RAMAZITH_8
END


ALTER_TRANS RAMAZI
BEGIN %fallback_state_during_quest% END // 10(BGEE/EET) or 22(BGT)
BEGIN 0 END
BEGIN
  "REPLY" ~@16~
  "EPILOGUE" ~GOTO JA#RAMAZITH_10_22~
END

EXTEND_BOTTOM RAMAZI %fallback_state_during_quest% // 10(BGEE/EET) or 22(BGT)
  IF ~~ THEN REPLY @3 GOTO JA#RAMAZITH_7
END


APPEND RAMAZI

IF ~GlobalTimerExpired("JA#RamazithItem","GLOBAL") Global("JA#RamazithDeal","GLOBAL",1)~ THEN JA#RAMAZITH_X0
  SAY @20
  IF ~~ THEN REPLY @21 DO ~ClearAllActions() StartCutSceneMode() StartCutScene("JA#CURA1")~ EXIT
  IF ~~ THEN REPLY @22 GOTO JA#RAMAZITH_X1
END

IF ~~ THEN JA#RAMAZITH_X1
  SAY @23
  IF ~~ THEN DO ~SetGlobal("JA#RamazithDeal","GLOBAL",10) ForceSpell(Myself,WIZARD_STONE_SKIN) Enemy()~ EXIT
END

IF ~Global("JA#RamazithDeal","GLOBAL",2)~ THEN JA#RAMAZITH_X2
  SAY @24
  IF ~PartyGoldGT(199)~ THEN REPLY @25 DO ~SetGlobal("JA#RamazithDeal","GLOBAL",4)~ GOTO JA#RAMAZITH_X3
  IF ~~ THEN REPLY @26 DO ~SetGlobal("JA#RamazithDeal","GLOBAL",3)~ GOTO JA#RAMAZITH_X4
END

IF ~~ THEN JA#RAMAZITH_X3
  SAY @27
  IF ~~ THEN DO ~TakePartyGold(200) GiveItemCreate("CLCK07",LastTalkedToBy,0,0,0)~ EXIT
END

IF ~~ THEN JA#RAMAZITH_X4
  SAY @28
  IF ~~ THEN EXIT
END

IF ~Global("JA#RamazithDeal","GLOBAL",3)~ THEN JA#RAMAZITH_X5
  SAY @29
  IF ~PartyGoldGT(199)~ THEN REPLY @25 DO ~SetGlobal("JA#RamazithDeal","GLOBAL",4)~ GOTO JA#RAMAZITH_X3
  IF ~~ THEN REPLY @30 EXIT
END

IF ~Global("JA#RamazithDeal","GLOBAL",4)~ THEN JA#RAMAZITH_X6
  SAY @31
  IF ~~ THEN EXIT
END

IF ~GlobalTimerNotExpired("JA#RamazithItem","GLOBAL") Global("JA#RamazithDeal","GLOBAL",1)~ THEN JA#RAMAZITH_X7
  SAY @32
  IF ~~ THEN EXIT
END


IF WEIGHT #0 ~AreaCheck("%NBaldursGate_RamazithsTower_L1%") OR(2) Global("HelpRamazith","GLOBAL",0) Global("HelpRamazith","GLOBAL",4)~ THEN JA#RAMAZITH_10
  SAY @33
  IF ~~ THEN REPLY @34 GOTO JA#RAMAZITH_11
  IF ~~ THEN REPLY @35 GOTO JA#RAMAZITH_12
  IF ~~ THEN REPLY @36 GOTO JA#RAMAZITH_11
END

IF ~~ THEN JA#RAMAZITH_11
  SAY @37
  COPY_TRANS_LATE RAMAZI 11 // Ramazith turns hostile (but without Abela)
END

IF ~~ THEN JA#RAMAZITH_12
  SAY @38
  COPY_TRANS_LATE RAMAZI 11 // Ramazith turns hostile (but without Abela)
END


IF WEIGHT #0 ~AreaCheck("%NBaldursGate_RamazithsTower_L3%") GlobalGT("RamazithMove","GLOBAL",1)~ THEN JA#RAMAZITH_1
  SAY @5
  IF ~~ THEN DO ~ForceSpell(LastTalkedToBy(Myself),SPIDER_SUMMON) Wait(1) ForceSpellPoint([422.293],QUICK_TELEPORT) EscapeAreaDestroy(0)~ EXIT
END

IF WEIGHT #0 ~AreaCheck("%NBaldursGate_RamazithsTower_L5%") GlobalGT("RamazithMove","GLOBAL",1)~ THEN JA#RAMAZITH_3
  SAY @7
  IF ~~ THEN DO ~ForceSpellPoint([124.169],QUICK_TELEPORT) EscapeAreaDestroy(0)~ EXIT
END

IF WEIGHT #0 ~AreaCheck("%NBaldursGate_RamazithsTower_L6%") GlobalGT("RamazithMove","GLOBAL",1)~ THEN JA#RAMAZITH_2
  SAY @6
  IF ~~ THEN DO ~ForceSpell(Myself,WIZARD_STONE_SKIN) Wait(1) ForceSpell(Myself,SUMMON_SHADOW)~ EXIT
END


IF ~~ THEN JA#RAMAZITH_4
  SAY @8
  IF ~~ THEN EXIT
END


IF ~True()~ THEN JA#RAMAZITH_5
  SAY @9
  IF ~~ THEN REPLY @11 GOTO JA#RAMAZITH_15
  IF ~Global("HelpRamazith","GLOBAL",3) InMyArea("Abela") !Dead("Abela")~ THEN REPLY @10 GOTO JA#RAMAZITH_6
  IF ~Global("HelpRamazith","GLOBAL",3) Global("JA#RamazithDeal","GLOBAL",0) InMyArea("Abela")~ THEN REPLY @17 GOTO JA#RAMAZITH_8
END


IF ~~ THEN JA#RAMAZITH_6
  SAY @12
  COPY_TRANS_LATE RAMAZI 17 // Ramazith turns hostile
END


IF ~~ THEN JA#RAMAZITH_7
  SAY @12
  COPY_TRANS_LATE RAMAZI 11 // Ramazith turns hostile (but without Abela)
END


IF ~~ THEN JA#RAMAZITH_8
  SAY @19
  IF ~~ THEN DO ~SetGlobalTimer("JA#RamazithItem","GLOBAL",TWO_DAYS)
                 SetGlobal("JA#RamazithDeal","GLOBAL",1)
                 ForceSpellPoint([169.147],QUICK_TELEPORT)
                 ActionOverride("Abela",MoveBetweenAreas("%NBaldursGate_RamazithsTower_L6%",[336.162],2))
                 SmallWait(4)
                 EscapeAreaMove("%NBaldursGate_RamazithsTower_L6%",169,147,15)~ SOLVED_JOURNAL @18 EXIT
END


IF ~~ THEN JA#RAMAZITH_15
  SAY @13
  IF ~~ THEN EXIT
END


IF ~~ THEN JA#RAMAZITH_10_22
  SAY @4
  IF ~~ THEN EXIT
END

END // APPEND RAMAZI
