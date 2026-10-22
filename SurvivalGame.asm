%macro PRINT 1
    push esi
    mov esi, %1
    call print_string
    pop esi
%endmacro

%macro PRINTPTR 1
    push esi
    mov esi, [%1]
    call print_string
    pop esi
%endmacro

section .data

welcome_art:
    db "=======================================", 10
    db "       DUNGEON OF THE LOST KING", 10
    db "=======================================", 10
    db "              |>>>>", 10
    db "              |", 10
    db "          _  _|_  _", 10
    db "         |;|_|;|_|;|", 10
    db "         \.    .  /", 10
    db "          \:  .  /", 10
    db "           ||:   |", 10
    db "           ||:.  |", 10
    db "           ||:  .|", 10
    db "       ENTER IF YOU DARE!", 10
    db "=======================================", 10, 0

goblin_art:
    db "          ,      ,", 10
    db "         /(.-", 34, 34, "-.)\", 10
    db "     |\  \/      \/  /|", 10
    db "     | \ / =.  .= \ / |", 10
    db "      \  \   ^    /  /", 10
    db "       \  ", 39, "-----", 39, "  /", 10
    db "A GOBLIN APPEARS!", 10, 0

chest_art:
    db "          __________", 10
    db "         /_________/|", 10
    db "        |  _____  | |", 10
    db "        | |  ?  | | |", 10
    db "        | |_____| | /", 10
    db "        |_________|/", 10, 0

dragon_art:
    db "               / \  //\", 10
    db "      |\___/|      \", 10
    db "      /0  0  \      |", 10
    db "     /   ^    \    /", 10
    db "    /  \___/   \  /", 10
    db "    \___________\/", 10
    db "THE DRAGON AWAKENS!", 10, 0

victory_banner:
    db 10, "=======================================", 10
    db "                VICTORY!", 10
    db "=======================================", 10, 0

defeat_banner:
    db 10, "=======================================", 10
    db "                GAME OVER", 10
    db "=======================================", 10
    db "Your hero has fallen.", 10
    db "The dungeon remains undefeated.", 10
    db "BETTER LUCK NEXT TIME!", 10, 0

prompt_name:     db "Enter your hero name: ", 0
err_name:        db "Name cannot be empty. Please try again.", 10, 0
class_menu:      db 10, "Choose your character:", 10
                 db "[1] Warrior", 10
                 db "[2] Mage", 10
                 db "[3] Archer", 10
                 db "Enter choice: ", 0
err_class:       db "Invalid selection. Please choose 1, 2 or 3.", 10, 0
err_menu:        db "Invalid selection. Please try again.", 10, 0
str_warrior:     db "Warrior", 0
str_mage:        db "Mage", 0
str_archer:      db "Archer", 0
str_welcome:     db 10, "Welcome, ", 0
str_space:       db " ", 0
str_bang:        db "!", 10, 0
str_nl:          db 10, 0
str_slash:       db " / ", 0
lbl_health:      db "Health: ", 0
lbl_attack:      db "Attack: ", 0
lbl_potions:     db "Potions: ", 0
lbl_gold:        db "Gold: ", 0
lbl_hero:        db "Hero: ", 0
lbl_class:       db "Class: ", 0
lbl_room:        db "Current Room: ", 0
str_of3:         db " of 3", 10, 0
str_stats_sep:   db "   ", 0

main_menu:       db 10, "=============== MAIN MENU ===============", 10
                 db "[1] Explore Dungeon", 10
                 db "[2] View Character Status", 10
                 db "[3] Use Health Potion", 10
                 db "[4] View Inventory", 10
                 db "[5] Exit Game", 10
                 db "Enter choice: ", 0

status_header:   db 10, "========== CHARACTER STATUS ==========", 10, 0
inv_header:      db 10, "============== INVENTORY ==============", 10, 0
inv_potion:      db "Health Potions: ", 0
inv_gold:        db "Gold Coins: ", 0

room1_title:     db 10, "---------- ROOM 1: GOBLIN CHAMBER ----------", 10, 0
room2_title:     db 10, "--------- ROOM 2: TREASURE CHAMBER ---------", 10, 0
room3_title:     db 10, "---------- ROOM 3: DRAGON'S LAIR -----------", 10, 0

