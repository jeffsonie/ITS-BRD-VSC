;************************************************
;* Beginn der globalen Daten *
;************************************************
                   AREA MyData, DATA, align = 2
Base
VariableA          DCW 0x1234
VariableB          DCW 0x4711

VariableC          DCD  0

MeinHalbwortFeld   DCW 0x22 , 0x3e , -52, 78 , 0x27 , 0x45

MeinWortFeld       DCD 0x12345678 , 0x9dca5986
                   DCD -872415232 , 1308622848
                   DCD 0x27000000
                   DCD 0x45000000

MeinTextFeld       DCB "ABab0123",0

                   EXPORT VariableA
                   EXPORT VariableB
                   EXPORT VariableC
                   EXPORT MeinHalbwortFeld
                   EXPORT MeinWortFeld
                   EXPORT MeinTextFeld

;***********************************************
;* Beginn des Programms *
;************************************************
    AREA |.text|, CODE, READONLY, ALIGN = 3
; ----- S t a r t des Hauptprogramms -----
                EXPORT main
                EXTERN initITSboard
main            PROC
                bl    initITSboard                 ; HW Initialisieren

; Laden von Konstanten in Register
                mov   r0,#0x12                      ; Anw-01 Speicher mit Wert 0x12 in Register r0 laden
                mov   r1,#-128                      ; Anw-02 Speicher mit Wert -128 in Register r1 laden
                ldr   r2,=0x12345678                ; Anw-03 Speicher mit Wert 0x12345678 in Register r2 laden

; Zugriff auf Variable
                ldr   r0,=VariableA                 ; Anw-04 VariableA in Register r0 laden
                ldrh  r1,[r0]                       ; Anw-05 VariableA aus Speicher in Register r1 laden
                ldr   r2,[r0]                       ; Anw-06 VariableA aus Speicher in Register r2 laden
                str   r2,[r0,#VariableC-VariableA]  ; Anw-07 VariableC mit Wert von VariableA beschreiben

; Zugriff auf Felder (Speicherzellen)
                ldr   r0,=MeinHalbwortFeld          ; Anw-08 speicheradresse von MeinHalbwortFeld in Register r0 laden
                ldrh  r1,[r0]                       ; Anw-09 speicherzelle 0 von MeinHalbwortFeld in Register r1 laden
                ldrh  r2,[r0,#2]                    ; Anw-10 speicherzelle 1 von MeinHalbwortFeld in Register r2 laden
                mov   r3,#10                        ; Anw-11 konstante Wert 10 in Register r3 laden
                ldrh  r4,[r0,r3]                    ; Anw-12 speicherzelle 10 von MeinHalbwortFeld in Register r4 laden

                ldrh  r5,[r0,#2]!                   ; Anw-13 speicherzelle 2 von MeinHalbwortFeld in Register r5 laden

                ldrh  r6,[r0,#2]!                   ; Anw-14 speicherzelle 3 von MeinHalbwortFeld in Register r6 laden
                strh  r6,[r0,#2]!                   ; Anw-15 speicherzelle 4 von MeinHalbwortFeld mit Wert von Register r6 beschreiben

; Addition und Subtraktion von unsigned / signed Integer-Werten
                ldr  r0,=MeinWortFeld               ; Anw-16 speicheradresse von MeinWortFeld in Register r0 laden
                ldr  r1,[r0]                        ; Anw-17 speicherzelle 0 von MeinWortFeld in Register r1 laden
                ldr  r2,[r0,#4]                     ; Anw-18 speicherzelle 1 von MeinWortFeld in Register r2 laden
                adds r3,r1,r2                       ; Anw-19

                ldr  r4,[r0,#8]                     ; Anw-20 speicherzelle 2 von MeinWortFeld in Register r4 laden
                ldr  r5,[r0,#12]                    ; Anw-21 speicherzelle 3 von MeinWortFeld in Register r5 laden
                subs r6,r4,r5                       ; Anw-22

                ldr  r7,[r0,#16]                    ; Anw-23 speicherzelle 4 von MeinWortFeld in Register r7 laden
                ldr  r8,[r0,#20]                    ; Anw-24 speicherzelle 5 von MeinWortFeld in Register r8 laden
                subs r9,r7,r8                       ; Anw-25 subtraktion von unsigned Integer-Werten

forever         b   forever                         ; Anw-26 schleife zum Programmende
                ENDP
                END