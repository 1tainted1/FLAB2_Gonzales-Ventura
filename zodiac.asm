section .data
    title_art db 10, "=======================================", 10
              db "       THE MYSTIC ZODIAC ORACLE", 10
              db "=======================================", 10
              db "                  *", 10
              db "                 ***", 10
              db "                *****", 10
              db "               *******", 10
              db "              *********", 10
              db "                 | |", 10
              db "                 | |", 10
              db "               ========", 10
              db "          DISCOVER YOUR DESTINY!", 10
              db "=======================================", 10, 10
    title_art_len equ $ - title_art

    zodiac_header db 10, "=======================================", 10
                  db "          YOUR ZODIAC SIGN", 10
                  db "=======================================", 10
    zodiac_header_len equ $ - zodiac_header

    name_prompt db "Enter your name: "
    name_prompt_len equ $ - name_prompt

    month_prompt db "Enter birth month (1-12): "
    month_prompt_len equ $ - month_prompt

    day_prompt db "Enter birth day (1-31): "
    day_prompt_len equ $ - day_prompt

    welcome_msg db "Welcome, "
    welcome_msg_len equ $ - welcome_msg

    invalid_date db 10, "ERROR: Invalid date or month.", 10
    invalid_date_len equ $ - invalid_date

    menu_art db 10, "=======================================", 10
             db "             HOROSCOPE MENU", 10
             db "=======================================", 10
             db "[1] Love and Relationships", 10
             db "[2] Career and Studies", 10
             db "[3] Health and Wellness", 10
             db "[4] Lucky Number and Color", 10
             db "[5] View Zodiac Information", 10
             db "[6] Exit", 10
             db "=======================================", 10
             db "Enter your choice: "
    menu_art_len equ $ - menu_art

    try_again_prompt db 10, "Return to menu? (Y/N): "
    try_again_len equ $ - try_again_prompt

    invalid_choice db 10, "Invalid selection. Returning to menu.", 10
    invalid_choice_len equ $ - invalid_choice

    cap_name db 10, "Zodiac Sign: CAPRICORN", 10, "Element: EARTH", 10, "Symbol: Goat", 10, "Personality: Ambitious, disciplined, patient.", 10
    cap_name_len equ $ - cap_name
    cap_art db "   /\_/\ ", 10, "  ( o.o )", 10, "   > ^ <  (Goat)", 10
    cap_art_len equ $ - cap_art

    aq_name db 10, "Zodiac Sign: AQUARIUS", 10, "Element: AIR", 10, "Symbol: Water Bearer", 10, "Personality: Independent, inventive, humanitarian.", 10
    aq_name_len equ $ - aq_name
    aq_art db "  ~~~~~ ", 10, "  ~~~~~ ", 10, "  ~~~~~ (Waves)", 10
    aq_art_len equ $ - aq_art

    pis_name db 10, "Zodiac Sign: PISCES", 10, "Element: WATER", 10, "Symbol: Fish", 10, "Personality: Compassionate, artistic, intuitive.", 10
    pis_name_len equ $ - pis_name
    pis_art db "  <`)))>< ", 10, "  <`)))>< (Fish)", 10
    pis_art_len equ $ - pis_art

    ari_name db 10, "Zodiac Sign: ARIES", 10, "Element: FIRE", 10, "Symbol: Ram", 10, "Personality: Courageous, determined, confident.", 10
    ari_name_len equ $ - ari_name
    ari_art db "   (\\_/) ", 10, "   (o.o)  ", 10, "   (> <)  (Ram)", 10
    ari_art_len equ $ - ari_art

    tau_name db 10, "Zodiac Sign: TAURUS", 10, "Element: EARTH", 10, "Symbol: Bull", 10, "Personality: Reliable, patient, practical.", 10
    tau_name_len equ $ - tau_name
    tau_art db "   (__)   ", 10, "   (oo)   ", 10, "  /-||-\\  (Bull)", 10
    tau_art_len equ $ - tau_art

    gem_name db 10, "Zodiac Sign: GEMINI", 10, "Element: AIR", 10, "Symbol: Twins", 10, "Personality: Gentle, affectionate, curious.", 10
    gem_name_len equ $ - gem_name
    gem_art db "   (o|o)  ", 10, "   ( | )  ", 10, "   (o|o)  (Twins)", 10
    gem_art_len equ $ - gem_art

    can_name db 10, "Zodiac Sign: CANCER", 10, "Element: WATER", 10, "Symbol: Crab", 10, "Personality: Tenacious, highly imaginative, loyal.", 10
    can_name_len equ $ - can_name
    can_art db "  (\/)    ", 10, "  (..)    ", 10, "  (__)    (Crab)", 10
    can_art_len equ $ - can_art

    leo_name db 10, "Zodiac Sign: LEO", 10, "Element: FIRE", 10, "Symbol: Lion", 10, "Personality: Confident, creative, courageous.", 10
    leo_name_len equ $ - leo_name
    leo_art db "   /\_/\ ", 10, "  ( o.o )", 10, "   > ^ <  (Lion)", 10
    leo_art_len equ $ - leo_art

    vir_name db 10, "Zodiac Sign: VIRGO", 10, "Element: EARTH", 10, "Symbol: Maiden", 10, "Personality: Analytical, practical, systematic.", 10
    vir_name_len equ $ - vir_name
    vir_art db "   _@_@_ ", 10, "  (  .  )", 10, "   `---'  (Maiden)", 10
    vir_art_len equ $ - vir_art

    lib_name db 10, "Zodiac Sign: LIBRA", 10, "Element: AIR", 10, "Symbol: Scales", 10, "Personality: Diplomatic, gracious, fair-minded.", 10
    lib_name_len equ $ - lib_name
    lib_art db "  _/ \_  ", 10, "  \___/  ", 10, "  |   |  (Scales)", 10
    lib_art_len equ $ - lib_art

    sco_name db 10, "Zodiac Sign: SCORPIO", 10, "Element: WATER", 10, "Symbol: Scorpion", 10, "Personality: Resourceful, brave, passionate.", 10
    sco_name_len equ $ - sco_name
    sco_art db "  /\/\/\ ", 10, "  \o o/  ", 10, "   > ^ <  (Scorpion)", 10
    sco_art_len equ $ - sco_art

    sag_name db 10, "Zodiac Sign: SAGITTARIUS", 10, "Element: FIRE", 10, "Symbol: Archer", 10, "Personality: Generous, idealistic, great sense of humor.", 10
    sag_name_len equ $ - sag_name
    sag_art db "    /->   ", 10, "   /  \   ", 10, "  /    \  (Archer)", 10
    sag_art_len equ $ - sag_art

    pred_love db 10, "LOVE HOROSCOPE:", 10, "A sudden spark will ignite an old connection.", 10, "Keep your heart open to unexpected surprises!", 10
    pred_love_len equ $ - pred_love

    pred_career db 10, "CAREER HOROSCOPE:", 10, "Your creativity will help you solve a difficult problem today.", 10, "Stay focused and confident!", 10
    pred_career_len equ $ - pred_career

    pred_health db 10, "HEALTH HOROSCOPE:", 10, "Your energy levels are high. Good time to start a new routine.", 10, "Remember to hydrate and rest well.", 10
    pred_health_len equ $ - pred_health

    pred_lucky db 10, "LUCKY NUMBER AND COLOR:", 10, "Lucky Number: 7", 10, "Lucky Color: Royal Blue", 10
    pred_lucky_len equ $ - pred_lucky

