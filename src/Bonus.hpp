#ifndef PACWOMAN_BONUS_HPP
#define PACWOMAN_BONUS_HPP

#include <SFML/Graphics.hpp>

class Bonus : public sf::Drawable, public sf::Transformable
{
	
private:
	
	sf::Sprite m_visual;
		
	void draw(sf::RenderTarget& target, sf::RenderStates states) const;

public:
	
	enum Fruit
	{
		Banana,
		Apple,
		Cherry
	};
		
	Bonus(sf::Texture& texture);
	void setFruit(Fruit fruit);
};

#endif // PACWOMAN_BONUS_HPP