chest_menu:      db "[1] Open Chest  [2] Leave Chest", 10, "Enter choice: ", 0
msg_chest_open:  db "You open the chest and find 50 gold!", 10, 0
msg_chest_leave: db "You leave the chest untouched.", 10, 0
msg_path:        db "A dark passage leads deeper into the dungeon...", 10, 0
msg_gob_dead:    db "The goblin has been defeated! The way forward is open.", 10, 0

combat_menu:     db "[1] Attack  [2] Defend", 10
                 db "[3] Use Potion  [4] Run", 10
                 db "Enter choice: ", 0
str_enemy_hp:    db 10, "Enemy Health: ", 0
str_your_hp:     db "   |   Your Health: ", 0
str_you_hit:     db "You strike the enemy for ", 0
str_enemy_hits:  db "The enemy hits you for ", 0
str_damage:      db " damage!", 10, 0
str_brace:       db "You raise your guard and brace for the next attack!", 10, 0
str_run:         db "You run away from the fight and return to the entrance!", 10, 0
str_foe_down:    db "The enemy has been defeated!", 10, 0

msg_potion_used: db "You drink a health potion. Health: ", 0
msg_no_potion:   db "You have no health potions left! No health restored.", 10, 0

str_congrats:    db "CONGRATULATIONS, ", 0
str_slain:       db "You defeated the dragon and escaped!", 10, 0
str_final_gold:  db "Final Gold: ", 0
str_remain_hp:   db "Remaining Health: ", 0
str_hero:        db "YOU ARE A HERO!", 10, 0
str_bye:         db 10, "Thanks for playing Dungeon of the Lost King. Goodbye!", 10, 0

section .bss

name_buf:        resb 64
in_buf:          resb 64
junk_buf:        resb 4
num_buf:         resb 16
class_id:        resd 1
class_name_ptr:  resd 1
player_hp:       resd 1
max_hp:          resd 1
player_atk:      resd 1
potions:         resd 1
gold:            resd 1
room:            resd 1
gob_hp:          resd 1
drg_hp:          resd 1
defend:          resd 1

section .text
global _start

_start:
    call display_welcome
    call get_player_info
    call initialize_character
    call display_greeting

main_loop:
    call display_main_menu
    call read_choice
    cmp eax, 1
    je .do_explore
    cmp eax, 2
    je .do_status
    cmp eax, 3
    je .do_potion
    cmp eax, 4
    je .do_inventory
    cmp eax, 5
    je exit_program
    PRINT err_menu
    jmp main_loop

.do_explore:
    call explore_dungeon
    jmp main_loop

.do_status:
    call display_status
    jmp main_loop

.do_potion:
    call use_potion
    jmp main_loop

.do_inventory:
    call display_inventory
    jmp main_loop

display_welcome:
    PRINT welcome_art
    ret

get_player_info:
.name_loop:
    PRINT prompt_name
    call read_line
    cmp byte [in_buf], 10
    je .name_empty
    mov esi, in_buf
    mov edi, name_buf
.copy:
    mov al, [esi]
    cmp al, 10
    je .copied
    cmp al, 0
    je .copied
    mov [edi], al
    inc esi
    inc edi
    jmp .copy
.copied:
    mov byte [edi], 0
.class_loop:
    PRINT class_menu
    call read_choice
    cmp eax, 1
    jl .class_bad
    cmp eax, 3
    jg .class_bad
    mov [class_id], eax
    ret
.name_empty:
    PRINT err_name
    jmp .name_loop
.class_bad:
    PRINT err_class
    jmp .class_loop

initialize_character:
    mov eax, [class_id]
    cmp eax, 1
    je .warrior
    cmp eax, 2
    je .mage
    jmp .archer
.warrior:
    mov dword [player_hp], 100
    mov dword [max_hp], 100
    mov dword [player_atk], 20
    mov dword [potions], 2
    mov dword [class_name_ptr], str_warrior
    jmp .common
.mage:
    mov dword [player_hp], 70
    mov dword [max_hp], 70
    mov dword [player_atk], 30
    mov dword [potions], 3
    mov dword [class_name_ptr], str_mage
    jmp .common
