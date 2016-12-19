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
		PacWoman* m_pacWoman;
		sf::Vector2i m_homeCell;
		float m_MAXSPEED;

		const Maze* m_maze;

	public:
		GhostState(const Maze* maze, PacWoman* pacWoman, sf::Vector2i home);
		virtual ~GhostState();

		virtual void enter(Ghost* m_ghost);
		virtual void execute(Ghost* m_ghost, sf::Time delta);
		virtual void exit(Ghost* m_ghost);

		void setMaxSpeed(float speed);
};

class Chase : public GhostState
{
	private:
		sf::Time m_timeBuffer;
		sf::Time m_updateGoalDelay;
		bool m_killPlayer;

	public:
		Chase(const Maze* maze, PacWoman* pacWoman, sf::Vector2i);
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
		float m_safeDistance;
		sf::Vector2i m_endOfPath;

	public:
		Evade(const Maze* maze, PacWoman* pacWoman, sf::Vector2i);
		~Evade();

		void enter(Ghost* m_ghost);
		void execute(Ghost* m_ghost, sf::Time delta);
		void exit(Ghost* m_ghost);

		void setSafeDistance(float distance);
};

class Dead : public GhostState
{
	private:
		bool m_atHome;
		sf::Time m_timeBuffer;
		sf::Time m_deadDuration;

	public:
		Dead(const Maze* maze, PacWoman* pacWoman, sf::Vector2i home);
		~Dead();

		void enter(Ghost* m_ghost);
		void execute(Ghost* m_ghost, sf::Time delta);
		void exit(Ghost* m_ghost);

		void setDeadDuration(sf::Time time);
};

#endif // ABC_HPP
