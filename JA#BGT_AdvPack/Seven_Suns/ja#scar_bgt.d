REPLACE_TRIGGER_TEXT SCAR
~GlobalGT("KilledDopple","GLOBAL",\([0-9]+\))~
~NumDeadGT("SSDOPPLE",\1)~

REPLACE_TRIGGER_TEXT SCAR
~Global("KilledDopple","GLOBAL",\([0-9]+\))~
~OR(2) NumDead("SSDOPPLE",\1) NumDeadGT("SSDOPPLE",\1)~


ADD_TRANS_TRIGGER SCAR 8
~!Dead("Jhasso")~ DO 2

EXTEND_TOP SCAR 8 #3
  IF ~Dead("Jhasso") NumDeadGT("SSDOPPLE",4)~ THEN REPLY @0 GOTO 17
END


ADD_TRANS_ACTION SCAR
BEGIN 17 END
BEGIN 0 END
~AddexperienceParty(2000)~
UNLESS ~AddexperienceParty([0-9]+)~
