;******************** (C) COPYRIGHT HAW-Hamburg ********************************
;* File Name          : main.s
;* Author             : Arash Ghaboos   
;* Version            : V1.0
;* Date               : 25.10.2026
;* Description        : This is a simple main to demonstrate data transfer
;                     : and manipulation.
;                     : 
;
;*******************************************************************************
    EXTERN initITSboard ; Helper to organize the setup of the board

    EXPORT main         ; we need this for the linker - In this context it set the entry point,too

ConstByteA  EQU 0xaffe
    
;* We need some data to work on
    AREA DATA, DATA, align=2    
VariableA   DCW 0xbeef
VariableB   DCW 0x1234
VariableC   DCW 0xFFFF         ; Neue Variable für neue aufgabe 

;* We need minimal memory setup of InRootSection placed in Code Section 
    AREA  |.text|, CODE, READONLY, ALIGN = 3    
    ALIGN   
main
    BL initITSboard             ; needed by the board to setup
;* swap memory - Is there another, at least optimized approach?
    ldr     R0,=VariableA   ; Anw01
    ldrb    R2,[R0]         ; Anw02
    ldrb    R3,[R0,#1]      ; Anw03
    lsl     R2, #8          ; Anw04
    orr     R2, R3          ; Anw05
    strh    R2,[R0]         ; Anw06 
    
;* const in var
    mov     R5,#ConstByteA  ; Anw07
    strh    R5,[R0]         ; Anw08

;* Erweiterung
    ldr     R0,=VariableC   ; Lade Adresse von VariableC in R0
    strh    R5,[R0]         ; speichere den Wert von R5 (ConstByteA) in VariableC als halbwort
    ldrb    R8,[R0]         ; Lade das niederwertige Byte von VariableC in R8
    ldrb    R9,[R0,#1]      ; Lade das höherwertige Byte von VariableC in R9
    lsl     R8, #8          ; Verschiebe das niederwertige Byte um 8 Positionen nach links
    orr     R8, R9          ; Kombiniere die beiden Bytes zu einem 16-Bit-Wert in R8
    strh    R8,[R0]         ; Speichere den kombinierten Wert zurück in VariableC

;* Change memory to x4321
    ldr     R1,=VariableB   ; Anw09
    ldrh    R6,[R1]         ; Anw0A
    mov     R7, #0x21DE     ; Anw0B
    add     R6, R6, R7      ; Anw0C
    strh    R6,[R1]         ; Anw0D
    b .                     ; Anw0E
    
    ALIGN
    END