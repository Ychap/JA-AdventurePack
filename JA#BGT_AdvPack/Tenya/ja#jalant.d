ALTER_TRANS PUMBERL // file name
BEGIN 2 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~NoAction()~
END

ALTER_TRANS PUMBERL // file name
BEGIN 4 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~NoAction()~
END

ALTER_TRANS PUMBERL // file name
BEGIN 6 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JALAPPEAR","GLOBAL",1)
CreateCreature("JALANT",[459.531],3)
ActionOverride("Jalantha",Dialogue([PC]))~
END

ALTER_TRANS PUMBERL // file name
BEGIN 7 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("TENAPPEAR","GLOBAL",1)
CreateCreature("TENYA2",[536.648],3) // Tenya
ActionOverride("Tenya2",SetNumTimesTalkedTo(1))
ActionOverride("Tenya2",Dialogue([PC]))~
END


ALTER_TRANS JALANT // file name
BEGIN 11 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#UMBERL_HOST","%BaldursGateDocks_WaterQueensHouse%",1)
Enemy()~
END

ALTER_TRANS JALANT // file name
BEGIN 14 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "ACTION" ~SetGlobal("JA#UMBERL_HOST","%BaldursGateDocks_WaterQueensHouse%",1)
Enemy()~
END
