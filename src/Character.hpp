#ifndef CHARACTER_HPP
#define CHARACTER_HPP

#include <SFML/Graphics.hpp>

class Character : public sf::Drawable, public sf::Transformable
{
	
private:
	float m_speed;

public:
	Character();
	
	void setSpeed (float speed);
	float getSpeed() const;
	
};

#endif // CHARACTER_HPP
