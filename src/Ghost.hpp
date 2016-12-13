#ifndef GHOST_HPP
#define GHOST_HPP

#include "Animator.hpp"
#include "PacWoman.hpp" 
#include "Character.hpp"
#include "GhostStates.hpp"

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

	Chase* m_chaseState;
	Evade*  m_evadeState;
	Dead* m_deadState;

	GhostState* m_currentState;

	public:
	
	enum State
	{
		Strong,
		Weak
	};
	
	Ghost(sf::Texture& texture, PacWoman *pacWoman);
	
	void setWeak(sf::Time duration);
	bool isWeak() const;
	
	void update(sf::Time delta);

	void changeDirection();
	void instanciateStates();
	
	
};
#endif // GHOST_HPP
