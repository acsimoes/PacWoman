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
	   src/Bonus.cpp src/Animator.cpp src/Maze.cpp \
	   src/GhostStates.cpp

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

test: src/test.o
	$(CC) $(CFLAGS) $(SPATH) src/test.o -o test $(LIBS)
	
clean:
	rm src/*.o $(PROG) test
remove:
	rm 
depend:
	makedepend -- $(CFLAGS) -- $(SRCS)# DO NOT DELETE

src/game.o: src/game.hpp /usr/include/SFML/Graphics.hpp
src/game.o: /usr/include/SFML/Window.hpp /usr/include/SFML/System.hpp
src/game.o: /usr/include/SFML/Config.hpp /usr/include/SFML/System/Clock.hpp
src/game.o: /usr/include/SFML/System/Export.hpp
src/game.o: /usr/include/SFML/System/Time.hpp
src/game.o: /usr/include/SFML/System/Err.hpp
src/game.o: /usr/include/SFML/System/InputStream.hpp
src/game.o: /usr/include/SFML/System/Lock.hpp
src/game.o: /usr/include/SFML/System/NonCopyable.hpp
src/game.o: /usr/include/SFML/System/Mutex.hpp
src/game.o: /usr/include/SFML/System/Sleep.hpp
src/game.o: /usr/include/SFML/System/String.hpp
src/game.o: /usr/include/SFML/System/Thread.hpp
src/game.o: /usr/include/SFML/System/Thread.inl
src/game.o: /usr/include/SFML/System/ThreadLocal.hpp
src/game.o: /usr/include/SFML/System/ThreadLocalPtr.hpp
src/game.o: /usr/include/SFML/System/ThreadLocalPtr.inl
src/game.o: /usr/include/SFML/System/Utf.hpp /usr/include/SFML/System/Utf.inl
src/game.o: /usr/include/SFML/System/Vector2.hpp
src/game.o: /usr/include/SFML/System/Vector2.inl
src/game.o: /usr/include/SFML/System/Vector3.hpp
src/game.o: /usr/include/SFML/System/Vector3.inl
src/game.o: /usr/include/SFML/Window/Context.hpp
src/game.o: /usr/include/SFML/Window/Export.hpp
src/game.o: /usr/include/SFML/Window/GlResource.hpp
src/game.o: /usr/include/SFML/Window/ContextSettings.hpp
src/game.o: /usr/include/SFML/Window/Event.hpp
src/game.o: /usr/include/SFML/Window/Joystick.hpp
src/game.o: /usr/include/SFML/Window/Keyboard.hpp
src/game.o: /usr/include/SFML/Window/Mouse.hpp
src/game.o: /usr/include/SFML/Window/VideoMode.hpp
src/game.o: /usr/include/SFML/Window/Window.hpp
src/game.o: /usr/include/SFML/Window/WindowHandle.hpp
src/game.o: /usr/include/SFML/Window/WindowStyle.hpp
src/game.o: /usr/include/SFML/Graphics/BlendMode.hpp
src/game.o: /usr/include/SFML/Graphics/Color.hpp
src/game.o: /usr/include/SFML/Graphics/Export.hpp
src/game.o: /usr/include/SFML/Graphics/Font.hpp
src/game.o: /usr/include/SFML/Graphics/Glyph.hpp
src/game.o: /usr/include/SFML/Graphics/Rect.hpp
src/game.o: /usr/include/SFML/Graphics/Rect.inl
src/game.o: /usr/include/SFML/Graphics/Texture.hpp
src/game.o: /usr/include/SFML/Graphics/Image.hpp
src/game.o: /usr/include/SFML/Graphics/RenderStates.hpp
src/game.o: /usr/include/SFML/Graphics/Transform.hpp
src/game.o: /usr/include/SFML/Graphics/RenderTexture.hpp
src/game.o: /usr/include/SFML/Graphics/RenderTarget.hpp
src/game.o: /usr/include/SFML/Graphics/View.hpp
src/game.o: /usr/include/SFML/Graphics/PrimitiveType.hpp
src/game.o: /usr/include/SFML/Graphics/Vertex.hpp
src/game.o: /usr/include/SFML/Graphics/RenderWindow.hpp
src/game.o: /usr/include/SFML/Graphics/Shader.hpp
src/game.o: /usr/include/SFML/Graphics/Shape.hpp
src/game.o: /usr/include/SFML/Graphics/Drawable.hpp
src/game.o: /usr/include/SFML/Graphics/Transformable.hpp
src/game.o: /usr/include/SFML/Graphics/VertexArray.hpp
src/game.o: /usr/include/SFML/Graphics/CircleShape.hpp
src/game.o: /usr/include/SFML/Graphics/RectangleShape.hpp
src/game.o: /usr/include/SFML/Graphics/ConvexShape.hpp
src/game.o: /usr/include/SFML/Graphics/Sprite.hpp
src/game.o: /usr/include/SFML/Graphics/Text.hpp src/GameState.hpp
src/game.o: src/PacWoman.hpp src/Animator.hpp src/Character.hpp src/Maze.hpp
src/game.o: src/Ghost.hpp
src/GameState.o: src/GameState.hpp /usr/include/SFML/Graphics.hpp
src/GameState.o: /usr/include/SFML/Window.hpp /usr/include/SFML/System.hpp
src/GameState.o: /usr/include/SFML/Config.hpp
src/GameState.o: /usr/include/SFML/System/Clock.hpp
src/GameState.o: /usr/include/SFML/System/Export.hpp
src/GameState.o: /usr/include/SFML/System/Time.hpp
src/GameState.o: /usr/include/SFML/System/Err.hpp
src/GameState.o: /usr/include/SFML/System/InputStream.hpp
src/GameState.o: /usr/include/SFML/System/Lock.hpp
src/GameState.o: /usr/include/SFML/System/NonCopyable.hpp
src/GameState.o: /usr/include/SFML/System/Mutex.hpp
src/GameState.o: /usr/include/SFML/System/Sleep.hpp
src/GameState.o: /usr/include/SFML/System/String.hpp
src/GameState.o: /usr/include/SFML/System/Thread.hpp
src/GameState.o: /usr/include/SFML/System/Thread.inl
src/GameState.o: /usr/include/SFML/System/ThreadLocal.hpp
src/GameState.o: /usr/include/SFML/System/ThreadLocalPtr.hpp
src/GameState.o: /usr/include/SFML/System/ThreadLocalPtr.inl
src/GameState.o: /usr/include/SFML/System/Utf.hpp
src/GameState.o: /usr/include/SFML/System/Utf.inl
src/GameState.o: /usr/include/SFML/System/Vector2.hpp
src/GameState.o: /usr/include/SFML/System/Vector2.inl
src/GameState.o: /usr/include/SFML/System/Vector3.hpp
src/GameState.o: /usr/include/SFML/System/Vector3.inl
src/GameState.o: /usr/include/SFML/Window/Context.hpp
src/GameState.o: /usr/include/SFML/Window/Export.hpp
src/GameState.o: /usr/include/SFML/Window/GlResource.hpp
src/GameState.o: /usr/include/SFML/Window/ContextSettings.hpp
src/GameState.o: /usr/include/SFML/Window/Event.hpp
src/GameState.o: /usr/include/SFML/Window/Joystick.hpp
src/GameState.o: /usr/include/SFML/Window/Keyboard.hpp
src/GameState.o: /usr/include/SFML/Window/Mouse.hpp
src/GameState.o: /usr/include/SFML/Window/VideoMode.hpp
src/GameState.o: /usr/include/SFML/Window/Window.hpp
src/GameState.o: /usr/include/SFML/Window/WindowHandle.hpp
src/GameState.o: /usr/include/SFML/Window/WindowStyle.hpp
src/GameState.o: /usr/include/SFML/Graphics/BlendMode.hpp
src/GameState.o: /usr/include/SFML/Graphics/Color.hpp
src/GameState.o: /usr/include/SFML/Graphics/Export.hpp
src/GameState.o: /usr/include/SFML/Graphics/Font.hpp
src/GameState.o: /usr/include/SFML/Graphics/Glyph.hpp
src/GameState.o: /usr/include/SFML/Graphics/Rect.hpp
src/GameState.o: /usr/include/SFML/Graphics/Rect.inl
src/GameState.o: /usr/include/SFML/Graphics/Texture.hpp
src/GameState.o: /usr/include/SFML/Graphics/Image.hpp
src/GameState.o: /usr/include/SFML/Graphics/RenderStates.hpp
src/GameState.o: /usr/include/SFML/Graphics/Transform.hpp
src/GameState.o: /usr/include/SFML/Graphics/RenderTexture.hpp
src/GameState.o: /usr/include/SFML/Graphics/RenderTarget.hpp
src/GameState.o: /usr/include/SFML/Graphics/View.hpp
src/GameState.o: /usr/include/SFML/Graphics/PrimitiveType.hpp
src/GameState.o: /usr/include/SFML/Graphics/Vertex.hpp
src/GameState.o: /usr/include/SFML/Graphics/RenderWindow.hpp
src/GameState.o: /usr/include/SFML/Graphics/Shader.hpp
src/GameState.o: /usr/include/SFML/Graphics/Shape.hpp
src/GameState.o: /usr/include/SFML/Graphics/Drawable.hpp
src/GameState.o: /usr/include/SFML/Graphics/Transformable.hpp
src/GameState.o: /usr/include/SFML/Graphics/VertexArray.hpp
src/GameState.o: /usr/include/SFML/Graphics/CircleShape.hpp
src/GameState.o: /usr/include/SFML/Graphics/RectangleShape.hpp
src/GameState.o: /usr/include/SFML/Graphics/ConvexShape.hpp
src/GameState.o: /usr/include/SFML/Graphics/Sprite.hpp
src/GameState.o: /usr/include/SFML/Graphics/Text.hpp src/PacWoman.hpp
src/GameState.o: src/Animator.hpp src/Character.hpp src/Maze.hpp
src/GameState.o: src/Ghost.hpp src/game.hpp
src/Dot.o: src/Dot.hpp /usr/include/SFML/Graphics.hpp
src/Dot.o: /usr/include/SFML/Window.hpp /usr/include/SFML/System.hpp
src/Dot.o: /usr/include/SFML/Config.hpp /usr/include/SFML/System/Clock.hpp
src/Dot.o: /usr/include/SFML/System/Export.hpp
src/Dot.o: /usr/include/SFML/System/Time.hpp /usr/include/SFML/System/Err.hpp
src/Dot.o: /usr/include/SFML/System/InputStream.hpp
src/Dot.o: /usr/include/SFML/System/Lock.hpp
src/Dot.o: /usr/include/SFML/System/NonCopyable.hpp
src/Dot.o: /usr/include/SFML/System/Mutex.hpp
src/Dot.o: /usr/include/SFML/System/Sleep.hpp
src/Dot.o: /usr/include/SFML/System/String.hpp
src/Dot.o: /usr/include/SFML/System/Thread.hpp
src/Dot.o: /usr/include/SFML/System/Thread.inl
src/Dot.o: /usr/include/SFML/System/ThreadLocal.hpp
src/Dot.o: /usr/include/SFML/System/ThreadLocalPtr.hpp
src/Dot.o: /usr/include/SFML/System/ThreadLocalPtr.inl
src/Dot.o: /usr/include/SFML/System/Utf.hpp /usr/include/SFML/System/Utf.inl
src/Dot.o: /usr/include/SFML/System/Vector2.hpp
src/Dot.o: /usr/include/SFML/System/Vector2.inl
src/Dot.o: /usr/include/SFML/System/Vector3.hpp
src/Dot.o: /usr/include/SFML/System/Vector3.inl
src/Dot.o: /usr/include/SFML/Window/Context.hpp
src/Dot.o: /usr/include/SFML/Window/Export.hpp
src/Dot.o: /usr/include/SFML/Window/GlResource.hpp
src/Dot.o: /usr/include/SFML/Window/ContextSettings.hpp
src/Dot.o: /usr/include/SFML/Window/Event.hpp
src/Dot.o: /usr/include/SFML/Window/Joystick.hpp
src/Dot.o: /usr/include/SFML/Window/Keyboard.hpp
src/Dot.o: /usr/include/SFML/Window/Mouse.hpp
src/Dot.o: /usr/include/SFML/Window/VideoMode.hpp
src/Dot.o: /usr/include/SFML/Window/Window.hpp
src/Dot.o: /usr/include/SFML/Window/WindowHandle.hpp
src/Dot.o: /usr/include/SFML/Window/WindowStyle.hpp
src/Dot.o: /usr/include/SFML/Graphics/BlendMode.hpp
src/Dot.o: /usr/include/SFML/Graphics/Color.hpp
src/Dot.o: /usr/include/SFML/Graphics/Export.hpp
src/Dot.o: /usr/include/SFML/Graphics/Font.hpp
src/Dot.o: /usr/include/SFML/Graphics/Glyph.hpp
src/Dot.o: /usr/include/SFML/Graphics/Rect.hpp
src/Dot.o: /usr/include/SFML/Graphics/Rect.inl
src/Dot.o: /usr/include/SFML/Graphics/Texture.hpp
src/Dot.o: /usr/include/SFML/Graphics/Image.hpp
src/Dot.o: /usr/include/SFML/Graphics/RenderStates.hpp
src/Dot.o: /usr/include/SFML/Graphics/Transform.hpp
src/Dot.o: /usr/include/SFML/Graphics/RenderTexture.hpp
src/Dot.o: /usr/include/SFML/Graphics/RenderTarget.hpp
src/Dot.o: /usr/include/SFML/Graphics/View.hpp
src/Dot.o: /usr/include/SFML/Graphics/PrimitiveType.hpp
src/Dot.o: /usr/include/SFML/Graphics/Vertex.hpp
src/Dot.o: /usr/include/SFML/Graphics/RenderWindow.hpp
src/Dot.o: /usr/include/SFML/Graphics/Shader.hpp
src/Dot.o: /usr/include/SFML/Graphics/Shape.hpp
src/Dot.o: /usr/include/SFML/Graphics/Drawable.hpp
src/Dot.o: /usr/include/SFML/Graphics/Transformable.hpp
src/Dot.o: /usr/include/SFML/Graphics/VertexArray.hpp
src/Dot.o: /usr/include/SFML/Graphics/CircleShape.hpp
src/Dot.o: /usr/include/SFML/Graphics/RectangleShape.hpp
src/Dot.o: /usr/include/SFML/Graphics/ConvexShape.hpp
src/Dot.o: /usr/include/SFML/Graphics/Sprite.hpp
src/Dot.o: /usr/include/SFML/Graphics/Text.hpp
src/Character.o: src/Character.hpp /usr/include/SFML/Graphics.hpp
src/Character.o: /usr/include/SFML/Window.hpp /usr/include/SFML/System.hpp
src/Character.o: /usr/include/SFML/Config.hpp
src/Character.o: /usr/include/SFML/System/Clock.hpp
src/Character.o: /usr/include/SFML/System/Export.hpp
src/Character.o: /usr/include/SFML/System/Time.hpp
src/Character.o: /usr/include/SFML/System/Err.hpp
src/Character.o: /usr/include/SFML/System/InputStream.hpp
src/Character.o: /usr/include/SFML/System/Lock.hpp
src/Character.o: /usr/include/SFML/System/NonCopyable.hpp
src/Character.o: /usr/include/SFML/System/Mutex.hpp
src/Character.o: /usr/include/SFML/System/Sleep.hpp
src/Character.o: /usr/include/SFML/System/String.hpp
src/Character.o: /usr/include/SFML/System/Thread.hpp
src/Character.o: /usr/include/SFML/System/Thread.inl
src/Character.o: /usr/include/SFML/System/ThreadLocal.hpp
src/Character.o: /usr/include/SFML/System/ThreadLocalPtr.hpp
src/Character.o: /usr/include/SFML/System/ThreadLocalPtr.inl
src/Character.o: /usr/include/SFML/System/Utf.hpp
src/Character.o: /usr/include/SFML/System/Utf.inl
src/Character.o: /usr/include/SFML/System/Vector2.hpp
src/Character.o: /usr/include/SFML/System/Vector2.inl
src/Character.o: /usr/include/SFML/System/Vector3.hpp
src/Character.o: /usr/include/SFML/System/Vector3.inl
src/Character.o: /usr/include/SFML/Window/Context.hpp
src/Character.o: /usr/include/SFML/Window/Export.hpp
src/Character.o: /usr/include/SFML/Window/GlResource.hpp
src/Character.o: /usr/include/SFML/Window/ContextSettings.hpp
src/Character.o: /usr/include/SFML/Window/Event.hpp
src/Character.o: /usr/include/SFML/Window/Joystick.hpp
src/Character.o: /usr/include/SFML/Window/Keyboard.hpp
src/Character.o: /usr/include/SFML/Window/Mouse.hpp
src/Character.o: /usr/include/SFML/Window/VideoMode.hpp
src/Character.o: /usr/include/SFML/Window/Window.hpp
src/Character.o: /usr/include/SFML/Window/WindowHandle.hpp
src/Character.o: /usr/include/SFML/Window/WindowStyle.hpp
src/Character.o: /usr/include/SFML/Graphics/BlendMode.hpp
src/Character.o: /usr/include/SFML/Graphics/Color.hpp
src/Character.o: /usr/include/SFML/Graphics/Export.hpp
src/Character.o: /usr/include/SFML/Graphics/Font.hpp
src/Character.o: /usr/include/SFML/Graphics/Glyph.hpp
src/Character.o: /usr/include/SFML/Graphics/Rect.hpp
src/Character.o: /usr/include/SFML/Graphics/Rect.inl
src/Character.o: /usr/include/SFML/Graphics/Texture.hpp
src/Character.o: /usr/include/SFML/Graphics/Image.hpp
src/Character.o: /usr/include/SFML/Graphics/RenderStates.hpp
src/Character.o: /usr/include/SFML/Graphics/Transform.hpp
src/Character.o: /usr/include/SFML/Graphics/RenderTexture.hpp
src/Character.o: /usr/include/SFML/Graphics/RenderTarget.hpp
src/Character.o: /usr/include/SFML/Graphics/View.hpp
src/Character.o: /usr/include/SFML/Graphics/PrimitiveType.hpp
src/Character.o: /usr/include/SFML/Graphics/Vertex.hpp
src/Character.o: /usr/include/SFML/Graphics/RenderWindow.hpp
src/Character.o: /usr/include/SFML/Graphics/Shader.hpp
src/Character.o: /usr/include/SFML/Graphics/Shape.hpp
src/Character.o: /usr/include/SFML/Graphics/Drawable.hpp
src/Character.o: /usr/include/SFML/Graphics/Transformable.hpp
src/Character.o: /usr/include/SFML/Graphics/VertexArray.hpp
src/Character.o: /usr/include/SFML/Graphics/CircleShape.hpp
src/Character.o: /usr/include/SFML/Graphics/RectangleShape.hpp
src/Character.o: /usr/include/SFML/Graphics/ConvexShape.hpp
src/Character.o: /usr/include/SFML/Graphics/Sprite.hpp
src/Character.o: /usr/include/SFML/Graphics/Text.hpp src/Maze.hpp
src/Ghost.o: src/Ghost.hpp src/Animator.hpp /usr/include/SFML/Graphics.hpp
src/Ghost.o: /usr/include/SFML/Window.hpp /usr/include/SFML/System.hpp
src/Ghost.o: /usr/include/SFML/Config.hpp /usr/include/SFML/System/Clock.hpp
src/Ghost.o: /usr/include/SFML/System/Export.hpp
src/Ghost.o: /usr/include/SFML/System/Time.hpp
src/Ghost.o: /usr/include/SFML/System/Err.hpp
src/Ghost.o: /usr/include/SFML/System/InputStream.hpp
src/Ghost.o: /usr/include/SFML/System/Lock.hpp
src/Ghost.o: /usr/include/SFML/System/NonCopyable.hpp
src/Ghost.o: /usr/include/SFML/System/Mutex.hpp
src/Ghost.o: /usr/include/SFML/System/Sleep.hpp
src/Ghost.o: /usr/include/SFML/System/String.hpp
src/Ghost.o: /usr/include/SFML/System/Thread.hpp
src/Ghost.o: /usr/include/SFML/System/Thread.inl
src/Ghost.o: /usr/include/SFML/System/ThreadLocal.hpp
src/Ghost.o: /usr/include/SFML/System/ThreadLocalPtr.hpp
src/Ghost.o: /usr/include/SFML/System/ThreadLocalPtr.inl
src/Ghost.o: /usr/include/SFML/System/Utf.hpp
src/Ghost.o: /usr/include/SFML/System/Utf.inl
src/Ghost.o: /usr/include/SFML/System/Vector2.hpp
src/Ghost.o: /usr/include/SFML/System/Vector2.inl
src/Ghost.o: /usr/include/SFML/System/Vector3.hpp
src/Ghost.o: /usr/include/SFML/System/Vector3.inl
src/Ghost.o: /usr/include/SFML/Window/Context.hpp
src/Ghost.o: /usr/include/SFML/Window/Export.hpp
src/Ghost.o: /usr/include/SFML/Window/GlResource.hpp
src/Ghost.o: /usr/include/SFML/Window/ContextSettings.hpp
src/Ghost.o: /usr/include/SFML/Window/Event.hpp
src/Ghost.o: /usr/include/SFML/Window/Joystick.hpp
src/Ghost.o: /usr/include/SFML/Window/Keyboard.hpp
src/Ghost.o: /usr/include/SFML/Window/Mouse.hpp
src/Ghost.o: /usr/include/SFML/Window/VideoMode.hpp
src/Ghost.o: /usr/include/SFML/Window/Window.hpp
src/Ghost.o: /usr/include/SFML/Window/WindowHandle.hpp
src/Ghost.o: /usr/include/SFML/Window/WindowStyle.hpp
src/Ghost.o: /usr/include/SFML/Graphics/BlendMode.hpp
src/Ghost.o: /usr/include/SFML/Graphics/Color.hpp
src/Ghost.o: /usr/include/SFML/Graphics/Export.hpp
src/Ghost.o: /usr/include/SFML/Graphics/Font.hpp
src/Ghost.o: /usr/include/SFML/Graphics/Glyph.hpp
src/Ghost.o: /usr/include/SFML/Graphics/Rect.hpp
src/Ghost.o: /usr/include/SFML/Graphics/Rect.inl
src/Ghost.o: /usr/include/SFML/Graphics/Texture.hpp
src/Ghost.o: /usr/include/SFML/Graphics/Image.hpp
src/Ghost.o: /usr/include/SFML/Graphics/RenderStates.hpp
src/Ghost.o: /usr/include/SFML/Graphics/Transform.hpp
src/Ghost.o: /usr/include/SFML/Graphics/RenderTexture.hpp
src/Ghost.o: /usr/include/SFML/Graphics/RenderTarget.hpp
src/Ghost.o: /usr/include/SFML/Graphics/View.hpp
src/Ghost.o: /usr/include/SFML/Graphics/PrimitiveType.hpp
src/Ghost.o: /usr/include/SFML/Graphics/Vertex.hpp
src/Ghost.o: /usr/include/SFML/Graphics/RenderWindow.hpp
src/Ghost.o: /usr/include/SFML/Graphics/Shader.hpp
src/Ghost.o: /usr/include/SFML/Graphics/Shape.hpp
src/Ghost.o: /usr/include/SFML/Graphics/Drawable.hpp
src/Ghost.o: /usr/include/SFML/Graphics/Transformable.hpp
src/Ghost.o: /usr/include/SFML/Graphics/VertexArray.hpp
src/Ghost.o: /usr/include/SFML/Graphics/CircleShape.hpp
src/Ghost.o: /usr/include/SFML/Graphics/RectangleShape.hpp
src/Ghost.o: /usr/include/SFML/Graphics/ConvexShape.hpp
src/Ghost.o: /usr/include/SFML/Graphics/Sprite.hpp
src/Ghost.o: /usr/include/SFML/Graphics/Text.hpp src/PacWoman.hpp
src/Ghost.o: src/Character.hpp src/Maze.hpp
src/PacWoman.o: src/PacWoman.hpp src/Animator.hpp
src/PacWoman.o: /usr/include/SFML/Graphics.hpp /usr/include/SFML/Window.hpp
src/PacWoman.o: /usr/include/SFML/System.hpp /usr/include/SFML/Config.hpp
src/PacWoman.o: /usr/include/SFML/System/Clock.hpp
src/PacWoman.o: /usr/include/SFML/System/Export.hpp
src/PacWoman.o: /usr/include/SFML/System/Time.hpp
src/PacWoman.o: /usr/include/SFML/System/Err.hpp
src/PacWoman.o: /usr/include/SFML/System/InputStream.hpp
src/PacWoman.o: /usr/include/SFML/System/Lock.hpp
src/PacWoman.o: /usr/include/SFML/System/NonCopyable.hpp
src/PacWoman.o: /usr/include/SFML/System/Mutex.hpp
src/PacWoman.o: /usr/include/SFML/System/Sleep.hpp
src/PacWoman.o: /usr/include/SFML/System/String.hpp
src/PacWoman.o: /usr/include/SFML/System/Thread.hpp
src/PacWoman.o: /usr/include/SFML/System/Thread.inl
src/PacWoman.o: /usr/include/SFML/System/ThreadLocal.hpp
src/PacWoman.o: /usr/include/SFML/System/ThreadLocalPtr.hpp
src/PacWoman.o: /usr/include/SFML/System/ThreadLocalPtr.inl
src/PacWoman.o: /usr/include/SFML/System/Utf.hpp
src/PacWoman.o: /usr/include/SFML/System/Utf.inl
src/PacWoman.o: /usr/include/SFML/System/Vector2.hpp
src/PacWoman.o: /usr/include/SFML/System/Vector2.inl
src/PacWoman.o: /usr/include/SFML/System/Vector3.hpp
src/PacWoman.o: /usr/include/SFML/System/Vector3.inl
src/PacWoman.o: /usr/include/SFML/Window/Context.hpp
src/PacWoman.o: /usr/include/SFML/Window/Export.hpp
src/PacWoman.o: /usr/include/SFML/Window/GlResource.hpp
src/PacWoman.o: /usr/include/SFML/Window/ContextSettings.hpp
src/PacWoman.o: /usr/include/SFML/Window/Event.hpp
src/PacWoman.o: /usr/include/SFML/Window/Joystick.hpp
src/PacWoman.o: /usr/include/SFML/Window/Keyboard.hpp
src/PacWoman.o: /usr/include/SFML/Window/Mouse.hpp
src/PacWoman.o: /usr/include/SFML/Window/VideoMode.hpp
src/PacWoman.o: /usr/include/SFML/Window/Window.hpp
src/PacWoman.o: /usr/include/SFML/Window/WindowHandle.hpp
src/PacWoman.o: /usr/include/SFML/Window/WindowStyle.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/BlendMode.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/Color.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/Export.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/Font.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/Glyph.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/Rect.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/Rect.inl
src/PacWoman.o: /usr/include/SFML/Graphics/Texture.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/Image.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/RenderStates.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/Transform.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/RenderTexture.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/RenderTarget.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/View.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/PrimitiveType.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/Vertex.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/RenderWindow.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/Shader.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/Shape.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/Drawable.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/Transformable.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/VertexArray.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/CircleShape.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/RectangleShape.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/ConvexShape.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/Sprite.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/Text.hpp src/Character.hpp
src/PacWoman.o: src/Maze.hpp
src/Bonus.o: src/Bonus.hpp /usr/include/SFML/Graphics.hpp
src/Bonus.o: /usr/include/SFML/Window.hpp /usr/include/SFML/System.hpp
src/Bonus.o: /usr/include/SFML/Config.hpp /usr/include/SFML/System/Clock.hpp
src/Bonus.o: /usr/include/SFML/System/Export.hpp
src/Bonus.o: /usr/include/SFML/System/Time.hpp
src/Bonus.o: /usr/include/SFML/System/Err.hpp
src/Bonus.o: /usr/include/SFML/System/InputStream.hpp
src/Bonus.o: /usr/include/SFML/System/Lock.hpp
src/Bonus.o: /usr/include/SFML/System/NonCopyable.hpp
src/Bonus.o: /usr/include/SFML/System/Mutex.hpp
src/Bonus.o: /usr/include/SFML/System/Sleep.hpp
src/Bonus.o: /usr/include/SFML/System/String.hpp
src/Bonus.o: /usr/include/SFML/System/Thread.hpp
src/Bonus.o: /usr/include/SFML/System/Thread.inl
src/Bonus.o: /usr/include/SFML/System/ThreadLocal.hpp
src/Bonus.o: /usr/include/SFML/System/ThreadLocalPtr.hpp
src/Bonus.o: /usr/include/SFML/System/ThreadLocalPtr.inl
src/Bonus.o: /usr/include/SFML/System/Utf.hpp
src/Bonus.o: /usr/include/SFML/System/Utf.inl
src/Bonus.o: /usr/include/SFML/System/Vector2.hpp
src/Bonus.o: /usr/include/SFML/System/Vector2.inl
src/Bonus.o: /usr/include/SFML/System/Vector3.hpp
src/Bonus.o: /usr/include/SFML/System/Vector3.inl
src/Bonus.o: /usr/include/SFML/Window/Context.hpp
src/Bonus.o: /usr/include/SFML/Window/Export.hpp
src/Bonus.o: /usr/include/SFML/Window/GlResource.hpp
src/Bonus.o: /usr/include/SFML/Window/ContextSettings.hpp
src/Bonus.o: /usr/include/SFML/Window/Event.hpp
src/Bonus.o: /usr/include/SFML/Window/Joystick.hpp
src/Bonus.o: /usr/include/SFML/Window/Keyboard.hpp
src/Bonus.o: /usr/include/SFML/Window/Mouse.hpp
src/Bonus.o: /usr/include/SFML/Window/VideoMode.hpp
src/Bonus.o: /usr/include/SFML/Window/Window.hpp
src/Bonus.o: /usr/include/SFML/Window/WindowHandle.hpp
src/Bonus.o: /usr/include/SFML/Window/WindowStyle.hpp
src/Bonus.o: /usr/include/SFML/Graphics/BlendMode.hpp
src/Bonus.o: /usr/include/SFML/Graphics/Color.hpp
src/Bonus.o: /usr/include/SFML/Graphics/Export.hpp
src/Bonus.o: /usr/include/SFML/Graphics/Font.hpp
src/Bonus.o: /usr/include/SFML/Graphics/Glyph.hpp
src/Bonus.o: /usr/include/SFML/Graphics/Rect.hpp
src/Bonus.o: /usr/include/SFML/Graphics/Rect.inl
src/Bonus.o: /usr/include/SFML/Graphics/Texture.hpp
src/Bonus.o: /usr/include/SFML/Graphics/Image.hpp
src/Bonus.o: /usr/include/SFML/Graphics/RenderStates.hpp
src/Bonus.o: /usr/include/SFML/Graphics/Transform.hpp
src/Bonus.o: /usr/include/SFML/Graphics/RenderTexture.hpp
src/Bonus.o: /usr/include/SFML/Graphics/RenderTarget.hpp
src/Bonus.o: /usr/include/SFML/Graphics/View.hpp
src/Bonus.o: /usr/include/SFML/Graphics/PrimitiveType.hpp
src/Bonus.o: /usr/include/SFML/Graphics/Vertex.hpp
src/Bonus.o: /usr/include/SFML/Graphics/RenderWindow.hpp
src/Bonus.o: /usr/include/SFML/Graphics/Shader.hpp
src/Bonus.o: /usr/include/SFML/Graphics/Shape.hpp
src/Bonus.o: /usr/include/SFML/Graphics/Drawable.hpp
src/Bonus.o: /usr/include/SFML/Graphics/Transformable.hpp
src/Bonus.o: /usr/include/SFML/Graphics/VertexArray.hpp
src/Bonus.o: /usr/include/SFML/Graphics/CircleShape.hpp
src/Bonus.o: /usr/include/SFML/Graphics/RectangleShape.hpp
src/Bonus.o: /usr/include/SFML/Graphics/ConvexShape.hpp
src/Bonus.o: /usr/include/SFML/Graphics/Sprite.hpp
src/Bonus.o: /usr/include/SFML/Graphics/Text.hpp
src/Animator.o: src/Animator.hpp /usr/include/SFML/Graphics.hpp
src/Animator.o: /usr/include/SFML/Window.hpp /usr/include/SFML/System.hpp
src/Animator.o: /usr/include/SFML/Config.hpp
src/Animator.o: /usr/include/SFML/System/Clock.hpp
src/Animator.o: /usr/include/SFML/System/Export.hpp
src/Animator.o: /usr/include/SFML/System/Time.hpp
src/Animator.o: /usr/include/SFML/System/Err.hpp
src/Animator.o: /usr/include/SFML/System/InputStream.hpp
src/Animator.o: /usr/include/SFML/System/Lock.hpp
src/Animator.o: /usr/include/SFML/System/NonCopyable.hpp
src/Animator.o: /usr/include/SFML/System/Mutex.hpp
src/Animator.o: /usr/include/SFML/System/Sleep.hpp
src/Animator.o: /usr/include/SFML/System/String.hpp
src/Animator.o: /usr/include/SFML/System/Thread.hpp
src/Animator.o: /usr/include/SFML/System/Thread.inl
src/Animator.o: /usr/include/SFML/System/ThreadLocal.hpp
src/Animator.o: /usr/include/SFML/System/ThreadLocalPtr.hpp
src/Animator.o: /usr/include/SFML/System/ThreadLocalPtr.inl
src/Animator.o: /usr/include/SFML/System/Utf.hpp
src/Animator.o: /usr/include/SFML/System/Utf.inl
src/Animator.o: /usr/include/SFML/System/Vector2.hpp
src/Animator.o: /usr/include/SFML/System/Vector2.inl
src/Animator.o: /usr/include/SFML/System/Vector3.hpp
src/Animator.o: /usr/include/SFML/System/Vector3.inl
src/Animator.o: /usr/include/SFML/Window/Context.hpp
src/Animator.o: /usr/include/SFML/Window/Export.hpp
src/Animator.o: /usr/include/SFML/Window/GlResource.hpp
src/Animator.o: /usr/include/SFML/Window/ContextSettings.hpp
src/Animator.o: /usr/include/SFML/Window/Event.hpp
src/Animator.o: /usr/include/SFML/Window/Joystick.hpp
src/Animator.o: /usr/include/SFML/Window/Keyboard.hpp
src/Animator.o: /usr/include/SFML/Window/Mouse.hpp
src/Animator.o: /usr/include/SFML/Window/VideoMode.hpp
src/Animator.o: /usr/include/SFML/Window/Window.hpp
src/Animator.o: /usr/include/SFML/Window/WindowHandle.hpp
src/Animator.o: /usr/include/SFML/Window/WindowStyle.hpp
src/Animator.o: /usr/include/SFML/Graphics/BlendMode.hpp
src/Animator.o: /usr/include/SFML/Graphics/Color.hpp
src/Animator.o: /usr/include/SFML/Graphics/Export.hpp
src/Animator.o: /usr/include/SFML/Graphics/Font.hpp
src/Animator.o: /usr/include/SFML/Graphics/Glyph.hpp
src/Animator.o: /usr/include/SFML/Graphics/Rect.hpp
src/Animator.o: /usr/include/SFML/Graphics/Rect.inl
src/Animator.o: /usr/include/SFML/Graphics/Texture.hpp
src/Animator.o: /usr/include/SFML/Graphics/Image.hpp
src/Animator.o: /usr/include/SFML/Graphics/RenderStates.hpp
src/Animator.o: /usr/include/SFML/Graphics/Transform.hpp
src/Animator.o: /usr/include/SFML/Graphics/RenderTexture.hpp
src/Animator.o: /usr/include/SFML/Graphics/RenderTarget.hpp
src/Animator.o: /usr/include/SFML/Graphics/View.hpp
src/Animator.o: /usr/include/SFML/Graphics/PrimitiveType.hpp
src/Animator.o: /usr/include/SFML/Graphics/Vertex.hpp
src/Animator.o: /usr/include/SFML/Graphics/RenderWindow.hpp
src/Animator.o: /usr/include/SFML/Graphics/Shader.hpp
src/Animator.o: /usr/include/SFML/Graphics/Shape.hpp
src/Animator.o: /usr/include/SFML/Graphics/Drawable.hpp
src/Animator.o: /usr/include/SFML/Graphics/Transformable.hpp
src/Animator.o: /usr/include/SFML/Graphics/VertexArray.hpp
src/Animator.o: /usr/include/SFML/Graphics/CircleShape.hpp
src/Animator.o: /usr/include/SFML/Graphics/RectangleShape.hpp
src/Animator.o: /usr/include/SFML/Graphics/ConvexShape.hpp
src/Animator.o: /usr/include/SFML/Graphics/Sprite.hpp
src/Animator.o: /usr/include/SFML/Graphics/Text.hpp
src/Maze.o: src/Dot.hpp /usr/include/SFML/Graphics.hpp
src/Maze.o: /usr/include/SFML/Window.hpp /usr/include/SFML/System.hpp
src/Maze.o: /usr/include/SFML/Config.hpp /usr/include/SFML/System/Clock.hpp
src/Maze.o: /usr/include/SFML/System/Export.hpp
src/Maze.o: /usr/include/SFML/System/Time.hpp
src/Maze.o: /usr/include/SFML/System/Err.hpp
src/Maze.o: /usr/include/SFML/System/InputStream.hpp
src/Maze.o: /usr/include/SFML/System/Lock.hpp
src/Maze.o: /usr/include/SFML/System/NonCopyable.hpp
src/Maze.o: /usr/include/SFML/System/Mutex.hpp
src/Maze.o: /usr/include/SFML/System/Sleep.hpp
src/Maze.o: /usr/include/SFML/System/String.hpp
src/Maze.o: /usr/include/SFML/System/Thread.hpp
src/Maze.o: /usr/include/SFML/System/Thread.inl
src/Maze.o: /usr/include/SFML/System/ThreadLocal.hpp
src/Maze.o: /usr/include/SFML/System/ThreadLocalPtr.hpp
src/Maze.o: /usr/include/SFML/System/ThreadLocalPtr.inl
src/Maze.o: /usr/include/SFML/System/Utf.hpp /usr/include/SFML/System/Utf.inl
src/Maze.o: /usr/include/SFML/System/Vector2.hpp
src/Maze.o: /usr/include/SFML/System/Vector2.inl
src/Maze.o: /usr/include/SFML/System/Vector3.hpp
src/Maze.o: /usr/include/SFML/System/Vector3.inl
src/Maze.o: /usr/include/SFML/Window/Context.hpp
src/Maze.o: /usr/include/SFML/Window/Export.hpp
src/Maze.o: /usr/include/SFML/Window/GlResource.hpp
src/Maze.o: /usr/include/SFML/Window/ContextSettings.hpp
src/Maze.o: /usr/include/SFML/Window/Event.hpp
src/Maze.o: /usr/include/SFML/Window/Joystick.hpp
src/Maze.o: /usr/include/SFML/Window/Keyboard.hpp
src/Maze.o: /usr/include/SFML/Window/Mouse.hpp
src/Maze.o: /usr/include/SFML/Window/VideoMode.hpp
src/Maze.o: /usr/include/SFML/Window/Window.hpp
src/Maze.o: /usr/include/SFML/Window/WindowHandle.hpp
src/Maze.o: /usr/include/SFML/Window/WindowStyle.hpp
src/Maze.o: /usr/include/SFML/Graphics/BlendMode.hpp
src/Maze.o: /usr/include/SFML/Graphics/Color.hpp
src/Maze.o: /usr/include/SFML/Graphics/Export.hpp
src/Maze.o: /usr/include/SFML/Graphics/Font.hpp
src/Maze.o: /usr/include/SFML/Graphics/Glyph.hpp
src/Maze.o: /usr/include/SFML/Graphics/Rect.hpp
src/Maze.o: /usr/include/SFML/Graphics/Rect.inl
src/Maze.o: /usr/include/SFML/Graphics/Texture.hpp
src/Maze.o: /usr/include/SFML/Graphics/Image.hpp
src/Maze.o: /usr/include/SFML/Graphics/RenderStates.hpp
src/Maze.o: /usr/include/SFML/Graphics/Transform.hpp
src/Maze.o: /usr/include/SFML/Graphics/RenderTexture.hpp
src/Maze.o: /usr/include/SFML/Graphics/RenderTarget.hpp
src/Maze.o: /usr/include/SFML/Graphics/View.hpp
src/Maze.o: /usr/include/SFML/Graphics/PrimitiveType.hpp
src/Maze.o: /usr/include/SFML/Graphics/Vertex.hpp
src/Maze.o: /usr/include/SFML/Graphics/RenderWindow.hpp
src/Maze.o: /usr/include/SFML/Graphics/Shader.hpp
src/Maze.o: /usr/include/SFML/Graphics/Shape.hpp
src/Maze.o: /usr/include/SFML/Graphics/Drawable.hpp
src/Maze.o: /usr/include/SFML/Graphics/Transformable.hpp
src/Maze.o: /usr/include/SFML/Graphics/VertexArray.hpp
src/Maze.o: /usr/include/SFML/Graphics/CircleShape.hpp
src/Maze.o: /usr/include/SFML/Graphics/RectangleShape.hpp
src/Maze.o: /usr/include/SFML/Graphics/ConvexShape.hpp
src/Maze.o: /usr/include/SFML/Graphics/Sprite.hpp
src/Maze.o: /usr/include/SFML/Graphics/Text.hpp src/Maze.hpp
# DO NOT DELETE

src/game.o: src/game.hpp /usr/include/SFML/Graphics.hpp
src/game.o: /usr/include/SFML/Window.hpp /usr/include/SFML/System.hpp
src/game.o: /usr/include/SFML/Config.hpp /usr/include/SFML/System/Clock.hpp
src/game.o: /usr/include/SFML/System/Export.hpp
src/game.o: /usr/include/SFML/System/Time.hpp
src/game.o: /usr/include/SFML/System/Err.hpp
src/game.o: /usr/include/SFML/System/InputStream.hpp
src/game.o: /usr/include/SFML/System/Lock.hpp
src/game.o: /usr/include/SFML/System/NonCopyable.hpp
src/game.o: /usr/include/SFML/System/Mutex.hpp
src/game.o: /usr/include/SFML/System/Sleep.hpp
src/game.o: /usr/include/SFML/System/String.hpp
src/game.o: /usr/include/SFML/System/Thread.hpp
src/game.o: /usr/include/SFML/System/Thread.inl
src/game.o: /usr/include/SFML/System/ThreadLocal.hpp
src/game.o: /usr/include/SFML/System/ThreadLocalPtr.hpp
src/game.o: /usr/include/SFML/System/ThreadLocalPtr.inl
src/game.o: /usr/include/SFML/System/Utf.hpp /usr/include/SFML/System/Utf.inl
src/game.o: /usr/include/SFML/System/Vector2.hpp
src/game.o: /usr/include/SFML/System/Vector2.inl
src/game.o: /usr/include/SFML/System/Vector3.hpp
src/game.o: /usr/include/SFML/System/Vector3.inl
src/game.o: /usr/include/SFML/Window/Context.hpp
src/game.o: /usr/include/SFML/Window/Export.hpp
src/game.o: /usr/include/SFML/Window/GlResource.hpp
src/game.o: /usr/include/SFML/Window/ContextSettings.hpp
src/game.o: /usr/include/SFML/Window/Event.hpp
src/game.o: /usr/include/SFML/Window/Joystick.hpp
src/game.o: /usr/include/SFML/Window/Keyboard.hpp
src/game.o: /usr/include/SFML/Window/Mouse.hpp
src/game.o: /usr/include/SFML/Window/VideoMode.hpp
src/game.o: /usr/include/SFML/Window/Window.hpp
src/game.o: /usr/include/SFML/Window/WindowHandle.hpp
src/game.o: /usr/include/SFML/Window/WindowStyle.hpp
src/game.o: /usr/include/SFML/Graphics/BlendMode.hpp
src/game.o: /usr/include/SFML/Graphics/Color.hpp
src/game.o: /usr/include/SFML/Graphics/Export.hpp
src/game.o: /usr/include/SFML/Graphics/Font.hpp
src/game.o: /usr/include/SFML/Graphics/Glyph.hpp
src/game.o: /usr/include/SFML/Graphics/Rect.hpp
src/game.o: /usr/include/SFML/Graphics/Rect.inl
src/game.o: /usr/include/SFML/Graphics/Texture.hpp
src/game.o: /usr/include/SFML/Graphics/Image.hpp
src/game.o: /usr/include/SFML/Graphics/RenderStates.hpp
src/game.o: /usr/include/SFML/Graphics/Transform.hpp
src/game.o: /usr/include/SFML/Graphics/RenderTexture.hpp
src/game.o: /usr/include/SFML/Graphics/RenderTarget.hpp
src/game.o: /usr/include/SFML/Graphics/View.hpp
src/game.o: /usr/include/SFML/Graphics/PrimitiveType.hpp
src/game.o: /usr/include/SFML/Graphics/Vertex.hpp
src/game.o: /usr/include/SFML/Graphics/RenderWindow.hpp
src/game.o: /usr/include/SFML/Graphics/Shader.hpp
src/game.o: /usr/include/SFML/Graphics/Shape.hpp
src/game.o: /usr/include/SFML/Graphics/Drawable.hpp
src/game.o: /usr/include/SFML/Graphics/Transformable.hpp
src/game.o: /usr/include/SFML/Graphics/VertexArray.hpp
src/game.o: /usr/include/SFML/Graphics/CircleShape.hpp
src/game.o: /usr/include/SFML/Graphics/RectangleShape.hpp
src/game.o: /usr/include/SFML/Graphics/ConvexShape.hpp
src/game.o: /usr/include/SFML/Graphics/Sprite.hpp
src/game.o: /usr/include/SFML/Graphics/Text.hpp src/GameState.hpp
src/game.o: src/PacWoman.hpp src/Animator.hpp src/Character.hpp src/Maze.hpp
src/game.o: src/Ghost.hpp src/GhostStates.hpp
src/GameState.o: src/GameState.hpp /usr/include/SFML/Graphics.hpp
src/GameState.o: /usr/include/SFML/Window.hpp /usr/include/SFML/System.hpp
src/GameState.o: /usr/include/SFML/Config.hpp
src/GameState.o: /usr/include/SFML/System/Clock.hpp
src/GameState.o: /usr/include/SFML/System/Export.hpp
src/GameState.o: /usr/include/SFML/System/Time.hpp
src/GameState.o: /usr/include/SFML/System/Err.hpp
src/GameState.o: /usr/include/SFML/System/InputStream.hpp
src/GameState.o: /usr/include/SFML/System/Lock.hpp
src/GameState.o: /usr/include/SFML/System/NonCopyable.hpp
src/GameState.o: /usr/include/SFML/System/Mutex.hpp
src/GameState.o: /usr/include/SFML/System/Sleep.hpp
src/GameState.o: /usr/include/SFML/System/String.hpp
src/GameState.o: /usr/include/SFML/System/Thread.hpp
src/GameState.o: /usr/include/SFML/System/Thread.inl
src/GameState.o: /usr/include/SFML/System/ThreadLocal.hpp
src/GameState.o: /usr/include/SFML/System/ThreadLocalPtr.hpp
src/GameState.o: /usr/include/SFML/System/ThreadLocalPtr.inl
src/GameState.o: /usr/include/SFML/System/Utf.hpp
src/GameState.o: /usr/include/SFML/System/Utf.inl
src/GameState.o: /usr/include/SFML/System/Vector2.hpp
src/GameState.o: /usr/include/SFML/System/Vector2.inl
src/GameState.o: /usr/include/SFML/System/Vector3.hpp
src/GameState.o: /usr/include/SFML/System/Vector3.inl
src/GameState.o: /usr/include/SFML/Window/Context.hpp
src/GameState.o: /usr/include/SFML/Window/Export.hpp
src/GameState.o: /usr/include/SFML/Window/GlResource.hpp
src/GameState.o: /usr/include/SFML/Window/ContextSettings.hpp
src/GameState.o: /usr/include/SFML/Window/Event.hpp
src/GameState.o: /usr/include/SFML/Window/Joystick.hpp
src/GameState.o: /usr/include/SFML/Window/Keyboard.hpp
src/GameState.o: /usr/include/SFML/Window/Mouse.hpp
src/GameState.o: /usr/include/SFML/Window/VideoMode.hpp
src/GameState.o: /usr/include/SFML/Window/Window.hpp
src/GameState.o: /usr/include/SFML/Window/WindowHandle.hpp
src/GameState.o: /usr/include/SFML/Window/WindowStyle.hpp
src/GameState.o: /usr/include/SFML/Graphics/BlendMode.hpp
src/GameState.o: /usr/include/SFML/Graphics/Color.hpp
src/GameState.o: /usr/include/SFML/Graphics/Export.hpp
src/GameState.o: /usr/include/SFML/Graphics/Font.hpp
src/GameState.o: /usr/include/SFML/Graphics/Glyph.hpp
src/GameState.o: /usr/include/SFML/Graphics/Rect.hpp
src/GameState.o: /usr/include/SFML/Graphics/Rect.inl
src/GameState.o: /usr/include/SFML/Graphics/Texture.hpp
src/GameState.o: /usr/include/SFML/Graphics/Image.hpp
src/GameState.o: /usr/include/SFML/Graphics/RenderStates.hpp
src/GameState.o: /usr/include/SFML/Graphics/Transform.hpp
src/GameState.o: /usr/include/SFML/Graphics/RenderTexture.hpp
src/GameState.o: /usr/include/SFML/Graphics/RenderTarget.hpp
src/GameState.o: /usr/include/SFML/Graphics/View.hpp
src/GameState.o: /usr/include/SFML/Graphics/PrimitiveType.hpp
src/GameState.o: /usr/include/SFML/Graphics/Vertex.hpp
src/GameState.o: /usr/include/SFML/Graphics/RenderWindow.hpp
src/GameState.o: /usr/include/SFML/Graphics/Shader.hpp
src/GameState.o: /usr/include/SFML/Graphics/Shape.hpp
src/GameState.o: /usr/include/SFML/Graphics/Drawable.hpp
src/GameState.o: /usr/include/SFML/Graphics/Transformable.hpp
src/GameState.o: /usr/include/SFML/Graphics/VertexArray.hpp
src/GameState.o: /usr/include/SFML/Graphics/CircleShape.hpp
src/GameState.o: /usr/include/SFML/Graphics/RectangleShape.hpp
src/GameState.o: /usr/include/SFML/Graphics/ConvexShape.hpp
src/GameState.o: /usr/include/SFML/Graphics/Sprite.hpp
src/GameState.o: /usr/include/SFML/Graphics/Text.hpp src/PacWoman.hpp
src/GameState.o: src/Animator.hpp src/Character.hpp src/Maze.hpp
src/GameState.o: src/Ghost.hpp src/GhostStates.hpp src/game.hpp
src/Dot.o: src/Dot.hpp /usr/include/SFML/Graphics.hpp
src/Dot.o: /usr/include/SFML/Window.hpp /usr/include/SFML/System.hpp
src/Dot.o: /usr/include/SFML/Config.hpp /usr/include/SFML/System/Clock.hpp
src/Dot.o: /usr/include/SFML/System/Export.hpp
src/Dot.o: /usr/include/SFML/System/Time.hpp /usr/include/SFML/System/Err.hpp
src/Dot.o: /usr/include/SFML/System/InputStream.hpp
src/Dot.o: /usr/include/SFML/System/Lock.hpp
src/Dot.o: /usr/include/SFML/System/NonCopyable.hpp
src/Dot.o: /usr/include/SFML/System/Mutex.hpp
src/Dot.o: /usr/include/SFML/System/Sleep.hpp
src/Dot.o: /usr/include/SFML/System/String.hpp
src/Dot.o: /usr/include/SFML/System/Thread.hpp
src/Dot.o: /usr/include/SFML/System/Thread.inl
src/Dot.o: /usr/include/SFML/System/ThreadLocal.hpp
src/Dot.o: /usr/include/SFML/System/ThreadLocalPtr.hpp
src/Dot.o: /usr/include/SFML/System/ThreadLocalPtr.inl
src/Dot.o: /usr/include/SFML/System/Utf.hpp /usr/include/SFML/System/Utf.inl
src/Dot.o: /usr/include/SFML/System/Vector2.hpp
src/Dot.o: /usr/include/SFML/System/Vector2.inl
src/Dot.o: /usr/include/SFML/System/Vector3.hpp
src/Dot.o: /usr/include/SFML/System/Vector3.inl
src/Dot.o: /usr/include/SFML/Window/Context.hpp
src/Dot.o: /usr/include/SFML/Window/Export.hpp
src/Dot.o: /usr/include/SFML/Window/GlResource.hpp
src/Dot.o: /usr/include/SFML/Window/ContextSettings.hpp
src/Dot.o: /usr/include/SFML/Window/Event.hpp
src/Dot.o: /usr/include/SFML/Window/Joystick.hpp
src/Dot.o: /usr/include/SFML/Window/Keyboard.hpp
src/Dot.o: /usr/include/SFML/Window/Mouse.hpp
src/Dot.o: /usr/include/SFML/Window/VideoMode.hpp
src/Dot.o: /usr/include/SFML/Window/Window.hpp
src/Dot.o: /usr/include/SFML/Window/WindowHandle.hpp
src/Dot.o: /usr/include/SFML/Window/WindowStyle.hpp
src/Dot.o: /usr/include/SFML/Graphics/BlendMode.hpp
src/Dot.o: /usr/include/SFML/Graphics/Color.hpp
src/Dot.o: /usr/include/SFML/Graphics/Export.hpp
src/Dot.o: /usr/include/SFML/Graphics/Font.hpp
src/Dot.o: /usr/include/SFML/Graphics/Glyph.hpp
src/Dot.o: /usr/include/SFML/Graphics/Rect.hpp
src/Dot.o: /usr/include/SFML/Graphics/Rect.inl
src/Dot.o: /usr/include/SFML/Graphics/Texture.hpp
src/Dot.o: /usr/include/SFML/Graphics/Image.hpp
src/Dot.o: /usr/include/SFML/Graphics/RenderStates.hpp
src/Dot.o: /usr/include/SFML/Graphics/Transform.hpp
src/Dot.o: /usr/include/SFML/Graphics/RenderTexture.hpp
src/Dot.o: /usr/include/SFML/Graphics/RenderTarget.hpp
src/Dot.o: /usr/include/SFML/Graphics/View.hpp
src/Dot.o: /usr/include/SFML/Graphics/PrimitiveType.hpp
src/Dot.o: /usr/include/SFML/Graphics/Vertex.hpp
src/Dot.o: /usr/include/SFML/Graphics/RenderWindow.hpp
src/Dot.o: /usr/include/SFML/Graphics/Shader.hpp
src/Dot.o: /usr/include/SFML/Graphics/Shape.hpp
src/Dot.o: /usr/include/SFML/Graphics/Drawable.hpp
src/Dot.o: /usr/include/SFML/Graphics/Transformable.hpp
src/Dot.o: /usr/include/SFML/Graphics/VertexArray.hpp
src/Dot.o: /usr/include/SFML/Graphics/CircleShape.hpp
src/Dot.o: /usr/include/SFML/Graphics/RectangleShape.hpp
src/Dot.o: /usr/include/SFML/Graphics/ConvexShape.hpp
src/Dot.o: /usr/include/SFML/Graphics/Sprite.hpp
src/Dot.o: /usr/include/SFML/Graphics/Text.hpp
src/Character.o: src/Character.hpp /usr/include/SFML/Graphics.hpp
src/Character.o: /usr/include/SFML/Window.hpp /usr/include/SFML/System.hpp
src/Character.o: /usr/include/SFML/Config.hpp
src/Character.o: /usr/include/SFML/System/Clock.hpp
src/Character.o: /usr/include/SFML/System/Export.hpp
src/Character.o: /usr/include/SFML/System/Time.hpp
src/Character.o: /usr/include/SFML/System/Err.hpp
src/Character.o: /usr/include/SFML/System/InputStream.hpp
src/Character.o: /usr/include/SFML/System/Lock.hpp
src/Character.o: /usr/include/SFML/System/NonCopyable.hpp
src/Character.o: /usr/include/SFML/System/Mutex.hpp
src/Character.o: /usr/include/SFML/System/Sleep.hpp
src/Character.o: /usr/include/SFML/System/String.hpp
src/Character.o: /usr/include/SFML/System/Thread.hpp
src/Character.o: /usr/include/SFML/System/Thread.inl
src/Character.o: /usr/include/SFML/System/ThreadLocal.hpp
src/Character.o: /usr/include/SFML/System/ThreadLocalPtr.hpp
src/Character.o: /usr/include/SFML/System/ThreadLocalPtr.inl
src/Character.o: /usr/include/SFML/System/Utf.hpp
src/Character.o: /usr/include/SFML/System/Utf.inl
src/Character.o: /usr/include/SFML/System/Vector2.hpp
src/Character.o: /usr/include/SFML/System/Vector2.inl
src/Character.o: /usr/include/SFML/System/Vector3.hpp
src/Character.o: /usr/include/SFML/System/Vector3.inl
src/Character.o: /usr/include/SFML/Window/Context.hpp
src/Character.o: /usr/include/SFML/Window/Export.hpp
src/Character.o: /usr/include/SFML/Window/GlResource.hpp
src/Character.o: /usr/include/SFML/Window/ContextSettings.hpp
src/Character.o: /usr/include/SFML/Window/Event.hpp
src/Character.o: /usr/include/SFML/Window/Joystick.hpp
src/Character.o: /usr/include/SFML/Window/Keyboard.hpp
src/Character.o: /usr/include/SFML/Window/Mouse.hpp
src/Character.o: /usr/include/SFML/Window/VideoMode.hpp
src/Character.o: /usr/include/SFML/Window/Window.hpp
src/Character.o: /usr/include/SFML/Window/WindowHandle.hpp
src/Character.o: /usr/include/SFML/Window/WindowStyle.hpp
src/Character.o: /usr/include/SFML/Graphics/BlendMode.hpp
src/Character.o: /usr/include/SFML/Graphics/Color.hpp
src/Character.o: /usr/include/SFML/Graphics/Export.hpp
src/Character.o: /usr/include/SFML/Graphics/Font.hpp
src/Character.o: /usr/include/SFML/Graphics/Glyph.hpp
src/Character.o: /usr/include/SFML/Graphics/Rect.hpp
src/Character.o: /usr/include/SFML/Graphics/Rect.inl
src/Character.o: /usr/include/SFML/Graphics/Texture.hpp
src/Character.o: /usr/include/SFML/Graphics/Image.hpp
src/Character.o: /usr/include/SFML/Graphics/RenderStates.hpp
src/Character.o: /usr/include/SFML/Graphics/Transform.hpp
src/Character.o: /usr/include/SFML/Graphics/RenderTexture.hpp
src/Character.o: /usr/include/SFML/Graphics/RenderTarget.hpp
src/Character.o: /usr/include/SFML/Graphics/View.hpp
src/Character.o: /usr/include/SFML/Graphics/PrimitiveType.hpp
src/Character.o: /usr/include/SFML/Graphics/Vertex.hpp
src/Character.o: /usr/include/SFML/Graphics/RenderWindow.hpp
src/Character.o: /usr/include/SFML/Graphics/Shader.hpp
src/Character.o: /usr/include/SFML/Graphics/Shape.hpp
src/Character.o: /usr/include/SFML/Graphics/Drawable.hpp
src/Character.o: /usr/include/SFML/Graphics/Transformable.hpp
src/Character.o: /usr/include/SFML/Graphics/VertexArray.hpp
src/Character.o: /usr/include/SFML/Graphics/CircleShape.hpp
src/Character.o: /usr/include/SFML/Graphics/RectangleShape.hpp
src/Character.o: /usr/include/SFML/Graphics/ConvexShape.hpp
src/Character.o: /usr/include/SFML/Graphics/Sprite.hpp
src/Character.o: /usr/include/SFML/Graphics/Text.hpp src/Maze.hpp
src/Ghost.o: src/Ghost.hpp src/Animator.hpp /usr/include/SFML/Graphics.hpp
src/Ghost.o: /usr/include/SFML/Window.hpp /usr/include/SFML/System.hpp
src/Ghost.o: /usr/include/SFML/Config.hpp /usr/include/SFML/System/Clock.hpp
src/Ghost.o: /usr/include/SFML/System/Export.hpp
src/Ghost.o: /usr/include/SFML/System/Time.hpp
src/Ghost.o: /usr/include/SFML/System/Err.hpp
src/Ghost.o: /usr/include/SFML/System/InputStream.hpp
src/Ghost.o: /usr/include/SFML/System/Lock.hpp
src/Ghost.o: /usr/include/SFML/System/NonCopyable.hpp
src/Ghost.o: /usr/include/SFML/System/Mutex.hpp
src/Ghost.o: /usr/include/SFML/System/Sleep.hpp
src/Ghost.o: /usr/include/SFML/System/String.hpp
src/Ghost.o: /usr/include/SFML/System/Thread.hpp
src/Ghost.o: /usr/include/SFML/System/Thread.inl
src/Ghost.o: /usr/include/SFML/System/ThreadLocal.hpp
src/Ghost.o: /usr/include/SFML/System/ThreadLocalPtr.hpp
src/Ghost.o: /usr/include/SFML/System/ThreadLocalPtr.inl
src/Ghost.o: /usr/include/SFML/System/Utf.hpp
src/Ghost.o: /usr/include/SFML/System/Utf.inl
src/Ghost.o: /usr/include/SFML/System/Vector2.hpp
src/Ghost.o: /usr/include/SFML/System/Vector2.inl
src/Ghost.o: /usr/include/SFML/System/Vector3.hpp
src/Ghost.o: /usr/include/SFML/System/Vector3.inl
src/Ghost.o: /usr/include/SFML/Window/Context.hpp
src/Ghost.o: /usr/include/SFML/Window/Export.hpp
src/Ghost.o: /usr/include/SFML/Window/GlResource.hpp
src/Ghost.o: /usr/include/SFML/Window/ContextSettings.hpp
src/Ghost.o: /usr/include/SFML/Window/Event.hpp
src/Ghost.o: /usr/include/SFML/Window/Joystick.hpp
src/Ghost.o: /usr/include/SFML/Window/Keyboard.hpp
src/Ghost.o: /usr/include/SFML/Window/Mouse.hpp
src/Ghost.o: /usr/include/SFML/Window/VideoMode.hpp
src/Ghost.o: /usr/include/SFML/Window/Window.hpp
src/Ghost.o: /usr/include/SFML/Window/WindowHandle.hpp
src/Ghost.o: /usr/include/SFML/Window/WindowStyle.hpp
src/Ghost.o: /usr/include/SFML/Graphics/BlendMode.hpp
src/Ghost.o: /usr/include/SFML/Graphics/Color.hpp
src/Ghost.o: /usr/include/SFML/Graphics/Export.hpp
src/Ghost.o: /usr/include/SFML/Graphics/Font.hpp
src/Ghost.o: /usr/include/SFML/Graphics/Glyph.hpp
src/Ghost.o: /usr/include/SFML/Graphics/Rect.hpp
src/Ghost.o: /usr/include/SFML/Graphics/Rect.inl
src/Ghost.o: /usr/include/SFML/Graphics/Texture.hpp
src/Ghost.o: /usr/include/SFML/Graphics/Image.hpp
src/Ghost.o: /usr/include/SFML/Graphics/RenderStates.hpp
src/Ghost.o: /usr/include/SFML/Graphics/Transform.hpp
src/Ghost.o: /usr/include/SFML/Graphics/RenderTexture.hpp
src/Ghost.o: /usr/include/SFML/Graphics/RenderTarget.hpp
src/Ghost.o: /usr/include/SFML/Graphics/View.hpp
src/Ghost.o: /usr/include/SFML/Graphics/PrimitiveType.hpp
src/Ghost.o: /usr/include/SFML/Graphics/Vertex.hpp
src/Ghost.o: /usr/include/SFML/Graphics/RenderWindow.hpp
src/Ghost.o: /usr/include/SFML/Graphics/Shader.hpp
src/Ghost.o: /usr/include/SFML/Graphics/Shape.hpp
src/Ghost.o: /usr/include/SFML/Graphics/Drawable.hpp
src/Ghost.o: /usr/include/SFML/Graphics/Transformable.hpp
src/Ghost.o: /usr/include/SFML/Graphics/VertexArray.hpp
src/Ghost.o: /usr/include/SFML/Graphics/CircleShape.hpp
src/Ghost.o: /usr/include/SFML/Graphics/RectangleShape.hpp
src/Ghost.o: /usr/include/SFML/Graphics/ConvexShape.hpp
src/Ghost.o: /usr/include/SFML/Graphics/Sprite.hpp
src/Ghost.o: /usr/include/SFML/Graphics/Text.hpp src/PacWoman.hpp
src/Ghost.o: src/Character.hpp src/Maze.hpp src/GhostStates.hpp
src/PacWoman.o: src/PacWoman.hpp src/Animator.hpp
src/PacWoman.o: /usr/include/SFML/Graphics.hpp /usr/include/SFML/Window.hpp
src/PacWoman.o: /usr/include/SFML/System.hpp /usr/include/SFML/Config.hpp
src/PacWoman.o: /usr/include/SFML/System/Clock.hpp
src/PacWoman.o: /usr/include/SFML/System/Export.hpp
src/PacWoman.o: /usr/include/SFML/System/Time.hpp
src/PacWoman.o: /usr/include/SFML/System/Err.hpp
src/PacWoman.o: /usr/include/SFML/System/InputStream.hpp
src/PacWoman.o: /usr/include/SFML/System/Lock.hpp
src/PacWoman.o: /usr/include/SFML/System/NonCopyable.hpp
src/PacWoman.o: /usr/include/SFML/System/Mutex.hpp
src/PacWoman.o: /usr/include/SFML/System/Sleep.hpp
src/PacWoman.o: /usr/include/SFML/System/String.hpp
src/PacWoman.o: /usr/include/SFML/System/Thread.hpp
src/PacWoman.o: /usr/include/SFML/System/Thread.inl
src/PacWoman.o: /usr/include/SFML/System/ThreadLocal.hpp
src/PacWoman.o: /usr/include/SFML/System/ThreadLocalPtr.hpp
src/PacWoman.o: /usr/include/SFML/System/ThreadLocalPtr.inl
src/PacWoman.o: /usr/include/SFML/System/Utf.hpp
src/PacWoman.o: /usr/include/SFML/System/Utf.inl
src/PacWoman.o: /usr/include/SFML/System/Vector2.hpp
src/PacWoman.o: /usr/include/SFML/System/Vector2.inl
src/PacWoman.o: /usr/include/SFML/System/Vector3.hpp
src/PacWoman.o: /usr/include/SFML/System/Vector3.inl
src/PacWoman.o: /usr/include/SFML/Window/Context.hpp
src/PacWoman.o: /usr/include/SFML/Window/Export.hpp
src/PacWoman.o: /usr/include/SFML/Window/GlResource.hpp
src/PacWoman.o: /usr/include/SFML/Window/ContextSettings.hpp
src/PacWoman.o: /usr/include/SFML/Window/Event.hpp
src/PacWoman.o: /usr/include/SFML/Window/Joystick.hpp
src/PacWoman.o: /usr/include/SFML/Window/Keyboard.hpp
src/PacWoman.o: /usr/include/SFML/Window/Mouse.hpp
src/PacWoman.o: /usr/include/SFML/Window/VideoMode.hpp
src/PacWoman.o: /usr/include/SFML/Window/Window.hpp
src/PacWoman.o: /usr/include/SFML/Window/WindowHandle.hpp
src/PacWoman.o: /usr/include/SFML/Window/WindowStyle.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/BlendMode.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/Color.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/Export.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/Font.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/Glyph.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/Rect.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/Rect.inl
src/PacWoman.o: /usr/include/SFML/Graphics/Texture.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/Image.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/RenderStates.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/Transform.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/RenderTexture.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/RenderTarget.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/View.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/PrimitiveType.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/Vertex.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/RenderWindow.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/Shader.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/Shape.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/Drawable.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/Transformable.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/VertexArray.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/CircleShape.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/RectangleShape.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/ConvexShape.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/Sprite.hpp
src/PacWoman.o: /usr/include/SFML/Graphics/Text.hpp src/Character.hpp
src/PacWoman.o: src/Maze.hpp
src/Bonus.o: src/Bonus.hpp /usr/include/SFML/Graphics.hpp
src/Bonus.o: /usr/include/SFML/Window.hpp /usr/include/SFML/System.hpp
src/Bonus.o: /usr/include/SFML/Config.hpp /usr/include/SFML/System/Clock.hpp
src/Bonus.o: /usr/include/SFML/System/Export.hpp
src/Bonus.o: /usr/include/SFML/System/Time.hpp
src/Bonus.o: /usr/include/SFML/System/Err.hpp
src/Bonus.o: /usr/include/SFML/System/InputStream.hpp
src/Bonus.o: /usr/include/SFML/System/Lock.hpp
src/Bonus.o: /usr/include/SFML/System/NonCopyable.hpp
src/Bonus.o: /usr/include/SFML/System/Mutex.hpp
src/Bonus.o: /usr/include/SFML/System/Sleep.hpp
src/Bonus.o: /usr/include/SFML/System/String.hpp
src/Bonus.o: /usr/include/SFML/System/Thread.hpp
src/Bonus.o: /usr/include/SFML/System/Thread.inl
src/Bonus.o: /usr/include/SFML/System/ThreadLocal.hpp
src/Bonus.o: /usr/include/SFML/System/ThreadLocalPtr.hpp
src/Bonus.o: /usr/include/SFML/System/ThreadLocalPtr.inl
src/Bonus.o: /usr/include/SFML/System/Utf.hpp
src/Bonus.o: /usr/include/SFML/System/Utf.inl
src/Bonus.o: /usr/include/SFML/System/Vector2.hpp
src/Bonus.o: /usr/include/SFML/System/Vector2.inl
src/Bonus.o: /usr/include/SFML/System/Vector3.hpp
src/Bonus.o: /usr/include/SFML/System/Vector3.inl
src/Bonus.o: /usr/include/SFML/Window/Context.hpp
src/Bonus.o: /usr/include/SFML/Window/Export.hpp
src/Bonus.o: /usr/include/SFML/Window/GlResource.hpp
src/Bonus.o: /usr/include/SFML/Window/ContextSettings.hpp
src/Bonus.o: /usr/include/SFML/Window/Event.hpp
src/Bonus.o: /usr/include/SFML/Window/Joystick.hpp
src/Bonus.o: /usr/include/SFML/Window/Keyboard.hpp
src/Bonus.o: /usr/include/SFML/Window/Mouse.hpp
src/Bonus.o: /usr/include/SFML/Window/VideoMode.hpp
src/Bonus.o: /usr/include/SFML/Window/Window.hpp
src/Bonus.o: /usr/include/SFML/Window/WindowHandle.hpp
src/Bonus.o: /usr/include/SFML/Window/WindowStyle.hpp
src/Bonus.o: /usr/include/SFML/Graphics/BlendMode.hpp
src/Bonus.o: /usr/include/SFML/Graphics/Color.hpp
src/Bonus.o: /usr/include/SFML/Graphics/Export.hpp
src/Bonus.o: /usr/include/SFML/Graphics/Font.hpp
src/Bonus.o: /usr/include/SFML/Graphics/Glyph.hpp
src/Bonus.o: /usr/include/SFML/Graphics/Rect.hpp
src/Bonus.o: /usr/include/SFML/Graphics/Rect.inl
src/Bonus.o: /usr/include/SFML/Graphics/Texture.hpp
src/Bonus.o: /usr/include/SFML/Graphics/Image.hpp
src/Bonus.o: /usr/include/SFML/Graphics/RenderStates.hpp
src/Bonus.o: /usr/include/SFML/Graphics/Transform.hpp
src/Bonus.o: /usr/include/SFML/Graphics/RenderTexture.hpp
src/Bonus.o: /usr/include/SFML/Graphics/RenderTarget.hpp
src/Bonus.o: /usr/include/SFML/Graphics/View.hpp
src/Bonus.o: /usr/include/SFML/Graphics/PrimitiveType.hpp
src/Bonus.o: /usr/include/SFML/Graphics/Vertex.hpp
src/Bonus.o: /usr/include/SFML/Graphics/RenderWindow.hpp
src/Bonus.o: /usr/include/SFML/Graphics/Shader.hpp
src/Bonus.o: /usr/include/SFML/Graphics/Shape.hpp
src/Bonus.o: /usr/include/SFML/Graphics/Drawable.hpp
src/Bonus.o: /usr/include/SFML/Graphics/Transformable.hpp
src/Bonus.o: /usr/include/SFML/Graphics/VertexArray.hpp
src/Bonus.o: /usr/include/SFML/Graphics/CircleShape.hpp
src/Bonus.o: /usr/include/SFML/Graphics/RectangleShape.hpp
src/Bonus.o: /usr/include/SFML/Graphics/ConvexShape.hpp
src/Bonus.o: /usr/include/SFML/Graphics/Sprite.hpp
src/Bonus.o: /usr/include/SFML/Graphics/Text.hpp
src/Animator.o: src/Animator.hpp /usr/include/SFML/Graphics.hpp
src/Animator.o: /usr/include/SFML/Window.hpp /usr/include/SFML/System.hpp
src/Animator.o: /usr/include/SFML/Config.hpp
src/Animator.o: /usr/include/SFML/System/Clock.hpp
src/Animator.o: /usr/include/SFML/System/Export.hpp
src/Animator.o: /usr/include/SFML/System/Time.hpp
src/Animator.o: /usr/include/SFML/System/Err.hpp
src/Animator.o: /usr/include/SFML/System/InputStream.hpp
src/Animator.o: /usr/include/SFML/System/Lock.hpp
src/Animator.o: /usr/include/SFML/System/NonCopyable.hpp
src/Animator.o: /usr/include/SFML/System/Mutex.hpp
src/Animator.o: /usr/include/SFML/System/Sleep.hpp
src/Animator.o: /usr/include/SFML/System/String.hpp
src/Animator.o: /usr/include/SFML/System/Thread.hpp
src/Animator.o: /usr/include/SFML/System/Thread.inl
src/Animator.o: /usr/include/SFML/System/ThreadLocal.hpp
src/Animator.o: /usr/include/SFML/System/ThreadLocalPtr.hpp
src/Animator.o: /usr/include/SFML/System/ThreadLocalPtr.inl
src/Animator.o: /usr/include/SFML/System/Utf.hpp
src/Animator.o: /usr/include/SFML/System/Utf.inl
src/Animator.o: /usr/include/SFML/System/Vector2.hpp
src/Animator.o: /usr/include/SFML/System/Vector2.inl
src/Animator.o: /usr/include/SFML/System/Vector3.hpp
src/Animator.o: /usr/include/SFML/System/Vector3.inl
src/Animator.o: /usr/include/SFML/Window/Context.hpp
src/Animator.o: /usr/include/SFML/Window/Export.hpp
src/Animator.o: /usr/include/SFML/Window/GlResource.hpp
src/Animator.o: /usr/include/SFML/Window/ContextSettings.hpp
src/Animator.o: /usr/include/SFML/Window/Event.hpp
src/Animator.o: /usr/include/SFML/Window/Joystick.hpp
src/Animator.o: /usr/include/SFML/Window/Keyboard.hpp
src/Animator.o: /usr/include/SFML/Window/Mouse.hpp
src/Animator.o: /usr/include/SFML/Window/VideoMode.hpp
src/Animator.o: /usr/include/SFML/Window/Window.hpp
src/Animator.o: /usr/include/SFML/Window/WindowHandle.hpp
src/Animator.o: /usr/include/SFML/Window/WindowStyle.hpp
src/Animator.o: /usr/include/SFML/Graphics/BlendMode.hpp
src/Animator.o: /usr/include/SFML/Graphics/Color.hpp
src/Animator.o: /usr/include/SFML/Graphics/Export.hpp
src/Animator.o: /usr/include/SFML/Graphics/Font.hpp
src/Animator.o: /usr/include/SFML/Graphics/Glyph.hpp
src/Animator.o: /usr/include/SFML/Graphics/Rect.hpp
src/Animator.o: /usr/include/SFML/Graphics/Rect.inl
src/Animator.o: /usr/include/SFML/Graphics/Texture.hpp
src/Animator.o: /usr/include/SFML/Graphics/Image.hpp
src/Animator.o: /usr/include/SFML/Graphics/RenderStates.hpp
src/Animator.o: /usr/include/SFML/Graphics/Transform.hpp
src/Animator.o: /usr/include/SFML/Graphics/RenderTexture.hpp
src/Animator.o: /usr/include/SFML/Graphics/RenderTarget.hpp
src/Animator.o: /usr/include/SFML/Graphics/View.hpp
src/Animator.o: /usr/include/SFML/Graphics/PrimitiveType.hpp
src/Animator.o: /usr/include/SFML/Graphics/Vertex.hpp
src/Animator.o: /usr/include/SFML/Graphics/RenderWindow.hpp
src/Animator.o: /usr/include/SFML/Graphics/Shader.hpp
src/Animator.o: /usr/include/SFML/Graphics/Shape.hpp
src/Animator.o: /usr/include/SFML/Graphics/Drawable.hpp
src/Animator.o: /usr/include/SFML/Graphics/Transformable.hpp
src/Animator.o: /usr/include/SFML/Graphics/VertexArray.hpp
src/Animator.o: /usr/include/SFML/Graphics/CircleShape.hpp
src/Animator.o: /usr/include/SFML/Graphics/RectangleShape.hpp
src/Animator.o: /usr/include/SFML/Graphics/ConvexShape.hpp
src/Animator.o: /usr/include/SFML/Graphics/Sprite.hpp
src/Animator.o: /usr/include/SFML/Graphics/Text.hpp
src/Maze.o: src/Dot.hpp /usr/include/SFML/Graphics.hpp
src/Maze.o: /usr/include/SFML/Window.hpp /usr/include/SFML/System.hpp
src/Maze.o: /usr/include/SFML/Config.hpp /usr/include/SFML/System/Clock.hpp
src/Maze.o: /usr/include/SFML/System/Export.hpp
src/Maze.o: /usr/include/SFML/System/Time.hpp
src/Maze.o: /usr/include/SFML/System/Err.hpp
src/Maze.o: /usr/include/SFML/System/InputStream.hpp
src/Maze.o: /usr/include/SFML/System/Lock.hpp
src/Maze.o: /usr/include/SFML/System/NonCopyable.hpp
src/Maze.o: /usr/include/SFML/System/Mutex.hpp
src/Maze.o: /usr/include/SFML/System/Sleep.hpp
src/Maze.o: /usr/include/SFML/System/String.hpp
src/Maze.o: /usr/include/SFML/System/Thread.hpp
src/Maze.o: /usr/include/SFML/System/Thread.inl
src/Maze.o: /usr/include/SFML/System/ThreadLocal.hpp
src/Maze.o: /usr/include/SFML/System/ThreadLocalPtr.hpp
src/Maze.o: /usr/include/SFML/System/ThreadLocalPtr.inl
src/Maze.o: /usr/include/SFML/System/Utf.hpp /usr/include/SFML/System/Utf.inl
src/Maze.o: /usr/include/SFML/System/Vector2.hpp
src/Maze.o: /usr/include/SFML/System/Vector2.inl
src/Maze.o: /usr/include/SFML/System/Vector3.hpp
src/Maze.o: /usr/include/SFML/System/Vector3.inl
src/Maze.o: /usr/include/SFML/Window/Context.hpp
src/Maze.o: /usr/include/SFML/Window/Export.hpp
src/Maze.o: /usr/include/SFML/Window/GlResource.hpp
src/Maze.o: /usr/include/SFML/Window/ContextSettings.hpp
src/Maze.o: /usr/include/SFML/Window/Event.hpp
src/Maze.o: /usr/include/SFML/Window/Joystick.hpp
src/Maze.o: /usr/include/SFML/Window/Keyboard.hpp
src/Maze.o: /usr/include/SFML/Window/Mouse.hpp
src/Maze.o: /usr/include/SFML/Window/VideoMode.hpp
src/Maze.o: /usr/include/SFML/Window/Window.hpp
src/Maze.o: /usr/include/SFML/Window/WindowHandle.hpp
src/Maze.o: /usr/include/SFML/Window/WindowStyle.hpp
src/Maze.o: /usr/include/SFML/Graphics/BlendMode.hpp
src/Maze.o: /usr/include/SFML/Graphics/Color.hpp
src/Maze.o: /usr/include/SFML/Graphics/Export.hpp
src/Maze.o: /usr/include/SFML/Graphics/Font.hpp
src/Maze.o: /usr/include/SFML/Graphics/Glyph.hpp
src/Maze.o: /usr/include/SFML/Graphics/Rect.hpp
src/Maze.o: /usr/include/SFML/Graphics/Rect.inl
src/Maze.o: /usr/include/SFML/Graphics/Texture.hpp
src/Maze.o: /usr/include/SFML/Graphics/Image.hpp
src/Maze.o: /usr/include/SFML/Graphics/RenderStates.hpp
src/Maze.o: /usr/include/SFML/Graphics/Transform.hpp
src/Maze.o: /usr/include/SFML/Graphics/RenderTexture.hpp
src/Maze.o: /usr/include/SFML/Graphics/RenderTarget.hpp
src/Maze.o: /usr/include/SFML/Graphics/View.hpp
src/Maze.o: /usr/include/SFML/Graphics/PrimitiveType.hpp
src/Maze.o: /usr/include/SFML/Graphics/Vertex.hpp
src/Maze.o: /usr/include/SFML/Graphics/RenderWindow.hpp
src/Maze.o: /usr/include/SFML/Graphics/Shader.hpp
src/Maze.o: /usr/include/SFML/Graphics/Shape.hpp
src/Maze.o: /usr/include/SFML/Graphics/Drawable.hpp
src/Maze.o: /usr/include/SFML/Graphics/Transformable.hpp
src/Maze.o: /usr/include/SFML/Graphics/VertexArray.hpp
src/Maze.o: /usr/include/SFML/Graphics/CircleShape.hpp
src/Maze.o: /usr/include/SFML/Graphics/RectangleShape.hpp
src/Maze.o: /usr/include/SFML/Graphics/ConvexShape.hpp
src/Maze.o: /usr/include/SFML/Graphics/Sprite.hpp
src/Maze.o: /usr/include/SFML/Graphics/Text.hpp src/Maze.hpp
