CC=g++

#Optimisation level

OPT = -O0

#Other Flags
CFLAGS = $(OPT) -Wall -g -std=c++11

#SFML
LIBS = -lsfml-graphics -lsfml-window -lsfml-system

#Source files
SRCS = src/main.cpp src/game.cpp src/GameState.cpp src/Dot.cpp \
	   src/Character.cpp src/Ghost.cpp src/PacWoman.cpp \
	   src/Bonus.cpp src/Animator.cpp

#Object files
OBJS = $(SRCS:.cpp=.o)

#Executable file
PROG = pac-woman


#---------------------------------------------------------------------------------
.PHONY: depend clean remove

.SUFFIXES: .cpp

all: $(PROG)

$(PROG): $(OBJS)
	$(CC) $(CFLAGS) $(SPATH) $(OBJS) -o $(PROG) $(LIBS)

.cpp.o:
	$(CC) $(CFLAGS) $(SPATH) -c $*.cpp -o $*.o

.c.o:
	$(CC) $(CFLAGS) -c $*.c -o $*.o
	
clean:
	rm src/*.o $(PROG)
remove:
	rm 
depend:
	makedepend -- $(CFLAGS) -- $(SRCS)