.archer:
    mov dword [player_hp], 85
    mov dword [max_hp], 85
    mov dword [player_atk], 25
    mov dword [potions], 2
    mov dword [class_name_ptr], str_archer
.common:
    mov dword [gold], 0
    mov dword [room], 1
    mov dword [gob_hp], 30
    mov dword [drg_hp], 60
    mov dword [defend], 0
    ret

display_greeting:
    PRINT str_welcome
    PRINTPTR class_name_ptr
    PRINT str_space
    PRINT name_buf
    PRINT str_bang
    PRINT lbl_health
    mov eax, [player_hp]
    call print_number
    PRINT str_stats_sep
    PRINT lbl_attack
    mov eax, [player_atk]
    call print_number
    PRINT str_stats_sep
    PRINT lbl_potions
    mov eax, [potions]
    call print_number
    PRINT str_nl
    ret

display_main_menu:
    PRINT main_menu
    ret

explore_dungeon:
    mov eax, [room]
    cmp eax, 1
    je .room1
    cmp eax, 2
    je .room2
    jmp .room3

.room1:
    PRINT room1_title
    PRINT goblin_art
    mov esi, gob_hp
    mov edi, 10
    call battle_enemy
    cmp eax, 1
    je .goblin_won
    cmp eax, 2
    je .lost
    ret

.goblin_won:
    PRINT msg_gob_dead
    mov dword [room], 2
    ret

.room2:
    PRINT room2_title
    PRINT chest_art
.chest_loop:
    PRINT chest_menu
    call read_choice
    cmp eax, 1
    je .open_chest
    cmp eax, 2
    je .leave_chest
    PRINT err_menu
    jmp .chest_loop
.open_chest:
    add dword [gold], 50
    PRINT msg_chest_open
    jmp .room2_done
.leave_chest:
    PRINT msg_chest_leave
.room2_done:
    PRINT msg_path
    mov dword [room], 3
    ret

.room3:
    PRINT room3_title
    PRINT dragon_art
    mov esi, drg_hp
    mov edi, 15
    call battle_enemy
    cmp eax, 1
    je .dragon_won
    cmp eax, 2
    je .lost
    ret

.dragon_won:
    mov eax, 1
    call display_game_result
    ret

.lost:
    mov eax, 2
    call display_game_result
    ret

battle_enemy:
    push ebx
    push ecx
    push edx
    mov dword [defend], 0

.turn:
    PRINT str_enemy_hp
    mov eax, [esi]
    call print_number
    PRINT str_your_hp
    mov eax, [player_hp]
    call print_number
    PRINT str_slash
    mov eax, [max_hp]
    call print_number
    PRINT str_nl
    PRINT combat_menu
    call read_choice
    cmp eax, 1
    je .attack
    cmp eax, 2
    je .defend_act
    cmp eax, 3
    je .potion_act
    cmp eax, 4
    je .run_act
    PRINT err_menu
    jmp .turn

.attack:
    mov eax, [player_atk]
    mov ebx, [esi]
    sub ebx, eax
    cmp ebx, 0
    jg .store_enemy
    xor ebx, ebx
.store_enemy:
    mov [esi], ebx
    PRINT str_you_hit
    mov eax, [player_atk]
    call print_number
    PRINT str_damage
    cmp ebx, 0
    jle .enemy_dead
    jmp .retaliate

.defend_act:
    mov dword [defend], 1
    PRINT str_brace
    jmp .retaliate

.potion_act:
    call use_potion
    jmp .turn

.run_act:
    PRINT str_run
    xor eax, eax
    jmp .leave

.retaliate:
    mov eax, edi
    cmp dword [defend], 0
    je .apply_hit
    sub eax, 5
    cmp eax, 0
    jge .apply_hit
    xor eax, eax
.apply_hit:
    mov dword [defend], 0
    mov ebx, [player_hp]
    sub ebx, eax
    cmp ebx, 0
    jg .store_player
    xor ebx, ebx
.store_player:
    mov [player_hp], ebx
    PRINT str_enemy_hits
    call print_number
    PRINT str_damage
    cmp ebx, 0
    jle .player_dead
    jmp .turn

