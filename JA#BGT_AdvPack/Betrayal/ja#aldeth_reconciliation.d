REPLACE_STATE_TRIGGER ALDETH 28 ~Global("HelpAldeth","GLOBAL",2)~ // BG1 Mini Quests and Encounters Mod does the same


ALTER_TRANS ALDETH
BEGIN 28 END
BEGIN 0 END
BEGIN
  "REPLY" ~@73~
END

EXTEND_BOTTOM ALDETH 28
  IF ~Global("Chapter","GLOBAL",%tutu_chapter_7%) Global("JA#CUDED","%SWBaldursGate_MerchantLeague_L2%",3)~ THEN REPLY @72 /* ~Ich gehe hier nicht so einfach weg. Ihr solltet mir besser einen guten Grund für Euren Verrat liefern – ich habe Euch oft geholfen und Ihr vergeltet es mir mit Verrat!~ */ GOTO versoehnung
  IF ~Global("Chapter","GLOBAL",%tutu_chapter_7%) Global("JA#CUDED","%SWBaldursGate_MerchantLeague_L2%",3)~ THEN REPLY @74 /* ~Ich habe es mir anders überlegt. Ihr werdet für Euren Verrat bezahlen!~ */ DO ~SetGlobal("JA#MGUAR","GLOBAL",1) Enemy()~ EXIT
END


APPEND ALDETH

IF WEIGHT #-1 ~Global("Chapter","GLOBAL",%tutu_chapter_7%) Global("JA#CUDED","%SWBaldursGate_MerchantLeague_L2%",2)~ THEN JA#ALDETH_36
  SAY @38
  IF ~~ THEN REPLY @39 DO ~SetGlobal("JA#CUDED","%SWBaldursGate_MerchantLeague_L2%",3)~ EXIT
  IF ~~ THEN REPLY @40 DO ~SetGlobal("JA#MGUAR","GLOBAL",1) Enemy()~ EXIT
  IF ~~ THEN REPLY @71 /* ~Dachtet Ihr, ich würde diese Sache auf sich beruhen lassen, Aldeth? Ihr solltet mir besser einen guten Grund für Eurer Verhalten liefern – ich habe Euch oft geholfen und Ihr vergeltet es mir mit Verrat!~ */ GOTO versoehnung
END

IF ~~ THEN versoehnung
  SAY @75 /* ~Bitte missversteht mich nicht, <CHARNAME> – ich habe nicht vergessen, was Ihr alles für mich getan habt und ich bin Euch sehr dankbar dafür... aber ich bin auch ein ehrbarer Mann und kann somit niemanden gewähren lassen, der einfach so ehrbare Geschäftsleute ermordet!~ */
    = @76 /* ~Ihr werdet sicher verstehen, dass ich nicht anders handeln konnte – sowohl der Ruf der Händlerliga als auch mein eigener stünden auf dem Spiel, wenn ich die Machenschaften von Mördern dulden würde...~ */
  IF ~!Dead("Rieltar")~ THEN REPLY @77 /* ~Ich habe Euch bereits gesagt, dass ich nichts mit den Morden in Kerzenburg zu tun habe! Es sollte nur so aussehen, dass ich es war!~ */ GOTO versoehnung_01
  IF ~!Dead("Rieltar")~ THEN REPLY @78 /* ~Nichts hätte ich lieber getan, als diese verbrecherischen Bastarde zu töten, aber ich hatte wirklich nichts damit zu tun. Diesen Mord hat jemand begangen, um mir etwas anzuhängen!~ */ GOTO versoehnung_01
  IF ~Dead("Rieltar")~ THEN REPLY @79 /* ~Ehrenhafte Leute? Der Eisenthron selbst steckt überhaupt hinter der Eisenkrise und verübt Verbrechen, ohne bestraft zu werden! Ihr solltet froh sein, dass ich diese Hunde getötet habe!~ */ GOTO versoehnung_05
  IF ~Dead("Rieltar")~ THEN REPLY @80 /* ~Das verstehe ich, aber es war kein Mord. Der Eisenthron steckt hinter der Eisenkrise, und ich bin ihnen zu ungemütlich geworden. Ich habe mein eigenes Leben verteidigt!~ */ GOTO versoehnung_05
  IF ~~ THEN REPLY @74 /* ~Ich habe es mir anders überlegt. Ihr werdet für Euren Verrat bezahlen!~ */ DO ~SetGlobal("JA#MGUAR","GLOBAL",1) Enemy()~ EXIT
END

