#include "Character.hpp"
#include <iostream>

Character::Character()
:m_speed(50.f),
 m_currentDirection(0,0),
 m_nextDirection(0,0),
 m_maze(nullptr),
 m_previousIntersection(0,0)
{
}

void Character::setSpeed(float speed)
{
	m_speed = speed;
}

float Character::getSpeed() const 
{
	return m_speed;
}

void Character::update(sf::Time delta)
{
	sf::Vector2f pixelPosition = getPosition();				// getPosition from Transformable parent class

	float pixelTraveled = getSpeed() * delta.asSeconds();

	sf::Vector2f nextPixelPosition = pixelPosition + sf::Vector2f(m_currentDirection)*pixelTraveled;

	sf::Vector2i cellPosition = m_maze->mapPixelToCell(pixelPosition);

	// sf::Vector2i nextcell = m_maze->mapPixelToCell(nextPixelPosition);
	// if(cellPosition != nextcell)
	// 	std::cout << "cellPosition = (" << nextcell.x << ", " << nextcell.y << ")\n";

	sf::Vector2f offset;
	offset.x = std::fmod(nextPixelPosition.x, 32) -16;
	offset.y = std::fmod(nextPixelPosition.y, 32) -16;

	if(m_maze->isWall(cellPosition + m_currentDirection))
	{
		if((m_currentDirection.x == 1 && offset.x > 0) ||
			(m_currentDirection.x == -1 && offset.x < 0) ||
			(m_currentDirection.y == 1 && offset.y > 0) ||
			(m_currentDirection.y == -1 && offset.y < 0))
		{
			nextPixelPosition = m_maze->mapCellToPixel(cellPosition);
		}
	}

	setPosition(nextPixelPosition);


	if(!m_maze->isWall(cellPosition + m_nextDirection) && (m_currentDirection != m_nextDirection))
	{
		if(((offset.x > -2 && offset.x < 2)) ||
			((offset.y > -2 && offset.y < 2)))
		{	
			setPosition(m_maze->mapCellToPixel(cellPosition));
			m_currentDirection = m_nextDirection;

			if(m_currentDirection == sf::Vector2i(1, 0))
			{
				setRotation(0);
				setScale(-1,1);
			}else if(m_currentDirection == sf::Vector2i(0,1))
			{
				setRotation(90);
				setScale(-1,1);
			}else if(m_currentDirection == sf::Vector2i(-1,0))
			{
				setRotation(0);
				setScale(1,1);
			}else if(m_currentDirection == sf::Vector2i(0,-1))
			{
				setRotation(90);
				setScale(1,1);
			}
		}
	}

}
void Character::setDirection(sf::Vector2i direction)
{        
	m_nextDirection = direction;
}

sf::Vector2i Character::getDirection() const
{
	return m_currentDirection;
}

void Character::setMaze(Maze *maze)
{
	m_maze = maze;
}

Maze* Character::getMaze() const
{
	return m_maze;
}

bool Character::willMove(){
	return !m_maze->isWall(m_previousIntersection + m_nextDirection);
}

sf::FloatRect Character::getCollisionBox() const
{
	sf::FloatRect bounds(3, 3, 34, 34);
	return getTransform().transformRect(bounds);
}