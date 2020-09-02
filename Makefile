OBJS = bank0.asm
OBJS_NAME = test01
OBJ_NAME = test01

BDIR = build
SDIR = spr

ASM = hgbasm
LINK = hgblink
FIX = hgbfix
GFX = rgbgfx

all : $(OBJS)
	$(GFX) -o $(SDIR)\$(BDIR)\$(OBJ_NAME).2bpp $(SDIR)\$(OBJ_NAME).png
	$(ASM) -o $(BDIR)\$(OBJS_NAME).obj $(OBJS)
	$(LINK) -m $(BDIR)\$(OBJ_NAME).map -n $(BDIR)\$(OBJ_NAME).sym -o $(BDIR)\$(OBJ_NAME).gb $(BDIR)\$(OBJS_NAME).obj
	$(FIX) -p 0 -v $(BDIR)\$(OBJ_NAME).gb
	del $(BDIR)\$(OBJS_NAME).obj

$(BDIR)\${OBJ_NAME}.gb : all

run : $(BDIR)\${OBJ_NAME}.gb 
	bgb $(BDIR)\$(OBJ_NAME).gb 