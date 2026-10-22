section .data

title db 10,"=======================================",10
      db "       THE MYSTIC ZODIAC ORACLE",10
      db "=======================================",10
title_len equ $-title

name_prompt db "Enter your name: "
name_prompt_len equ $-name_prompt

month_prompt db "Enter birth month (1-12): "
month_prompt_len equ $-month_prompt

day_prompt db "Enter birth day: "
day_prompt_len equ $-day_prompt

welcome db 10,"Welcome, "
welcome_len equ $-welcome

invalid db 10,"INVALID INPUT!",10
invalid_len equ $-invalid

header db 10,"=======================================",10
       db "          YOUR ZODIAC SIGN",10
       db "=======================================",10
header_len equ $-header

newline db 10

; Zodiac names

cap_name db "CAPRICORN",10
cap_name_len equ $-cap_name

aq_name db "AQUARIUS",10
aq_name_len equ $-aq_name

pis_name db "PISCES",10
pis_name_len equ $-pis_name

ari_name db "ARIES",10
ari_name_len equ $-ari_name

tau_name db "TAURUS",10
tau_name_len equ $-tau_name

gem_name db "GEMINI",10
gem_name_len equ $-gem_name

can_name db "CANCER",10
can_name_len equ $-can_name

leo_name db "LEO",10
leo_name_len equ $-leo_name

vir_name db "VIRGO",10
vir_name_len equ $-vir_name

lib_name db "LIBRA",10
lib_name_len equ $-lib_name

sco_name db "SCORPIO",10
sco_name_len equ $-sco_name

sag_name db "SAGITTARIUS",10
sag_name_len equ $-sag_name

; ASCII ART

capricorn_art db "     _ \/_) ",10
              db "    \/`.",10
              db "     \/ ;",10
              db "     \/ __.",10
capricorn_art_len equ $-capricorn_art

aquarius_art db "    .-""-. _.",10
             db "   -""-. _. -",10
             db "    `-. .-'",10
aquarius_art_len equ $-aquarius_art

pisces_art db "    : : --:--",10
           db "    : : .-'",10
           db "     `-.",10
pisces_art_len equ $-pisces_art

aries_art db "    .-.   .-.",10
          db "   (_  \ /  _)",10
          db "       | |",10
aries_art_len equ $-aries_art

taurus_art db "    . . '.",10
           db "   . ' `:.",10
           db "  : : : : `.",10
           db "     ___.",10
taurus_art_len equ $-taurus_art

gemini_art db "    ._____.",10
           db "       | |",10
           db "       | |",10
           db "     _|_|_",10
gemini_art_len equ $-gemini_art

cancer_art db "      .--.",10
           db "     / _`.",10
           db "    (_) ()",10
           db "   '. / `--'",10
cancer_art_len equ $-cancer_art

leo_art db "    /\_/\ ",10
        db "   ( o.o )",10
        db "    > ^ <",10
leo_art_len equ $-leo_art

virgo_art db "    _ ' `:--.",10
          db "   --.  | |",10
          db "   |_   | |",10
          db "     | ) | |",10
virgo_art_len equ $-virgo_art

libra_art db "    __ ___.",10
          db "   ' '. ___",10
          db "   _________",10
libra_art_len equ $-libra_art

scorpio_art db "    _ ' `:--.",10
            db "   --.  | |",10
            db "   |_   | |",10
            db "     |  | |",10
            db "   ..,`---",10
scorpio_art_len equ $-scorpio_art

sagittarius_art db "   '`: ... .'",10
               db "   : . ' `..",10
               db "   ' . ' `..",10
               db "      _ \/_) ",10
sagittarius_art_len equ $-sagittarius_art

section .bss

name resb 100
month_buf resb 10
day_buf resb 10

month resd 1
day resd 1

section .text
global _start

_start:

    mov ecx,title
    mov edx,title_len
    call printString

    mov ecx,name_prompt
    mov edx,name_prompt_len
    call printString

    mov ecx,name
    mov edx,100
    call readString

    mov ecx,month_prompt
    mov edx,month_prompt_len
    call printString

    mov ecx,month_buf
    mov edx,10
    call readString

    mov ecx,month_buf
    call textToNum
    mov [month],eax

    mov ecx,day_prompt
    mov edx,day_prompt_len
    call printString

    mov ecx,day_buf
    mov edx,10
    call readString

    mov ecx,day_buf
    call textToNum
    mov [day],eax

    call validateDate

    mov ecx,welcome
    mov edx,welcome_len
    call printString

    mov ecx,name
    mov edx,100
    call printString

    mov ecx,header
    mov edx,header_len
    call printString

    call findZodiac

    mov eax,1
    xor ebx,ebx
    int 0x80

