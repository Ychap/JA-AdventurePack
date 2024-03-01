REPLACE_ACTION_TEXT ALDETH
~GiveItem("POTN09"~
~GiveItem("JA#ALDET"~


APPEND Aldeth

IF ~GlobalLT("Chapter","GLOBAL",%tutu_chapter_5%) Global("SeniyadXP","GLOBAL",1)~ THEN BEGIN
SAY @18 = @19
IF ~~ THEN DO ~SetGlobal("AldethMove","GLOBAL",1) GiveItem("JA#ALDET",LastTalkedToBy) Shout(5) AddexperienceParty(600) EraseJournalEntry(%strref%) EscapeArea()~ SOLVED_JOURNAL @20 EXIT
END

END // APPEND Aldeth