IF ~~ THEN versoehnung_01
  SAY @81 /* ~Wie gerne würde ich Euch glauben, <CHARNAME>. Ihr könnt Euch sicher vorstellen, wie es für mich war, meine Freunde und Wohlltäter verraten zu müssen ... aber Ihr wurdet nunmal von vertrauenswürdigen Personen dabei gesehen, wie Ihr die Morde begangen habt und das kann ich nicht ignorieren!~ */
  IF ~~ THEN REPLY @82 /* ~Kam Euch nie in den Sinn, dass es sich um das Werk von Doppelgänger gehandelt haben könnte? Wie Ihr wisst, haben sie es zumindest teilweise geschafft, Euch zu unterwandern und Dinge getan, welche der Händlerliga schaden!~ */ GOTO versoehnung_02
  IF ~~ THEN REPLY @83 /* ~Aldeth, ich bin einer ganz großen Sache auf der Spur. Eure "vertrauenswürdigen Personen" sind nicht so vertrauenswürdig, wie Ihr meint. Ich habe Euch bereits mehrfach geholfen. Ihr müsst mir glauben!~ */ GOTO versoehnung_02
  IF ~~ THEN REPLY @84 /* ~Mit Euch zu reden ist reine Zeitverschwendung! Nun werdet Ihr für Euren Verrat sterben!~ */ DO ~SetGlobal("JA#MGUAR","GLOBAL",1) Enemy()~ EXIT
END

IF ~~ THEN versoehnung_02
  SAY @85 /* ~Ihr ... habt Recht, mit dem, was Ihr sagt, <CHARNAME>. Doch selbst, wenn ich Euch glauben sollte, wie wollt Ihr beweisen, dass die Tat offensichtlich verübt wurde, um Euch in Verruf zu bringen?~ */
  IF ~~ THEN REPLY @86 /* ~Ich konnte mehrere Doppelgänger in Kerzenburg töten, die viele Bekannte von mir ersetzt hatten, doch ich weiß nicht, ob die Kadaver nicht schon verbrannt wurden oder die Leichen der Opfer gefunden wurden...~ */ GOTO versoehnung_03
  IF ~~ THEN REPLY @87 /* ~Ich bin dabei, die Beweise gegen den Eisenthron zu sammeln. Deswegen war ich ja in Kerzenburg! Dort waren auch Doppelgänger, Aldeth. Es wimmelte nur so von ihnen!~ */ GOTO versoehnung_03
  IF ~~ THEN REPLY @84 /* ~Mit Euch zu reden ist reine Zeitverschwendung! Nun werdet Ihr für Euren Verrat sterben!~ */ DO ~SetGlobal("JA#MGUAR","GLOBAL",1) Enemy()~ EXIT
END

IF ~~ THEN versoehnung_03
  SAY @88 /* ~Das ... tut mir sehr leid. Ich denke, ich kann meine Kontakte nutzen, um herauszufinden, ob dort Leichen seltsamer Kreaturen oder vermisster Burgbewohner gefunden wurden...~ */
  IF ~~ THEN REPLY @89 /* ~Ich danke Euch, Aldeth. Dafür, dass Ihr Euch zumindest bemüht, mir zu glauben.~ */ GOTO versoehnung_04
  IF ~~ THEN REPLY @90 /* ~Wenn Ihr mir dann besser glauben könnt, dann tut das.~ */ GOTO versoehnung_04
  IF ~~ THEN REPLY @84 /* ~Mit Euch zu reden ist reine Zeitverschwendung! Nun werdet Ihr für Euren Verrat sterben!~ */ DO ~SetGlobal("JA#MGUAR","GLOBAL",1) Enemy()~ EXIT
END

IF ~~ THEN versoehnung_04
  SAY @91 /* ~Das ist das mindeste, was ich nach den Ereignissen in der letzten Zeit tun kann. Eigentlich kam es mir selbst schon seltsam vor, dass Ihr so etwas Leichtsinniges tun solltet – der Eisenthron hat sehr viel Macht. Und das würde erklären, dass Ihr Euch nach Baldurs Tor wagt, obwohl Ihr von der Flammenden Faust gesucht werdet.~ */
    = @92 /* ~Mir ist klar, dass Ihr Euch nun auf die Suche nach dem Verursacher für Eure Misere machen werdet. Leider kann ich nicht viel für Euch tun, um Euch zu helfen. Passt Auf Euch auf, meine Freunde ... ich habe Euch hier nie gesehen.~ */
  IF ~~ THEN GOTO versoehnung_09
END