; -------------------------
; string -> integer
; -------------------------

textToNum:

    xor eax,eax

.next:
    mov bl,[ecx]

    cmp bl,10
    je .done

    cmp bl,13
    je .done

    cmp bl,0
    je .done

    sub bl,'0'

    imul eax,eax,10
    add eax,ebx

    inc ecx
    jmp .next

.done:
    ret

; -------------------------
; validation
; -------------------------

validateDate:

    mov eax,[month]

    cmp eax,1
    jl inputError

    cmp eax,12
    jg inputError

    mov ebx,[day]

    cmp ebx,1
    jl inputError

    cmp ebx,31
    jg inputError

    cmp eax,2
    je febCheck

    cmp eax,4
    je day30

    cmp eax,6
    je day30

    cmp eax,9
    je day30

    cmp eax,11
    je day30

    ret

febCheck:
    cmp ebx,28
    jg inputError
    ret

day30:
    cmp ebx,30
    jg inputError
    ret

inputError:
    mov ecx,invalid
    mov edx,invalid_len
    call printString

    mov eax,1
    mov ebx,1
    int 0x80

; -------------------------
; zodiac finder
; -------------------------

findZodiac:

    mov eax,[month]
    imul eax,100
    add eax,[day]

    cmp eax,119
    jle Capricorn

    cmp eax,1222
    jge Capricorn

    cmp eax,218
    jle Aquarius

    cmp eax,320
    jle Pisces

    cmp eax,419
    jle Aries

    cmp eax,520
    jle Taurus

    cmp eax,620
    jle Gemini

    cmp eax,722
    jle Cancer

    cmp eax,822
    jle Leo

    cmp eax,922
    jle Virgo

    cmp eax,1022
    jle Libra

    cmp eax,1121
    jle Scorpio

    jmp Sagittarius

Capricorn:
    mov ecx,cap_name
    mov edx,cap_name_len
    call printString
    mov ecx,capricorn_art
    mov edx,capricorn_art_len
    call printString
    ret

Aquarius:
    mov ecx,aq_name
    mov edx,aq_name_len
    call printString
    mov ecx,aquarius_art
    mov edx,aquarius_art_len
    call printString
    ret

Pisces:
    mov ecx,pis_name
    mov edx,pis_name_len
    call printString
    mov ecx,pisces_art
    mov edx,pisces_art_len
    call printString
    ret

Aries:
    mov ecx,ari_name
    mov edx,ari_name_len
    call printString
    mov ecx,aries_art
    mov edx,aries_art_len
    call printString
    ret

Taurus:
    mov ecx,tau_name
    mov edx,tau_name_len
    call printString
    mov ecx,taurus_art
    mov edx,taurus_art_len
    call printString
    ret

Gemini:
    mov ecx,gem_name
    mov edx,gem_name_len
    call printString
    mov ecx,gemini_art
    mov edx,gemini_art_len
    call printString
    ret

Cancer:
    mov ecx,can_name
    mov edx,can_name_len
    call printString
    mov ecx,cancer_art
    mov edx,cancer_art_len
    call printString
    ret

Leo:
    mov ecx,leo_name
    mov edx,leo_name_len
    call printString
    mov ecx,leo_art
    mov edx,leo_art_len
    call printString
    ret

Virgo:
    mov ecx,vir_name
    mov edx,vir_name_len
    call printString
    mov ecx,virgo_art
    mov edx,virgo_art_len
    call printString
    ret

Libra:
    mov ecx,lib_name
    mov edx,lib_name_len
    call printString
    mov ecx,libra_art
    mov edx,libra_art_len
    call printString
    ret

Scorpio:
    mov ecx,sco_name
    mov edx,sco_name_len
    call printString
    mov ecx,scorpio_art
    mov edx,scorpio_art_len
    call printString
    ret

Sagittarius:
    mov ecx,sag_name
    mov edx,sag_name_len
    call printString
    mov ecx,sagittarius_art
    mov edx,sagittarius_art_len
    call printString
    ret

; -------------------------
; output routine
; -------------------------

printString:
    mov eax,4
    mov ebx,1
    int 0x80
    ret

readString:
    mov eax,3
    mov ebx,0
    int 0x80
    ret