.enemy_dead:
    PRINT str_foe_down
    mov eax, 1
    jmp .leave

.player_dead:
    mov eax, 2

.leave:
    pop edx
    pop ecx
    pop ebx
    ret

use_potion:
    cmp dword [potions], 0
    jle .none
    dec dword [potions]
    mov eax, [player_hp]
    add eax, 20
    cmp eax, [max_hp]
    jle .healed
    mov eax, [max_hp]
.healed:
    mov [player_hp], eax
    PRINT msg_potion_used
    call print_number
    PRINT str_slash
    mov eax, [max_hp]
    call print_number
    PRINT str_nl
    PRINT inv_potion
    mov eax, [potions]
    call print_number
    PRINT str_nl
    ret
.none:
    PRINT msg_no_potion
    ret

display_status:
    PRINT status_header
    PRINT lbl_hero
    PRINT name_buf
    PRINT str_nl
    PRINT lbl_class
    PRINTPTR class_name_ptr
    PRINT str_nl
    PRINT lbl_health
    mov eax, [player_hp]
    call print_number
    PRINT str_slash
    mov eax, [max_hp]
    call print_number
    PRINT str_nl
    PRINT lbl_attack
    mov eax, [player_atk]
    call print_number
    PRINT str_nl
    PRINT lbl_potions
    mov eax, [potions]
    call print_number
    PRINT str_nl
    PRINT lbl_gold
    mov eax, [gold]
    call print_number
    PRINT str_nl
    PRINT lbl_room
    mov eax, [room]
    call print_number
    PRINT str_of3
    ret

display_inventory:
    PRINT inv_header
    PRINT inv_potion
    mov eax, [potions]
    call print_number
    PRINT str_nl
    PRINT inv_gold
    mov eax, [gold]
    call print_number
    PRINT str_nl
    ret

display_game_result:
    cmp eax, 1
    jne .defeat
    PRINT victory_banner
    PRINT str_congrats
    PRINT name_buf
    PRINT str_bang
    PRINT str_slain
    PRINT str_final_gold
    mov eax, [gold]
    call print_number
    PRINT str_nl
    PRINT str_remain_hp
    mov eax, [player_hp]
    call print_number
    PRINT str_nl
    PRINT str_hero
    jmp exit_program
.defeat:
    PRINT defeat_banner
    jmp exit_program

exit_program:
    PRINT str_bye
    mov eax, 1
    xor ebx, ebx
    int 0x80

print_string:
    pushad
    xor edx, edx
.measure:
    cmp byte [esi+edx], 0
    je .write
    inc edx
    jmp .measure
.write:
    mov ecx, esi
    mov ebx, 1
    mov eax, 4
    int 0x80
    popad
    ret

print_number:
    pushad
    mov edi, num_buf
    add edi, 15
    mov byte [edi], 0
    mov ebx, 10
    cmp eax, 0
    jne .convert
    dec edi
    mov byte [edi], '0'
    jmp .show
.convert:
    xor edx, edx
    div ebx
    add dl, '0'
    dec edi
    mov [edi], dl
    cmp eax, 0
    jne .convert
.show:
    mov esi, edi
    call print_string
    popad
    ret

read_line:
    push ebx
    push ecx
    push edx
    push edi
    xor edi, edi
.next:
    mov eax, 3
    mov ebx, 0
    mov ecx, junk_buf
    mov edx, 1
    int 0x80
    cmp eax, 0
    jle .eof
    mov al, [junk_buf]
    cmp al, 10
    je .endline
    cmp edi, 62
    jge .next
    mov [in_buf + edi], al
    inc edi
    jmp .next
.eof:
    cmp edi, 0
    jle exit_program
.endline:
    mov byte [in_buf + edi], 10
    mov byte [in_buf + edi + 1], 0
    pop edi
    pop edx
    pop ecx
    pop ebx
    ret

read_choice:
    call read_line
    xor eax, eax
    mov al, [in_buf]
    cmp al, '1'
    jl .bad
    cmp al, '9'
    jg .bad
    cmp byte [in_buf + 1], 10
    jne .bad
    sub eax, '0'
    ret
.bad:
    xor eax, eax
    ret
