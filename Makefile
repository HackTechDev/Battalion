##########################################################################
# This is a slightly better Makefile than before ... but its gonna need
# an overhaul very soon as its getting out of control.
#
# Makefile for v 2004 of battalion (OpenGL/Mesa version-openAL)


# ------------------------------------------------------------


# STEP 1: CHOOSE YOUR C/C++ COMPILER HERE (e.g. DCC, cc, CC, gcc, acc)
#
# (the program should compile with no warning messages - if you
#  see a warning message please let me know about it)
# ------------------------------------------------------------
CC = gcc



# STEP 2: CHOOSE WHICH GRAPHICS LIBRARIES TO COMPILE WITH:
#         MESA OR OPENGL
#
# ------------------------------------------------------------
#GLIB = -lMesaGL -lMesaGLU -lglut
# or
GLIB =  -lGL -lGLU -lglut  


# STEP 3: CHOOSE WHICH OS YOU ARE RUNNING
#
#	  Uncomment next line for windows version
#
# ------------------------------------------------------------
#OS = -DWIN32


# STEP 4: IF YOU WANT OPENAL SOUND UNCOMMENT NEXT LINES
#         ELSE COMMENT THEM OUT
#
# ------------------------------------------------------------
#AUDIOLIB = -lopenal
#AUDIODEF = -I/usr/include/AL -DSOUND 

# STEP 5: IF YOU WANT THE SPANISH VERSION UNCOMMENT NEXT LINE
#         IF NO LANGUAGE DEFINED ENGLISH VERSION IS COMPILED
# ------------------------------------------------------------
#LANGUAGEDEF = -DSPANISHLANG

# STEP 6: CHOOSE ANY OPTIMIZATIONS OR ADD ANY SPECIAL INCLUSIONS
# ------------------------------------------------------------
CFLAGS     = -g   -I/usr/local/X11/include  -I. $(AUDIODEF) $(LANGUAGEDEF)


# STEP 7: ADD ANY SPECIAL LIBRARY PATHS
#         (USEFUL TO POINT TO WHERE THE MESA LIBRARIES RESIDE)
# ------------------------------------------------------------
LIBFLAGS     = 

# you should now be able to type 'make' and everything should be fine ...

#-------------------------------------------------------------------

TARGET 	= battalion

OBJ 	= main.o audio.o gprim.o graphics.o objects.o text.o update.o  font.o tgaload.o 
LIBS    = -L/usr/X11R6/lib -lm  

all:	$(TARGET)

#$(OBJ): $(?:.o=.c)
#	$(CC) $(CFLAGS) $(LIBFLAG) $(OS) $(WHICHLIB) $(AUDIOLIB) -c $?

$(TARGET): $(OBJ)
	$(CC) -o $(TARGET) $(OBJ) $(LIBFLAGS) $(GLIB) $(LIBS) $(AUDIODEF) $(AUDIOLIB)

clean:
	rm -f $(OBJ)


