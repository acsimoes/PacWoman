#ifndef CHARACTER_HPP
#define CHARACTER_HPP

#include <SFML/Graphics.hpp>
#include "Maze.hpp"

class Character : public sf::Drawable, public sf::Transformable
{
	
private:
	float m_speed;
	sf::Vector2i m_currentDirection;
	sf::Vector2i m_nextDirection;
	Maze* m_maze;

public:
	Character();
	
	void setSpeed (float speed);
	float getSpeed() const;
	virtual void update(sf::Time delta);
	void setDirection(sf::Vector2i direction);
	sf::Vector2i getDirection() const;
	void setMaze(Maze* maze);
	
};

#endif // CHARACTER_HPP
