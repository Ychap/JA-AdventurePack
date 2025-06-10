BEGIN ~JA#KEELO~

IF ~True()~ THEN 5
  SAY @0
  IF ~~ THEN EXIT
  IF ~NumTimesTalkedTo(0)~ THEN DO ~SetGlobalTimer("JA#KEELX","GLOBAL",TEN_HOURS)~ EXIT
END

// END JA#KEELO


BEGIN ~JA#KEELX~

IF ~NumTimesTalkedTo(0)~ THEN 3
  SAY @1
  IF ~PartyHasItem("POTN08")~ THEN REPLY @2 DO ~TakePartyItemNum("POTN08",1)~ EXIT
  IF ~PartyHasItem("POTN52")~ THEN REPLY @17 DO ~TakePartyItemNum("POTN52",1)~ EXIT
  IF ~PartyHasItem("POTN17")~ THEN REPLY @3 DO ~TakePartyItemNum("POTN17",1)~ EXIT
  IF ~PartyHasItem("GBERRY")~ THEN REPLY @4 DO ~TakePartyItemNum("GBERRY",1)~  EXIT
  IF ~~ THEN REPLY @5 EXIT
  IF ~~ THEN REPLY @6 DO ~SetGlobal("JA#KEELOR","LOCALS",1)~ EXIT
  IF ~~ THEN REPLY @7 GOTO 6
END

IF ~Global("JA#KEELOR","LOCALS",0)~ THEN JA#KEELX_1
  SAY @8
  IF ~PartyHasItem("POTN08")~ THEN REPLY @2 DO ~TakePartyItemNum("POTN08",1)~ EXIT
  IF ~PartyHasItem("POTN52")~ THEN REPLY @17 DO ~TakePartyItemNum("POTN52",1)~ EXIT
  IF ~PartyHasItem("POTN17")~ THEN REPLY @3 DO ~TakePartyItemNum("POTN17",1)~ EXIT
  IF ~PartyHasItem("GBERRY")~ THEN REPLY @4 DO ~TakePartyItemNum("GBERRY",1)~  EXIT
  IF ~~ THEN REPLY @5 EXIT
  IF ~~ THEN REPLY @6 DO ~SetGlobal("JA#KEELOR","LOCALS",1)~ EXIT
  IF ~~ THEN REPLY @7 GOTO 6
END

IF ~Global("JA#KEELOR","LOCALS",1) HPPercentLT(Myself,51)~ THEN 0
  SAY @9
  IF ~~ THEN DO ~GiveItem("AX1H02",LastTalkedToBy) SetGlobal("JA#KEELOR","LOCALS",2) ReputationInc(1) AddExperienceParty(150) EscapeAreaMove("%Beregost_RedSheaf_L1%",532,444,11)~ JOURNAL @10 EXIT
END

IF ~Global("JA#KEELOR","LOCALS",1) HPPercentGT(Myself,50) HPPercentLT(Myself,91)~ THEN 1
  SAY @11
  IF ~~ THEN DO ~GiveItem("JA#KEELX",LastTalkedToBy) SetGlobal("JA#KEELOR","LOCALS",2) ReputationInc(1) AddExperienceParty(150) EscapeAreaMove("%Beregost_RedSheaf_L1%",532,444,11)~ JOURNAL @12 EXIT
END

IF ~Global("JA#KEELOR","LOCALS",1) HPPercentGT(Myself,90)~ THEN 2
  SAY @13
  IF ~~ THEN DO ~SetGlobal("JA#KEELOR","LOCALS",2) SetGlobal("JA#NASHA","GLOBAL",1) ReputationInc(1) AddExperienceParty(150) EscapeAreaMove("%Beregost_RedSheaf_L1%",532,444,11)~ JOURNAL @14 EXIT
END

IF ~Global("JA#KEELOR","LOCALS",2)~ THEN 4
  SAY @15
  IF ~~ THEN EXIT
END


IF ~~ THEN 6
  SAY @16
  IF ~~ THEN DO ~EquipMostDamagingMelee() Enemy()~ EXIT
END

// END JA#KEELX