section .bss
    name_buf resb 100
    month_buf resb 10
    day_buf resb 10
    choice_buf resb 10
    try_buf resb 10

    month resd 1
    day resd 1
    zodiac_id resd 1

section .text
    global _start

_start:
    mov ecx, title_art
    mov edx, title_art_len
    call printString

    mov ecx, name_prompt
    mov edx, name_prompt_len
    call printString
    mov ecx, name_buf
    mov edx, 100
    call readString

    mov ecx, month_prompt
    mov edx, month_prompt_len
    call printString
    mov ecx, month_buf
    mov edx, 10
    call readString
    mov ecx, month_buf
    call textToNum
    cmp eax, -1
    je input_error
    mov [month], eax

    mov ecx, day_prompt
    mov edx, day_prompt_len
    call printString
    mov ecx, day_buf
    mov edx, 10
    call readString
    mov ecx, day_buf
    call textToNum
    cmp eax, -1
    je input_error
    mov [day], eax

    call validateDate

    mov ecx, welcome_msg
    mov edx, welcome_msg_len
    call printString
    mov ecx, name_buf
    mov edx, 100
    call printString

    call determineZodiac

    mov ecx, zodiac_header
    mov edx, zodiac_header_len
    call printString
    call displayZodiacInfo

menu_loop:
    mov ecx, menu_art
    mov edx, menu_art_len
    call printString
    
    mov ecx, choice_buf
    mov edx, 10
    call readString

    mov al, [choice_buf]
    cmp al, '1'
    je do_love
    cmp al, '2'
    je do_career
    cmp al, '3'
    je do_health
    cmp al, '4'
    je do_lucky
    cmp al, '5'
    je do_info
    cmp al, '6'
    je exit_program
    
    mov ecx, invalid_choice
    mov edx, invalid_choice_len
    call printString
    jmp menu_loop

