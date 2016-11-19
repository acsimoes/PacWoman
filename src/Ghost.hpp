#ifndef GHOST_HPP
#define GHOST_HPP

#include "Animator.hpp"
#include "PacWoman.hpp" 
#include "Character.hpp"

class Ghost : public Character
{

	private:
	void draw(sf::RenderTarget& target, sf::RenderStates states) const;
	
	sf::Sprite m_visual;

	bool m_isWeak;
	sf::Time m_weaknessDuration;
	PacWoman* m_pacWoman;
	
	Animator m_strongAnimator;
	Animator m_weakAnimator;

	public:
	
	enum State
	{
		Strong,
		Weak
	};
	
	Ghost(sf::Texture& texture);
	
	void setWeak(sf::Time duration);
	bool isWeak() const;
	
	void update(sf::Time delta);
	
	
};
#endif // GHOST_HPP
