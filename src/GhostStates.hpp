#ifndef GHOST_STATES_HPP
#define GHOST_STATES_HPP

#include "Maze.hpp"
#include "Ghost.hpp"
#include <forward_list>

// States:
// Strong (Chasing)
// Weak (Running Away)
// Dead (returning Home)
class Ghost;

class GhostState
{

	private:

	protected:
		friend class Ghost;
		sf::Vector2i m_homeCell;
		sf::Vector2i m_currentCell;
		sf::Vector2i m_goalCell;

		const Maze* m_maze;

	public:
		GhostState();
		virtual ~GhostState();

		virtual void enter(Ghost* m_ghost);
		virtual void execute(Ghost* m_ghost, sf::Time delta);
		virtual void exit(Ghost* m_ghost);

};

class Chase : public GhostState
{
	private:
		sf::Time m_timeBuffer;
		sf::Time m_updateGoalDelay;
		std::forward_list<sf::Vector2i> m_path;

	public:
		Chase();
		~Chase();

		void enter(Ghost* m_ghost);
		void execute(Ghost* m_ghost, sf::Time delta);
		void exit(Ghost* m_ghost);

		void searchPath();
};

class Evade : public GhostState
{

};

class Dead : public GhostState
{

};
#endif // GHOST_HPP
