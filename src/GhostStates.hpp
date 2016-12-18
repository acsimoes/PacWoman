#ifndef ABC_HPP
#define ABC_HPP

#include "Maze.hpp"
#include "Ghost.hpp"
#include <forward_list>
#include <map>

// States:
// Strong (Chasing)
// Weak (Running Away)
// Dead (returning Home)

class Ghost;

class GhostState
{

	private:

	protected:
		sf::Vector2i m_currentCell;
		sf::Vector2i m_goalCell;
		std::forward_list<sf::Vector2i> *m_path;

		const Maze* m_maze;

	public:
		GhostState(const Maze* maze);
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
		PacWoman* m_pacWoman;
		bool m_killPlayer;

	public:
		Chase(const Maze* maze, PacWoman* pacWoman);
		~Chase();

		void enter(Ghost* m_ghost);
		void execute(Ghost* m_ghost, sf::Time delta);
		void exit(Ghost* m_ghost);

		void setUpdateDelay(sf::Time delay);
};

class Evade : public GhostState
{
	private:
		sf::Time m_timeBuffer;
		PacWoman* m_pacWoman;
		float m_safeDistance;
		sf::Vector2i m_endOfPath;

	public:
		Evade(const Maze* maze, PacWoman* pacWoman);
		~Evade();

		void enter(Ghost* m_ghost);
		void execute(Ghost* m_ghost, sf::Time delta);
		void exit(Ghost* m_ghost);

		void setSafeDistance(float distance);
};

class Dead : public GhostState
{
	private:
		sf::Vector2i m_homeCell;
		bool m_atHome;
		sf::Time m_timeBuffer;
		sf::Time m_deadDuration;

	public:
		Dead(const Maze* maze, sf::Vector2i home);
		~Dead();

		void enter(Ghost* m_ghost);
		void execute(Ghost* m_ghost, sf::Time delta);
		void exit(Ghost* m_ghost);

		void setDeadDuration(sf::Time time);
};

#endif // ABC_HPP
