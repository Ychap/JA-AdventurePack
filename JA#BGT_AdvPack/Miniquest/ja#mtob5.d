ADD_STATE_TRIGGER MTOB5 1 ~GlobalLT("JA#ELFSONG_QUEST","GLOBAL",9)~
ADD_STATE_TRIGGER MTOB5 3 ~GlobalLT("JA#ELFSONG_QUEST","GLOBAL",9)~


EXTEND_BOTTOM MTOB5 1
  IF ~Global("JA#ELFSONG_QUEST","GLOBAL",0)~ THEN DO ~SetGlobal("JA#ELFSONG_QUEST","GLOBAL",1)~ JOURNAL @1031 EXIT
END
