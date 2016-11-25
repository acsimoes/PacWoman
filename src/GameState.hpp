#ifndef PACWOMAN_GAMESTATE_HPP
#define PACWOMAN_GAMESTATE_HPP

#include <SFML/Graphics.hpp>
#include "PacWoman.hpp"
#include "Ghost.hpp"
#include "Maze.hpp"


struct ScoreTable
{
	const int dot = 5;
	const int superDot = 25;
	const int ghost = 100;
	const int bonus = 500;
};
class Game;

class GameState
{
	public:
	
	enum State
	{
		NoCoin,
		GetReady,
		Playing,
		Won,
		Lost,
		Count
	};
	
	GameState (Game* game);	
	virtual ~GameState();
	Game* getGame() const;
		
	virtual void insertCoin()=0;
	virtual void pressButton()=0;
	virtual void moveStick(sf::Vector2i direction)=0;
	virtual void update(sf::Time delta)=0;
	virtual void draw(sf::RenderWindow& window)=0;
		
	private:
			Game* m_game;
};


class NoCoinState : public GameState
{
public:

	NoCoinState (Game* game);
	~NoCoinState();
	
	void insertCoin();
	void pressButton();
	void moveStick(sf::Vector2i direction);
	void update(sf::Time Delta);
	void draw(sf::RenderWindow& window);
	
	private:
	sf::Text m_text;
	sf::Sprite m_sprite;
	
	bool m_displayText;
};

class PlayingState : public GameState
{
public:

	PlayingState (Game* game);
	~PlayingState();
	
	void insertCoin();
	void pressButton();
	void moveStick(sf::Vector2i direction);
	void update(sf::Time Delta);
	void draw(sf::RenderWindow& window);

	void moveCharactersToInitialPosition();
	void updateCameraPosition();

	void loadNextLevel();
	void resetToZero();
	void resetLiveCount();
	void resetCurrentLevel();
	
	private:
	PacWoman* m_pacWoman;
	std::vector<Ghost*> m_ghosts;
	Maze m_maze;

	sf::View m_camera;
	sf::RenderTexture m_scene;

	sf::Text m_scoreText;
	sf::Text m_levelText;
	sf::Text m_remainingDotsText;
	sf::Sprite m_liveSprite[3];

	int m_currentLevel;
	int m_remainingDots;
	int m_liveCount;
	int m_score;
	ScoreTable m_scoreTable;
};

class GetReadyState : public GameState
{
public:

	GetReadyState (Game* game, GameState* playingState);
	~GetReadyState();
	
	void insertCoin();
	void pressButton();
	void moveStick(sf::Vector2i direction);
	void update(sf::Time Delta);
	void draw(sf::RenderWindow& window);
	
	private:
	sf::Text m_text;
	PlayingState* m_playingState;
		
};

class LostState : public GameState
{
public:

	LostState (Game* game, GameState* playingState);
	~LostState();
	
	void insertCoin();
	void pressButton();
	void moveStick(sf::Vector2i direction);
	void update(sf::Time Delta);
	void draw(sf::RenderWindow& window);
	
	private:
	sf::Text m_text;
	sf::Time m_countDown;
	sf::Text m_countDownText;
	PlayingState* m_playingState;
};

class WonState : public GameState
{
public:

	WonState (Game* game, GameState* playingState);
	~WonState();
	
	void insertCoin();
	void pressButton();
	void moveStick(sf::Vector2i direction);
	void update(sf::Time Delta);
	void draw(sf::RenderWindow& window);
	
	private:
	sf::Text m_text;
	PlayingState* m_playingState;
};

# endif // PACWOMAN_GAMESTATE_HPP
