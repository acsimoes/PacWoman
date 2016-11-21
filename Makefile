CC=g++

#Optimisation level

OPT = -O0

#Other Flags
CFLAGS = $(OPT) -Wall -g -std=c++11

#SFML
LIBS = -lsfml-graphics -lsfml-window -lsfml-system

#Source files
SRCS = src/game.cpp src/GameState.cpp src/Dot.cpp \
	   src/Character.cpp src/Ghost.cpp src/PacWoman.cpp \
	   src/Bonus.cpp src/Animator.cpp src/Maze.cpp

#Object files
OBJS = $(SRCS:.cpp=.o)

#Executable file
PROG = pac-woman


#---------------------------------------------------------------------------------
.PHONY: depend clean remove

.SUFFIXES: .cpp

all: $(PROG)

$(PROG): $(OBJS) src/main.o
	$(CC) $(CFLAGS) $(SPATH) $(OBJS) src/main.o -o $(PROG) $(LIBS)

.cpp.o:
	$(CC) $(CFLAGS) $(SPATH) -c $*.cpp -o $*.o

.c.o:
	$(CC) $(CFLAGS) -c $*.c -o $*.o

test: $(OBJS) src/test.o
	$(CC) $(CFLAGS) $(SPATH) $(OBJS) src/test.o -o test $(LIBS)
	
clean:
	rm src/*.o $(PROG) test
remove:
	rm 
depend:
	makedepend -- $(CFLAGS) -- $(SRCS)