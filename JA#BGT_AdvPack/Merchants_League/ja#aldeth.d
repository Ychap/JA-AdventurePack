ADD_TRANS_TRIGGER ALDETH 14
~GlobalGT("JA#MERCLEAGUE_INSP","GLOBAL",1)~ DO 1


ALTER_TRANS ALDETH
BEGIN 13 END
BEGIN 1 END
BEGIN
  "EPILOGUE" ~GOTO JA#ALDETH_00~
END

ALTER_TRANS ALDETH
BEGIN 25 END
BEGIN 0 END
BEGIN
  "ACTION" ~SetGlobal("AldethMove","GLOBAL",2) ClearAllActions() StartCutSceneMode() StartCutScene("JA#CUALD")~
END

ADD_TRANS_ACTION ALDETH
BEGIN 27 END
BEGIN 0 END
~EraseJournalEntry(@1025) EraseJournalEntry(@1026) EraseJournalEntry(@1027) EraseJournalEntry(@1028) EraseJournalEntry(@1029) EraseJournalEntry(@1030)~


APPEND ALDETH

IF ~~ THEN JA#ALDETH_00
  SAY @21
  IF ~~ THEN REPLY @22 GOTO 25
  IF ~~ THEN REPLY @23 GOTO 10
END


IF WEIGHT #0 ~GlobalLT("Chapter","GLOBAL",%tutu_chapter_7%) Global("HelpAldeth","GLOBAL",2) OR(2) PartyHasItem("JA#DIRLE") PartyHasItem("JA#DZORL")~ THEN bringback_bodies
  SAY @70
  IF ~PartyHasItem("JA#DIRLE")~ THEN DO ~TakePartyItem("JA#DIRLE") DestroyItem("JA#DIRLE") AddexperienceParty(250)~ EXIT
  IF ~PartyHasItem("JA#DZORL")~ THEN DO ~TakePartyItem("JA#DZORL") DestroyItem("JA#DZORL") AddexperienceParty(250)~ EXIT
  IF ~PartyHasItem("JA#DIRLE") PartyHasItem("JA#DZORL")~ THEN
    DO ~TakePartyItem("JA#DZORL") DestroyItem("JA#DZORL") TakePartyItem("JA#DIRLE") DestroyItem("JA#DIRLE") AddexperienceParty(500)~
  EXIT
END

END // APPEND ALDETH


INTERJECT_COPY_TRANS2 IRLENT 3 JA#aldeth_party
  == ALDETH @27
END
