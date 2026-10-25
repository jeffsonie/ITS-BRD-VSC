-Analyse:

Anw01: ldr R0, =VariableA
R0 wird mit der Speicheradresse von VariableA geladen.

Anw02: ldrb R2, [R0]
Lädt ein Byte von der Speicheradresse, die in R0 steht, in R2. Ergebnis: 0xEF.

Anw03: ldrb R3, [R0,#1]
Lädt das nächste Byte von der Adresse R0 + 1 in R3. Ergebnis: 0xBE.

Anw04: lsl R2, #8
Verschiebt den Wert in R2 (0xEF) um 8 Bits nach links. Ergebnis: 0xEF00.

Anw05: orr R2, R3
Verknüpft R2 (0xEF00) und R3 (0xBE) mit ODER. Ergebnis in R2: 0xEFBE.

Anw06: strh R2, [R0]
Speichert 16 Bit aus R2 (0xEFBE) an die Speicheradresse von R0. Durch Little Endian steht das niederwertige Byte zuerst.

Ergebnis im Speicher: BE EF.


-Erweiterung für (AFFE):

VariableC: DCW 0xFFFF
Neue Variable mit 16 Bit angelegt.

STRH R5, [R0]
Speichert den Wert 0xAFFE in VariableC.

LDRB R8, [R0] und LDRB R9, [R0,#1]
Lädt die beiden Bytes einzeln in R8 und R9.

LSL R8, #8
Verschiebt den Wert in R8 um 8 Bits nach links.

ORR R8, R9
Fasst die beiden Bytes mit ODER zusammen.

STRH R8, [R0]
Speichert den neuen Wert in VariableC.

Ergebnis im Speicher: AF FE.


-Änderung für (1234):

Anw09–Anw0D:
Der Wert von R7 wurde auf 0x21DE geändert.

ADD R6, R6, R7
Addiert 0x1234 und 0x21DE. Ergebnis: 0x3412.

STRH R6, [R1]
Speichert den Wert 0x3412 in VariableB.

Ergebnis im Speicher: 12 34.


-Überprüfung:

Alle drei Variablen mit dem Debugger überprüft. Die Speicherwerte stimmen mit der Aufgabe überein.