ADD_STATE_TRIGGER BRANDI 0 ~NumTimesTalkedTo(0)~
/* Brandilar will only inquire about the investigation if the doppelgangers aren't in the open yet */
ADD_STATE_TRIGGER BRANDI 7 ~Global("ZorlDopple","GLOBAL",0)~
/* add state trigger so Brandilar recognise the doppelganger change */
ADD_STATE_TRIGGER BRANDI 11 ~Global("ZorlDopple","GLOBAL",1) Global("HelpBrandilar","GLOBAL",1)~

SET_WEIGHT BRANDI 11 #1


// BGT (set "HelpBrandilar" like in EE)
ADD_STATE_TRIGGER BRANDI 13 ~Global("HelpBrandilar","GLOBAL",3)~
UNLESS ~Global("HelpBrandilar","GLOBAL",3)~

// BGT (use "LiedBrandilar" like in EE)
ADD_STATE_TRIGGER BRANDI 14 ~GlobalGT("LiedBrandilar","GLOBAL",0)~
UNLESS ~"LiedBrandilar","GLOBAL"~


ADD_TRANS_TRIGGER BRANDI 7
~Global("JA#MERLEA_MYST","GLOBAL",1)~ DO 1


// BGT (set "LiedBrandilar" like in EE)
ADD_TRANS_ACTION BRANDI
BEGIN 5 END
BEGIN END
~SetGlobal("LiedBrandilar","GLOBAL",1)~
UNLESS ~"LiedBrandilar","GLOBAL"~


ALTER_TRANS BRANDI
BEGIN 10 END
BEGIN 0 END
BEGIN
  "EPILOGUE" ~GOTO JA#BRANDI_01~
END

ALTER_TRANS BRANDI
BEGIN 11 END
BEGIN END
BEGIN
  "UNSOLVED_JOURNAL" ~@1025~
END

ALTER_TRANS BRANDI
BEGIN 14 END
BEGIN 0 END
BEGIN
  "REPLY" ~@6~
END


EXTEND_TOP BRANDI 7 #2
  IF ~Global("JA#BRANDIHELP1","LOCALS",0) Global("ZorlParty","GLOBAL",1)~ THEN REPLY @0 GOTO JA#BRANDI_00
END

EXTEND_BOTTOM BRANDI 14
  IF ~~ THEN REPLY @1 GOTO 4
END


APPEND BRANDI

IF ~~ THEN JA#BRANDI_00
  SAY @2 = @3 = @4
  IF ~~ THEN DO ~SetGlobal("JA#BRANDIHELP1","LOCALS",1)~ EXIT
END

IF ~~ THEN JA#BRANDI_01
  SAY @5
  IF ~~ THEN EXIT
END

END // APPEND BRANDI
