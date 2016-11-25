#ifndef PACWOMAN_HPP
#define PACWOMAN_HPP

#include "Animator.hpp"
#include "PacWoman.hpp"
#include "Character.hpp"

class PacWoman : public Character

{

	private:
	void draw(sf::RenderTarget& target, sf::RenderStates states) const;
	
	sf::Sprite m_visual;
	bool m_isDying;
	bool m_isDead;
	
	Animator m_runAnimator;
	Animator m_dieAnimator;


	public:
	PacWoman(sf::Texture& texture); 
	void die();
	void reset();
	
	bool isDying() const;
	bool isDead() const;
	
	void update(sf::Time delta); 
	
};

#endif // PACWOMAN_PACWOMAN_HPP
