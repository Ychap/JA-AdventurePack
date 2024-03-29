
ADD_STATE_TRIGGER SSUNGU 0 ~AreaCheck("AR7601")
NumTimesTalkedTo(0)~
ADD_STATE_TRIGGER SSUNGU 3 ~AreaCheck("AR7603")
NumTimesTalkedTo(0)~
ADD_STATE_TRIGGER SSUNGU 7 ~!AreaCheck("AR7601")
NumTimesTalkedToGT(0)~



// DOPPSM.DLG

ADD_STATE_TRIGGER DOPPSM 0 ~AreaCheck("AR7601")~
ADD_STATE_TRIGGER DOPPSM 4 ~AreaCheck("AR7602")~

ALTER_TRANS DOPPSM // file name
BEGIN 6 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~ForceSpell(Myself,DOPPLEGANGER_CHANGE)~
END

ALTER_TRANS SSUNGU // file name
BEGIN 1 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#7SUNS_GUARDDEAD","GLOBAL",1)
MoveToPoint([546.215])
DestroySelf()~
END

ALTER_TRANS SSUNGU // file name
BEGIN 3 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetNumTimesTalkedTo(0)~
END


ALTER_TRANS SSUNGU // file name
BEGIN 4 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "EPILOGUE" ~GOTO JA#SSUNGU_02~
END

ALTER_TRANS SSUNGU // file name
BEGIN 4 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~ActionOverride(Player1,LeaveAreaLUA("AR8000","",[3648.1404],14))
ActionOverride(Player2,LeaveAreaLUA("AR8000","",[3596.1427],14))
ActionOverride(Player3,LeaveAreaLUA("AR8000","",[3615.1374],14))
ActionOverride(Player4,LeaveAreaLUA("AR8000","",[3567.1389],14))
ActionOverride(Player5,LeaveAreaLUA("AR8000","",[3577.1348],14))
ActionOverride(Player6,LeaveAreaLUA("AR8000","",[3533.1367],14))~
END


ALTER_TRANS DOPPSM // file name
BEGIN 5 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "EPILOGUE" ~EXTERN JA#SSGU4 1~
END



APPEND SSUNGU

IF ~AreaCheck("AR7601")Global("JA#SSGU1_LEAVE","AR7601",2)~ THEN JA#SSUNGU_03
SAY ~Das... das waren die ganze Zeit Gestaltwandler? Was für ein Glück, dass wir überlebt haben. Aber nochmal brauch ich das nicht!~
IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~AreaCheck("AR7601")NumTimesTalkedToGT(0)~ THEN JA#SSUNGU_01
SAY ~Ihr schon wieder? Der Zutritt ist im Augenblick nur Mitgliedern der Sieben Sonnen gestattet.~
IF ~~ THEN REPLY ~Wir sind gekommen, um Jhasso zu sprechen.~ GOTO 1
IF ~~ THEN REPLY ~Okay. Dann gehen wir wieder.~ EXIT
END

IF ~~ THEN JA#SSUNGU_02
SAY ~Dann war dies Eure letzte Dummheit!~
IF ~~ THEN DO ~SetGlobal("Doppleganger","GLOBAL",1)~ EXIT
END


END







BEGIN ~JA#SSGU4~

IF ~NumTimesTalkedTo(0)~ THEN 0
SAY ~Von gestaltwandelnden Monstern hat niemand was gesagt. Dafür ist der Sold zu niedrig, ich verdrück mich.~
IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~~ THEN 1
SAY ~Sie töten? Aber das verstößt gegen das Gesetz.~
IF ~~ THEN DO ~SetGlobal("JA#SSGU4_LEAVE","AR7602",1)~ EXTERN DOPPSM 6
END
