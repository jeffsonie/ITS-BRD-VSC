1. Frage: Stimmen die Kommtare im Code (main.s)?

1. Durchführung/Rechnung:Ich bin das Programm mit dem Debugger Schritt für Schritt durchgegangen. Dabei habe ich mir die Werte in dem Registern angeschaut und mit dem ITS_Board abgeglichen(Welche LEDs Leuchten). Zur Kontrolle habe ich die Hex-Werte aus dem Code in Binär umgerechnet und mit den Kommentaren verglichen. Dabei sind mir 2 Zeilen bzw. Kommentare aufgefallen. load mask 0b0100  und load mask 0b1000,den Begriff mask kannte ich nicht, aber die Binärzahl konnte ich in Dezimal umrechnen, und das wäre 4 und 8, aber die Hex Zahlen 0x40 & 0x80 sagen 64 und 128. daher denke ich das die komentare falsch sind.

1. Lösung: Zwei Kommentare sind Falsch, Bei R2 und R3 wurden die letzen vier Nullen ( 4 Bit) weg gelassen. 

Bei R2 0x40 = 0b0100 0000 (64). In komentar steht aber 0b0100 (4)

Bei R3 0x80 = 0b1000 0000 (128). In Komentar steht aber 0b1000 (8)


2. Frage: Was ist der Endzustand der LEDs?

2. Druchführung: Das programm wurde mit dem Debugger schritt für schritt abgespielt. Dabei gehen mehrere LEDs auf dem ITS_Boad an und wieder aus. und zum schluss bleiben nur 2 LEDs an und zwar D8 & D9. 

2. Lösung: D8 & D9 leuchten und das ist der entzustand der LEDs. D14 und D15 wurden zwischendurch eingeschaltet, aber am ende wieder ausgeschaltet. 


3. Wie Optimieren ich den Quelltext, so dass nur der Endzustand der LEDs angezeigt wird?

3. Duchführung: Der Entzustand war, dass D8 & D9 leuchten. Da beide LEDS gleichzeitug angeschaltet werden können, wurden alle zwischen Befehle ausgeklammert und damit nur noch D8 & D9 eingeschaltet sind. Mit dem Debugger schritt für schirtt durchgegangen und getestet bis nur noch D8 und D9 eingeschaltet blieben.

3. Lösung: Die Zeilen ausklammern die D14 und D15 ansteuern und so wie die Zeile für D08 die zwischenzeitlich ausgeschaltet wurde. 


4. Wie fasse ich den Befehl zusammen, damit D8 & D9 zusammen angehen um den Endzustand der LEDs anzuzeigen? 

4. Druchführung: Ich habe die Register angeschaut und die anderen MOV/STRB Befehle ausgekammert. Dann habe ich den Wert von R0/R1.. jeweils einzel verändert (#0x01/#0x02/#0x03/#0x40..) und dann mit dem Debugger schritt für schritt einzeln abgespielt und das ITS_Board Beobahtet wie die LEDs leuchten. 
Dabei ist mir aufgefallen, dass die LEDs in bits angesteuert werden, und man mit einem register mehrere LEDs ansteuern kann. Um den entzustand zu erreichen muss ich einem Register in dem fall R0 den richtigen Hex Zahl geben, so dass beide LEDs leuchten.


4. Lösung: Register 0 den Hex 0x03 = 0000 0011 zuweisen. Der Register spricht D8 und D9 gleichzeitig an, so erreicht man den entzustand.  MOV R0, #0x03 und STRB R0, [R6] 