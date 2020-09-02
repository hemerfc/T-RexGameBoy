;-------------
; GRAPHICS DATA
;-------------
SECTION "GFX",ROMX,BANK[1]


gfx_start:

; sprites and tiles must be between start and end tag
gfx_dino_stand:
	incbin "spr/build/test01.2bpp"



gfx_end:

