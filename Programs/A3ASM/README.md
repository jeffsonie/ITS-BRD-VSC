1. Untersuchungen:

1. Bei Anw-10 wurde testweise der Offset von #2 auf #4 geändert.

Ergebnis: Es wurde nicht mehr das zweite Element 0x003E geladen, sondern das dritte Halbwort 0xFFCC. Dadurch wurde klar, dass bei DCW jedes Element 2 Byte groß ist.

2. Bei Anw-13 wurde testweise das Ausrufezeichen entfernt: ldrh r5,[r0,#2]

Ergebnis: R5 wurde weiterhin mit 0x003E geladen, aber R0 wurde nicht auf 0x20000016 erhöht. Das ! bewirkt, dass die neue Adresse in R0 zurückgeschrieben wird.

3. Bei Anw-19 wurde untersucht, dass ADDS im Gegensatz zu ADD die Statusflags aktualisiert.

Ergebnis: Nach der Addition wurde das N-Flag gesetzt, weil das Ergebnis im höchsten Bit eine 1 hat.