IF ~~ THEN versoehnung_05
  SAY @93 /* ~Es ranken sich in der Tat viele Gerüchte über dunkle Machenschaften innerhalb des Eisenthrons ... doch Behauptungen wie Eure rechtfertigen – selbst, wenn sie war sind -  keinen kaltblütigen Mord! Und schon gar nicht an hochangesehenen Leuten! Gerechtigkeit ist Sache der Großherzöge und der Flammenden Faust.~ */
  IF ~~ THEN REPLY @94 /* ~Ihr wisst selbst, wieviel Macht der Eisenthron hat. Ihr habt Recht, mit dem, was Ihr sagt, aber das Gesetz sieht nicht in jeden dunklen Winkel – vor allem nicht, wenn genug klingende Münze in die richtigen Taschen fließt oder die richtigen Stellen passend besetzt werden.~ */ GOTO versoehnung_06
  IF ~~ THEN REPLY @95 /* ~Aldeth, nochmal - ich habe die Anführer des Eisenthrons getötet, aber es war kein *Mord*! Streng genommen haben sie mich zuerst angegriffen. Genauso, wie sie andere aus dem Weg geräumt haben, die ihnen lästig waren.~ */ GOTO versoehnung_07
  IF ~~ THEN REPLY @96 /* ~Ich sehe, dass es nichts bringt, Euch überzeugen zu wollen. Ich bin mit Euch fertig, Ihr Verräter. Solltet Ihr je wieder Hilfe brauchen, seid Ihr auf Euch gestellt!~ */ DO ~SetGlobal("JA#CUDED","%SWBaldursGate_MerchantLeague_L2%",3)~ EXIT
  IF ~~ THEN REPLY @97 /* ~Genug von Euren Ausflüchten! Für Euren Verrat werdet Ihr sterben!~ */ DO ~SetGlobal("JA#MGUAR","GLOBAL",1) Enemy()~ EXIT
END

IF ~~ THEN versoehnung_06
  SAY @98 /* ~Ihr... habt leider Recht, mit dem was Ihr sagt. Ich habe mich immer für einen seriösen Ruf der Händlerliga eingesetzt, aber ich kenne die Methoden einiger Handelshäuser, um sich Vorteile zu sichern.~ */
  IF ~~ THEN REPLY @99 /* ~Was ich tat, mag wohl für viele als Mord gelten, doch wieviele sind durch die angeheuerten Räuberbanden umgekommen – oder bei der Zwangsarbeit in der Mantelwaldmine? Ganz zu schweigen von den ermordeten Bergleuten in den Minen von Nashkel ... Durch die Habgier dieser Leute droht uns nun der Krieg mit Amn!~ */ GOTO versoehnung_07
  IF ~~ THEN REPLY @100 /* ~Der Eisenthron ist noch schlimmer, glaubt mir. Und es ist noch nicht vorbei!~ */ GOTO versoehnung_07
END

IF ~~ THEN versoehnung_07
  SAY @101 /* ~Ich gebe zu ... das würde in der Tat zu vielen Gerüchten passen, die mir bereits zu Ohren gekommen sind. Das alles und die beseitigung von Konkurrenten wie der Händlerliga würden dem Thron sicher eine größere Vormachtstellung geben...~ */
    = @102 /* ~Ihr habt viel für mich getan, meine Freunde. Ich sollte Euch mittlerweile besser kennen, um zu wissen, dass Ihr nicht einfach so Unschuldige ermordet und dann solche Geschichten erfindet. Nicht nach allem, was ich mit Euch erlebt habe!~ */
  IF ~~ THEN REPLY @103 /* ~Ich danke Euch, Aldeth. Ich bin froh, dass Ihr meine Gründe versteht – auch ich bedauere, dass es soweit gekommen ist. Doch noch ist es nicht vorbei. Der eigentliche Drahtzieher spinnt weiterhin seine Intrigen!~ */ GOTO versoehnung_08
  IF ~~ THEN REPLY @104 /* ~Das beruhigt mich. Ich hätte Euch ungern bekämpfen müssen.~ */ GOTO versoehnung_08
  IF ~~ THEN REPLY @105 /* ~Na endlich.~ */ GOTO versoehnung_08
  IF ~~ THEN REPLY @106 /* ~Das heißt aber nicht, dass ich Euch nicht für Euren Verrat bezahlen lasse! Zieht Eure Klinge und verteidigt Euch!~ */ DO ~SetGlobal("JA#MGUAR","GLOBAL",1) Enemy()~ EXIT
END

IF ~~ THEN versoehnung_08
  SAY @107 /* ~Ich verstehe. Obwohl ich Euren Weg wirklich nicht gutheiße, fürchte ich, dass Ihr den richtigen geht. Leider kann ich Euch nur damit helfen, dass niemand erfährt, dass Ihr hier wart.~ */
  IF ~~ THEN GOTO versoehnung_09
END

IF ~~ THEN versoehnung_09
  SAY @108 /* ~Hier, nehmt wenigstens diese Tränke als geringe Entschädigung für das, was Ihr durchmachen musstet.~ */
  IF ~~ THEN DO ~SetGlobal("JA#CUDED","%SWBaldursGate_MerchantLeague_L2%",4) GiveItemCreate("POTN52",Player1,6,0,0) GiveItemCreate("POTN10",Player1,3,0,0)~ EXIT
END

END // APPEND ALDETH
