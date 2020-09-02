;-------------
; Ram variables etc
;-------------
SECTION "RAM Vars",WRAM0[$C000]

;vblank stuffs
vblank_flag:           DB
vblank_count:          DB

;       high -------------------------- low
;AND -> down/up/left/right/start/select/a/b
joypad_down:           DB
joypad_pressed:        DB
joypad_released:       DB

;player vars
player_y:              DB
player_x:              DB
player_y2:             DB
player_x2:             DB
player_y3:             DB
player_x3:             DB
player_frame:          DB
player_state:          DB
player_jump_speed:     DB

;enemy vars
enemy_y:               DB
enemy_x:               DB
enemy_frame:           DB

;various things
game_over:             DB
game_won:              DB
cam_x:                 DB
cam_y:                 DB

;-------------
; OAM DATA
;-------------
SECTION "OAM Vars",WRAM0[$C100]

oam_sprites: DS 7

