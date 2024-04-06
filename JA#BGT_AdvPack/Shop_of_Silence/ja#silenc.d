ALTER_TRANS SILENC
BEGIN %silenc_initial_friendly_state% END
BEGIN 0 END
BEGIN
  "REPLY" ~@8~
END

EXTEND_BOTTOM SILENC %silenc_initial_friendly_state%
  IF ~~ THEN REPLY @0 DO ~SetGlobal("SeenSanctuary","GLOBAL",1)~ EXIT
END


ALTER_TRANS SILENC
BEGIN %silenc_last_chapter_not_seen_state%  %silenc_last_chapter_has_seen_state%  %silenc_default_state% END
BEGIN 0 END
BEGIN
  "REPLY" ~@10~
END

EXTEND_BOTTOM SILENC %silenc_last_chapter_not_seen_state%
  IF ~~ THEN REPLY @0 DO ~SetGlobal("SeenSanctuary","GLOBAL",1)~ JOURNAL #%silenc_flaming_fist_journal% EXIT
END


ALTER_TRANS SILENC
BEGIN %silenc_last_chapter_has_seen_state% END
BEGIN 0 END
BEGIN
  "JOURNAL" ~#%silenc_flaming_fist_journal%~ // journal from silenc_last_chapter_not_seen_state
END

EXTEND_BOTTOM SILENC %silenc_last_chapter_has_seen_state%  %silenc_default_state%
  IF ~Global("JA#SILENCE_MASK","LOCALS",1) !InParty("TIAX")~ THEN REPLY @2 DO ~StartStore("JA#MASK1",LastTalkedToBy(Myself))~ EXIT
  IF ~Global("JA#SILENCE_MASK","LOCALS",1)  InParty("TIAX")~ THEN REPLY @2 GOTO JA#SILENC_3
  IF ~~ THEN REPLY @0 JOURNAL #%silenc_flaming_fist_journal% EXIT
END


ALTER_TRANS SILENC
BEGIN %silenc_payday_state% END
BEGIN 1 END
BEGIN
  "REPLY" ~@9~
END


ALTER_TRANS SILENC
BEGIN %silenc_turn_hostile_state% END
BEGIN END
BEGIN
  "ACTION" ~DialogInterrupt(FALSE) Wait(3) ActionOverride("Mongo",Enemy()) Enemy()~
END


APPEND SILENC

IF WEIGHT #%silenc_last_chapter_not_seen_state_weight% ~Global("SeenSanctuary","GLOBAL",1) Global("JA#KNOW_MASKTEMPLE","GLOBAL",1)~ THEN JA#SILENC_1
  SAY @3
  IF ~~ THEN REPLY @4 DO ~StartStore("stosilen",LastTalkedToBy(Myself))~ EXIT
  IF ~!InParty("TIAX")~ THEN REPLY @5 DO ~SetGlobal("JA#SILENCE_MASK","LOCALS",1)~ GOTO JA#SILENC_2
  IF ~ InParty("TIAX")~ THEN REPLY @5 DO ~SetGlobal("JA#SILENCE_MASK","LOCALS",1)~ GOTO JA#SILENC_3
  IF ~~ THEN REPLY @0 EXIT
END

IF ~~ THEN JA#SILENC_2
  SAY @6
  IF ~~ THEN DO ~StartStore("JA#MASK1",LastTalkedToBy(Myself))~ EXIT
END

IF ~~ THEN JA#SILENC_3
  SAY @7
  IF ~~ THEN EXIT
END

END // APPEND SILENC
