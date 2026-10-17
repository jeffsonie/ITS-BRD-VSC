-Aufgabe A1: Assemblerprogramm kompilieren und mit dem Debugger durchgehen. Dabei die LED-Zustände und Kommentare überprüfen.

-Untersuchung: Die LED-Zustände entsprachen den Kommentaren.


-Optimierung: Das Programm soll so geändert werden, dass nur der Endzustand erhalten bleibt. In diesem Fall sollen D08 und D09 an bleiben und D14 und D15 aus sein.


-Durchführung: Die überflüssigen Zeilen wurden mit ; auskommentiert, damit die LEDs nicht unnötig ein und ausgeschaltet werden.


-Ergebnis: Das Programm wurde erneut mit dem Debugger getestet. Die LEDs D08 und D09 bleiben an und es gab keine weiteren Fehler im Quellcode. 


-Überprüfung: D08 und D09 kann man mit einem Befehl einschalten. Aus MOV R0, #0x01 MOV R1, #0x02 wird MOV R0, #0x03, damit fassen wir beide Bitmasken zusammen.Mit STRB R0, [R6] wird der Wert an die Speicheradresse geschrieben, die in R6 steht, wodurch beide LEDs eingeschaltet werden.