do_love:
    mov ecx, pred_love
    mov edx, pred_love_len
    call printString
    jmp ask_again

do_career:
    mov ecx, pred_career
    mov edx, pred_career_len
    call printString
    jmp ask_again

do_health:
    mov ecx, pred_health
    mov edx, pred_health_len
    call printString
    jmp ask_again

do_lucky:
    mov ecx, pred_lucky
    mov edx, pred_lucky_len
    call printString
    jmp ask_again

do_info:
    call displayZodiacInfo
    jmp ask_again

ask_again:
    mov ecx, try_again_prompt
    mov edx, try_again_len
    call printString
    mov ecx, try_buf
    mov edx, 10
    call readString
    
    mov al, [try_buf]
    cmp al, 'Y'
    je menu_loop
    cmp al, 'y'
    je menu_loop
    
exit_program:
    mov eax, 1
    xor ebx, ebx
    int 0x80

determineZodiac:
    mov eax, [month]
    imul eax, 100
    add eax, [day]

    cmp eax, 119
    jle .cap
    cmp eax, 1222
    jge .cap
    
    cmp eax, 218
    jle .aqu
    cmp eax, 320
    jle .pis
    cmp eax, 419
    jle .ari
    cmp eax, 520
    jle .tau
    cmp eax, 620
    jle .gem
    cmp eax, 722
    jle .can
    cmp eax, 822
    jle .leo
    cmp eax, 922
    jle .vir
    cmp eax, 1022
    jle .lib
    cmp eax, 1121
    jle .sco
    jmp .sag

.cap: mov dword [zodiac_id], 0
      ret
.aqu: mov dword [zodiac_id], 1
      ret
.pis: mov dword [zodiac_id], 2
      ret
.ari: mov dword [zodiac_id], 3
      ret
.tau: mov dword [zodiac_id], 4
      ret
.gem: mov dword [zodiac_id], 5
      ret
.can: mov dword [zodiac_id], 6
      ret
.leo: mov dword [zodiac_id], 7
      ret
.vir: mov dword [zodiac_id], 8
      ret
.lib: mov dword [zodiac_id], 9
      ret
.sco: mov dword [zodiac_id], 10
      ret
.sag: mov dword [zodiac_id], 11
      ret

