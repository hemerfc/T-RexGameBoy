

;-------------------
;  player movement
;-------------------
DINO_UPDATE:

  ;check up press
  ld a, [joypad_pressed]
  call JOY_UP
  jr  nz,.end_joy_up_pressed

.end_joy_up_pressed

  ;check down press
  ld a, [joypad_pressed]
  call JOY_DOWN
  jr  nz,.end_joy_down_pressed

.end_joy_down_pressed

  ;check start pressed
  ld a, [joypad_pressed]
  call JOY_DOWN
  jr  nz,.end_joy_start_pressed
  ; PAUSE THE GAME

.end_joy_start_pressed

  ;check A is down
  ld a, [joypad_down]
  call JOY_A
  jr  nz,.end_joy_a_down

  ; if player_y is less than 40 
  ld a, [player_y]
  cp 40
  jr c,.end_joy_a_down

  ; if player_jump_speed is grather than 0, not falling
  ld a, [player_jump_speed]
  cp 9
  jr nc,.end_joy_a_down

  ; set jump speed
  ld a, 8
  ld [player_jump_speed], a

.end_joy_a_down

  ;check A is down
  ld a, [joypad_pressed]
  call JOY_A
  jr  nz,.end_joy_a_pressed

  ; set player state to jumping
  ld a, %00000001
  ld [player_state], a  

.end_joy_a_pressed

  ld a, [player_state]
  cp  %00000001
  jr nz,.dino_state_end

; start the jump
  ld a, [player_jump_speed]
  add $FF ; -1
  ld [player_jump_speed], a
  ld b,a
  ld a, [player_y]
  sub b
  ld [player_y],a

  ; if player_y > 79
  cp 79
  jr c,.dino_state_end
  ; end the jump
  ld a, %00000000
  ld [player_state], a
  ; assign y pos
  ld a, 80
  ld [player_y], a
  ; set jump speed
  ld a, 0
  ld [player_jump_speed], a
  
.dino_state_end

ret ; PLAYER_UPDATE

DINO_DRAW:
  ; calc sprites position based on player_x and player_y
  ld  a,[player_x]
  add 8
  ld  [player_x2],a
  add 8
  ld  [player_x3],a

  ld  a,[player_y]
  add 8
  ld  [player_y2],a
  add 8
  ld  [player_y3],a

  call DINO_DRAW_STAND

;-------------
; draw dino sprites
;-------------
DINO_DRAW_STAND:
  UPDATE_OAM_SPRITE 0,  [player_y], [player_x2],  4, %00000000
  UPDATE_OAM_SPRITE 1,  [player_y], [player_x3],  5, %00000000
  UPDATE_OAM_SPRITE 2, [player_y2],  [player_x],  6, %00000000
  UPDATE_OAM_SPRITE 3, [player_y2], [player_x2],  7, %00000000
  UPDATE_OAM_SPRITE 4, [player_y2], [player_x3],  8, %00000000
  UPDATE_OAM_SPRITE 5, [player_y3],  [player_x],  9, %00000000
  UPDATE_OAM_SPRITE 6, [player_y3], [player_x2], 10, %00000000
  
  ret ; DRAW_DINO_STAND
