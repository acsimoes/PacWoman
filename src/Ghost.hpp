#ifndef GHOST_HPP
#define GHOST_HPP

#include "Animator.hpp"
#include "PacWoman.hpp" 
#include "Character.hpp"
#include "GhostStates.hpp"

enum State
		{
			ChaseState,
			EvadeState,
			DeadState,
			Count
		};

class GhostState;

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

	GhostState* m_currentState;
	std::array<GhostState*, Count> m_ghostStates;

	public:
	
	// enum State
	// {
	// 	Strong,
	// 	Weak
	// };
	
	Ghost(sf::Texture& texture, PacWoman *pacWoman);
	~Ghost();
	
	void setWeak(sf::Time duration);
	bool isWeak() const;
	
	void update(sf::Time delta);

	void changeDirection();

	void instanciateStates();
	void changeState(State state);
	
	
};
#endif // GHOST_HPP