displayZodiacInfo:
    mov eax, [zodiac_id]
    
    cmp eax, 0
    je .show_cap
    cmp eax, 1
    je .show_aqu
    cmp eax, 2
    je .show_pis
    cmp eax, 3
    je .show_ari
    cmp eax, 4
    je .show_tau
    cmp eax, 5
    je .show_gem
    cmp eax, 6
    je .show_can
    cmp eax, 7
    je .show_leo
    cmp eax, 8
    je .show_vir
    cmp eax, 9
    je .show_lib
    cmp eax, 10
    je .show_sco
    jmp .show_sag

.show_cap: mov ecx, cap_name
           mov edx, cap_name_len
           call printString
           mov ecx, cap_art
           mov edx, cap_art_len
           call printString
           ret
.show_aqu: mov ecx, aq_name
           mov edx, aq_name_len
           call printString
           mov ecx, aq_art
           mov edx, aq_art_len
           call printString
           ret
.show_pis: mov ecx, pis_name
           mov edx, pis_name_len
           call printString
           mov ecx, pis_art
           mov edx, pis_art_len
           call printString
           ret
.show_ari: mov ecx, ari_name
           mov edx, ari_name_len
           call printString
           mov ecx, ari_art
           mov edx, ari_art_len
           call printString
           ret
.show_tau: mov ecx, tau_name
           mov edx, tau_name_len
           call printString
           mov ecx, tau_art
           mov edx, tau_art_len
           call printString
           ret
.show_gem: mov ecx, gem_name
           mov edx, gem_name_len
           call printString
           mov ecx, gem_art
           mov edx, gem_art_len
           call printString
           ret
.show_can: mov ecx, can_name
           mov edx, can_name_len
           call printString
           mov ecx, can_art
           mov edx, can_art_len
           call printString
           ret
.show_leo: mov ecx, leo_name
           mov edx, leo_name_len
           call printString
           mov ecx, leo_art
           mov edx, leo_art_len
           call printString
           ret
.show_vir: mov ecx, vir_name
           mov edx, vir_name_len
           call printString
           mov ecx, vir_art
           mov edx, vir_art_len
           call printString
           ret
.show_lib: mov ecx, lib_name
           mov edx, lib_name_len
           call printString
           mov ecx, lib_art
           mov edx, lib_art_len
           call printString
           ret
.show_sco: mov ecx, sco_name
           mov edx, sco_name_len
           call printString
           mov ecx, sco_art
           mov edx, sco_art_len
           call printString
           ret
.show_sag: mov ecx, sag_name
           mov edx, sag_name_len
           call printString
           mov ecx, sag_art
           mov edx, sag_art_len
           call printString
           ret

validateDate:
    mov eax, [month]
    cmp eax, 1
    jl input_error
    cmp eax, 12
    jg input_error

    mov ebx, [day]
    cmp ebx, 1
    jl input_error
    cmp ebx, 31
    jg input_error

    cmp eax, 2
    je .feb_check

    cmp eax, 4
    je .day30
    cmp eax, 6
    je .day30
    cmp eax, 9
    je .day30
    cmp eax, 11
    je .day30

    ret

.feb_check:
    cmp ebx, 28
    jg input_error
    ret

.day30:
    cmp ebx, 30
    jg input_error
    ret

input_error:
    mov ecx, invalid_date
    mov edx, invalid_date_len
    call printString
    mov eax, 1
    mov ebx, 1
    int 0x80

textToNum:
    xor eax, eax
    xor ebx, ebx
.next:
    mov bl, [ecx]
    cmp bl, 10
    je .done
    cmp bl, 13
    je .done
    cmp bl, 0
    je .done
    cmp bl, '0'
    jl .error
    cmp bl, '9'
    jg .error
    sub bl, '0'
    imul eax, eax, 10
    movzx ebx, bl
    add eax, ebx
    inc ecx
    jmp .next
.error:
    mov eax, -1
    ret
.done:
    ret

printString:
    mov eax, 4
    mov ebx, 1
    int 0x80
    ret

readString:
    mov eax, 3
    mov ebx, 0
    int 0x80
    ret