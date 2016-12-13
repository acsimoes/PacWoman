#ifndef CHARACTER_HPP
#define CHARACTER_HPP

#include <SFML/Graphics.hpp>
#include "Maze.hpp"
#include <array>

class Character : public sf::Drawable, public sf::Transformable
{
	
private:
	float m_speed;
	sf::Vector2i m_currentDirection;
	sf::Vector2i m_nextDirection;
	Maze* m_maze;

protected:
	virtual void changeDirection(){};

public:
	Character();
	
	void setSpeed (float speed);
	float getSpeed() const;
	virtual void update(sf::Time delta);
	void setDirection(sf::Vector2i direction);
	sf::Vector2i getDirection() const;
	void setMaze(Maze* maze);
	Maze* getMaze() const;
	bool willMove();
	sf::FloatRect getCollisionBox() const;

	sf::Vector2i m_previousIntersection;
	std::array<bool, 4> m_availableDirections;
	
};

#endif // CHARACTER_HPP
