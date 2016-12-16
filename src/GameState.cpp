#include "GameState.hpp"
#include "game.hpp"
#include <iostream>

template <typename T>
void centerOrigin(T& drawable)
{
	sf::FloatRect bound = drawable.getLocalBounds();
	drawable.setOrigin(bound.width/2, bound.height/2);
}

GameState::GameState(Game* game)
:m_game(game)
{
}

GameState::~GameState()
{
}

NoCoinState::NoCoinState(Game* game)
:GameState(game)
{
	m_sprite.setTexture(game->getLogo());
	m_sprite.setPosition(20, 50);
	
	m_text.setFont(game->getFont());
	m_text.setString("Insert coin!");
	
	centerOrigin(m_text);
	m_text.setPosition(240, 150);
	
	m_displayText = true;	
}

NoCoinState::~NoCoinState()
{
}

GetReadyState::GetReadyState(Game* game, GameState* playingState)
:GameState(game),
 m_playingState(static_cast<PlayingState*>(playingState))
{
	m_text.setFont(game->getFont());
	m_text.setString("Press Start when you're ready...");
	m_text.setCharacterSize(14);
	
	centerOrigin(m_text);
	m_text.setPosition(240, 240);
}

GetReadyState::~GetReadyState()
{
}


PlayingState::PlayingState(Game* game)
:GameState(game)
, m_pacWoman(nullptr)
, m_maze(game->getTexture())
, m_currentLevel(0)
, m_remainingDots(0)
, m_liveCount(3)
, m_score(0)
{
	

	m_pacWoman = new PacWoman(game->getTexture());
	m_pacWoman->setMaze(&m_maze);


	m_camera.setSize(sf::Vector2f(480,480));
	m_scene.create(480,480);

	m_scoreText.setFont(game->getFont());
	m_scoreText.setCharacterSize(10);
	m_scoreText.setPosition(10,480);

	m_levelText.setFont(game->getFont());
	m_levelText.setCharacterSize(10);
	m_levelText.setPosition(160, 480);

	m_remainingDotsText.setFont(game->getFont());
	m_remainingDotsText.setCharacterSize(10);
	m_remainingDotsText.setPosition(280, 480);

	for(auto& liveSprite: m_liveSprite)
	{
		liveSprite.setTexture(game->getTexture());
		liveSprite.setTextureRect(sf::IntRect(122, 0, 20, 20));
	}
	m_liveSprite[0].setPosition(sf::Vector2f(415, 480));
	m_liveSprite[1].setPosition(sf::Vector2f(435, 480));
	m_liveSprite[2].setPosition(sf::Vector2f(455, 480));

	resetToZero();
}

PlayingState::~PlayingState()
{
	delete m_pacWoman;

	for(uint i = 0; i < m_ghosts.size(); i++)
	{
		delete m_ghosts[i];
	}

}


WonState::WonState(Game* game, GameState* playingState)
:GameState(game)
, m_playingState(static_cast<PlayingState*>(playingState))
{
	m_text.setFont(game->getFont());
	m_text.setString("You Won!");
	m_text.setCharacterSize(42);
	
	centerOrigin(m_text);
	m_text.setPosition(240, 120);
}

WonState::~WonState()
{
}


LostState::LostState(Game* game, GameState* playingState)
:GameState(game)
, m_playingState(static_cast<PlayingState*>(playingState))
{
	m_text.setFont(game->getFont());
	m_text.setString("You lost!");
	m_text.setCharacterSize(42);
	
	centerOrigin(m_text);
	m_text.setPosition(240, 120);
	
	m_countDownText.setFont(game->getFont());
	m_countDownText.setCharacterSize(12);
	
	centerOrigin(m_countDownText);
	m_countDownText.setPosition(100, 240);
}

LostState::~LostState()
{
}


Game* GameState::getGame() const
{
	return m_game;
}

void NoCoinState::insertCoin()
{
	getGame()->changeGameState(GameState::GetReady);
}
void NoCoinState::pressButton()
{
	getGame()->changeGameState(GameState::Test);
}
void NoCoinState::moveStick(sf::Vector2i direction)
{
	
}

void NoCoinState::update(sf::Time delta)
{
	static sf::Time timeBuffer = sf::Time::Zero;
	timeBuffer += delta;
	
	while (timeBuffer >= sf::seconds(0.5))
	{
		m_displayText = !m_displayText;
		timeBuffer -= sf::seconds(1);
	}	
}
void NoCoinState::draw(sf::RenderWindow& window)
{
	window.draw(m_sprite);
	
	if (m_displayText)
		window.draw(m_text);
}

//------------------------------------------------------------- GET READY STATE---------------------------------
void GetReadyState::insertCoin()
{
	getGame()->changeGameState(GameState::Test);
}
void GetReadyState::pressButton()
{
	getGame()->changeGameState(GameState::Playing);
}
void GetReadyState::moveStick(sf::Vector2i direction)
{
	if (direction.x == -1)
		getGame()->changeGameState(GameState::Lost);
	else if (direction.x == 1)
	{
		m_playingState->loadNextLevel();
		// getGame()->changeGameState(GameState::Won);
	}
}
void GetReadyState::update(sf::Time delta)
{
	m_playingState->update(sf::seconds(0));
}
void GetReadyState::draw(sf::RenderWindow& window)
{
	m_playingState->draw(window);
	window.draw(m_text);
}

//----------------------------------------- PLAYING STATE----------------------------------------------

void PlayingState::insertCoin()
{
	// std::cout << "m_pacWoman.die() triggered\n";
	// m_pacWoman.die();
}
void PlayingState::pressButton()
{
	// m_ghost.setWeak(sf::seconds(3));
}
void PlayingState::moveStick(sf::Vector2i direction)
{
	// std::cout << "Moving Stick. Direction = (" << direction.x << ", " << direction.y << ")\n";
	m_pacWoman->setDirection(direction);
}
void PlayingState::update(sf::Time delta)
{	
	m_pacWoman->update(delta);

	for(Ghost* ghost : m_ghosts)
		ghost->update(delta);

	sf::Vector2f pixelPosition = m_pacWoman->getPosition();
	sf::Vector2f offset(std::fmod(pixelPosition.x, 32), std::fmod(pixelPosition.y, 32));
	offset -= sf::Vector2f(16, 16);
	if(offset.x <= 5 && offset.x >= -5 && offset.y <= 5 && offset.y >= -5)
	{
		sf::Vector2i cellPosition = m_maze.mapPixelToCell(pixelPosition);

		if(m_maze.isDot(cellPosition))
		{
			m_score += m_scoreTable.dot;
			m_remainingDots--;
		}
		else if(m_maze.isSuperDot(cellPosition))
		{
			m_score += m_scoreTable.superDot;
			m_remainingDots--;

			for(Ghost* ghost : m_ghosts)
				ghost->setWeak(sf::seconds(5));
		}
		else if(m_maze.isBonus(cellPosition))
		{
			m_score += m_scoreTable.bonus;
		}
		else if(m_maze.isEmpty(cellPosition))
		{
		}
		
		m_maze.pickObject(cellPosition);
	}

	for (Ghost* ghost : m_ghosts)
	{

		sf::FloatRect instersection;
		if(ghost->getCollisionBox().intersects(m_pacWoman->getCollisionBox(), instersection))
		{
			if(ghost->isWeak())
			{
				std::cout << "kill Ghost\n";
				//Ghost dies
				m_ghosts.erase(std::find(m_ghosts.begin(), m_ghosts.end(), ghost));
				m_score += m_scoreTable.ghost;
			}else
			{
				std::cout << "kill Pac-Woman\n";
				//Pac-Woman dies
				m_pacWoman->die();
			}
		}
	}

	if(m_pacWoman->isDead())
	{
		//level reset
		m_pacWoman->reset();

		m_liveCount--;

		if(m_liveCount == 0)
			getGame()->changeGameState(GameState::Lost);
		else
			moveCharactersToInitialPosition();
	}
	updateCameraPosition();

	//Check if Won
	if(m_remainingDots == 0)
	{
		loadNextLevel();
		getGame()->changeGameState(GameState::Won);
	}

	// Update HUD
	m_scoreText.setString(std::to_string(m_score) + " points");
	m_remainingDotsText.setString(std::to_string(m_remainingDots) + "x Dots");

}
void PlayingState::draw(sf::RenderWindow& window)
{
	// Game scene
	m_scene.setView(m_camera);
	m_scene.draw(m_maze);
	m_scene.draw(*m_pacWoman);
	for(Ghost* ghost : m_ghosts)
		m_scene.draw(*ghost);	
	m_scene.display();

	//Draw entire window (game scene + HUD)
	window.draw(sf::Sprite(m_scene.getTexture()));
	window.draw(m_scoreText);
	window.draw(m_levelText);
	window.draw(m_remainingDotsText);

	for(int i=0; i < m_liveCount; i++)
		window.draw(m_liveSprite[i]);    
}

void PlayingState::moveCharactersToInitialPosition(){
	m_pacWoman->setPosition(m_maze.mapCellToPixel(m_maze.getPacWomanPosition()));

	auto ghostPosition = m_maze.getGhostPositions();
	for (uint i = 0; i < m_ghosts.size(); i++){
		m_ghosts[i]->setPosition(m_maze.mapCellToPixel(ghostPosition[i]));
	}

	updateCameraPosition();
}

void PlayingState::updateCameraPosition()
{
	m_camera.setCenter(m_pacWoman->getPosition());
	sf::Vector2u windowSize = getGame()->getWindowSize() - sf::Vector2u(0,20);			//vector(0,20) is the HUD space

	//We need to clip the view to the boundaries of the maze
	// Left and Top
	if(m_camera.getCenter().x < (int)windowSize.x/2)
		m_camera.setCenter(windowSize.x/2, (int)m_camera.getCenter().y);
	if(m_camera.getCenter().y < windowSize.y/2)
		m_camera.setCenter(m_camera.getCenter().x, windowSize.y/2);

	// Right and bottom
	if(m_camera.getCenter().x > m_maze.getSize().x*32 - windowSize.x/2)
		m_camera.setCenter(m_maze.getSize().x*32 - windowSize.x/2, m_camera.getCenter().y);
	if(m_camera.getCenter().y > m_maze.getSize().y*32 - windowSize.y/2)
		m_camera.setCenter(m_camera.getCenter(). x,m_maze.getSize().y*32 - windowSize.y/2);
}

void PlayingState::loadNextLevel()
{
	m_currentLevel++;

	int mapLevel = m_currentLevel % 3;
	int speedLevel = std::floor(m_currentLevel / 3);

	// Load new Maze level
	switch(mapLevel)
	{
		case 0:
			m_maze.loadLevel("small");
			break;
		case 1:
			m_maze.loadLevel("medium");
			break;
		case 2:
			m_maze.loadLevel("large");
	}

	//Change Speed according to new level
	float speed = 100 + (speedLevel * 50);

	// Destroy previous characters
	for(Ghost* ghost : m_ghosts)
		delete ghost;
	m_ghosts.clear();
	
	// reposition pacWoman
	auto pacWomanPosition = m_maze.getPacWomanPosition();
	m_pacWoman->setPosition(m_maze.mapCellToPixel(pacWomanPosition));
	m_pacWoman->setSpeed(speed+25);

	// create new Ghosts
	for(auto ghostPosition: m_maze.getGhostPositions())
	{
		Ghost* ghost = new Ghost(getGame()->getTexture(), m_pacWoman);
		ghost->setMaze(&m_maze);
		ghost->setPosition(m_maze.mapCellToPixel(ghostPosition));
		ghost->setSpeed(speed);
		ghost->instanciateStates();
		m_ghosts.push_back(ghost);
	}

	m_camera.setCenter(m_pacWoman->getPosition());

	moveCharactersToInitialPosition();

	m_remainingDots = m_maze.getRemainingDots();

	// Update HUD - Level Text
	m_levelText.setString("level " + std::to_string(speedLevel) + " - " + std::to_string(mapLevel+1));
}

void PlayingState::resetToZero()
{
	resetLiveCount();

	m_currentLevel = 0;
	resetCurrentLevel();

	m_score = 0;
}

void PlayingState::resetLiveCount()
{
	m_liveCount = 3;
}

void PlayingState::resetCurrentLevel()
{
	m_currentLevel--;
	loadNextLevel();
}

//------------------------------------- WON STATE ------------------------------///

void WonState::insertCoin()
{
	
}
void WonState::pressButton()
{
	
}
void WonState::moveStick(sf::Vector2i direction)
{
	
}
void WonState::update(sf::Time delta)
{
	static sf::Time timeBuffer = sf::Time::Zero;
	timeBuffer += delta;
	
	if (timeBuffer.asSeconds() > 5)
	{
		getGame()->changeGameState(GameState::GetReady);
	}
			
}
void WonState::draw(sf::RenderWindow& window)
{
	window.draw(m_text);
}

//------------------------------------LOST_STATE------------------------------------------------------
void LostState::insertCoin()
{
	m_playingState->resetCurrentLevel();
	m_playingState->resetLiveCount();

	getGame()->changeGameState(GameState::GetReady);
}
void LostState::pressButton()
{
	
}
void LostState::moveStick(sf::Vector2i direction)
{
	
}
void LostState::update(sf::Time delta)
{
	m_countDown += delta;
	
	if (m_countDown.asSeconds() >= 10)
	{
		m_playingState->resetToZero();
		getGame()->changeGameState(GameState::NoCoin);
	}
	
	m_countDownText.setString("Insert a coin to continue... " + std::to_string(10- static_cast<int>(m_countDown.asSeconds())));
	
}
void LostState::draw(sf::RenderWindow& window)
{
	window.draw(m_text);
    window.draw(m_countDownText);
}


//------------------------------------------ TestState Class ---------------------------------------------- //
TestState::TestState(Game* game)
:GameState(game)
, m_pacWoman(nullptr)
, m_maze(game->getTexture())
, m_currentLevel(0)
, m_remainingDots(0)
, m_liveCount(3)
, m_score(0)
{
	

	m_pacWoman = new PacWoman(game->getTexture());
	m_pacWoman->setMaze(&m_maze);
	m_pacWoman->setSpeed(0.0);


	m_camera.setSize(sf::Vector2f(480,480));
	m_scene.create(480,480);

	m_scoreText.setFont(game->getFont());
	m_scoreText.setCharacterSize(10);
	m_scoreText.setPosition(10,480);

	m_levelText.setFont(game->getFont());
	m_levelText.setCharacterSize(10);
	m_levelText.setPosition(160, 480);

	m_remainingDotsText.setFont(game->getFont());
	m_remainingDotsText.setCharacterSize(10);
	m_remainingDotsText.setPosition(280, 480);

	for(auto& liveSprite: m_liveSprite)
	{
		liveSprite.setTexture(game->getTexture());
		liveSprite.setTextureRect(sf::IntRect(122, 0, 20, 20));
	}
	m_liveSprite[0].setPosition(sf::Vector2f(415, 480));
	m_liveSprite[1].setPosition(sf::Vector2f(435, 480));
	m_liveSprite[2].setPosition(sf::Vector2f(455, 480));

	resetToZero();
}

TestState::~TestState()
{
	delete m_pacWoman;

	for(uint i = 0; i < m_ghosts.size(); i++)
	{
		delete m_ghosts[i];
	}

}

void TestState::insertCoin()
{
	for(Ghost* ghost : m_ghosts)
		ghost->changeState(DeadState);
}
void TestState::pressButton()
{
	m_pacWoman->reset();
	resetToZero();
}
void TestState::moveStick(sf::Vector2i direction)
{
	// std::cout << "Moving Stick. Direction = (" << direction.x << ", " << direction.y << ")\n";
	sf::Vector2f pacWomanPosition = m_pacWoman->getPosition();
	sf::Vector2i pacWomanCell = m_maze.mapPixelToCell(pacWomanPosition);
	sf::Vector2i nextPacWomanCell = pacWomanCell + direction;
	sf::Vector2f nextPacWomanPosition = m_maze.mapCellToPixel(nextPacWomanCell);

	m_pacWoman->setPosition(nextPacWomanPosition);
}
void TestState::update(sf::Time delta)
{	
	m_pacWoman->update(delta);

	for(Ghost* ghost : m_ghosts)
		ghost->update(delta);

	for (Ghost* ghost : m_ghosts)
	{

		sf::FloatRect instersection;
		if(ghost->getCollisionBox().intersects(m_pacWoman->getCollisionBox(), instersection))
		{
			if(ghost->isWeak())
			{
				std::cout << "kill Ghost\n";
				//Ghost dies
				m_ghosts.erase(std::find(m_ghosts.begin(), m_ghosts.end(), ghost));
				m_score += m_scoreTable.ghost;
			}else
			{
				std::cout << "kill Pac-Woman\n";
				//Pac-Woman dies
				m_pacWoman->die();
			}
		}
	}

	updateCameraPosition();

	// Update HUD
	m_scoreText.setString(std::to_string(m_score) + " points");
	m_remainingDotsText.setString(std::to_string(m_remainingDots) + "x Dots");

}
void TestState::draw(sf::RenderWindow& window)
{
	// Game scene
	m_scene.setView(m_camera);
	m_scene.draw(m_maze);
	m_scene.draw(*m_pacWoman);
	for(Ghost* ghost : m_ghosts)
		m_scene.draw(*ghost);	
	m_scene.display();

	//Draw entire window (game scene + HUD)
	window.draw(sf::Sprite(m_scene.getTexture()));
	window.draw(m_scoreText);
	window.draw(m_levelText);
	window.draw(m_remainingDotsText);

	for(int i=0; i < m_liveCount; i++)
		window.draw(m_liveSprite[i]);    
}

void TestState::moveCharactersToInitialPosition(){
	m_pacWoman->setPosition(m_maze.mapCellToPixel(m_maze.getPacWomanPosition()));

	auto ghostPosition = m_maze.getGhostPositions();
	for (uint i = 0; i < m_ghosts.size(); i++){
		m_ghosts[i]->setPosition(m_maze.mapCellToPixel(ghostPosition[i]));
	}

	updateCameraPosition();
}

void TestState::updateCameraPosition()
{
	m_camera.setCenter(m_pacWoman->getPosition());
	sf::Vector2u windowSize = getGame()->getWindowSize() - sf::Vector2u(0,20);			//vector(0,20) is the HUD space

	//We need to clip the view to the boundaries of the maze
	// Left and Top
	if(m_camera.getCenter().x < (int)windowSize.x/2)
		m_camera.setCenter(windowSize.x/2, (int)m_camera.getCenter().y);
	if(m_camera.getCenter().y < windowSize.y/2)
		m_camera.setCenter(m_camera.getCenter().x, windowSize.y/2);

	// Right and bottom
	if(m_camera.getCenter().x > m_maze.getSize().x*32 - windowSize.x/2)
		m_camera.setCenter(m_maze.getSize().x*32 - windowSize.x/2, m_camera.getCenter().y);
	if(m_camera.getCenter().y > m_maze.getSize().y*32 - windowSize.y/2)
		m_camera.setCenter(m_camera.getCenter(). x,m_maze.getSize().y*32 - windowSize.y/2);
}

void TestState::loadNextLevel()
{
	m_currentLevel++;

	int mapLevel = m_currentLevel % 3;
	int speedLevel = std::floor(m_currentLevel / 3);

	// Load new Maze level
	switch(mapLevel)
	{
		case 0:
			m_maze.loadLevel("small");
			break;
		case 1:
			m_maze.loadLevel("medium");
			break;
		case 2:
			m_maze.loadLevel("large");
	}

	//Change Speed according to new level
	float speed = 100 + (speedLevel * 50);

	// Destroy previous characters
	for(Ghost* ghost : m_ghosts)
		delete ghost;
	m_ghosts.clear();
	
	// reposition pacWoman
	auto pacWomanPosition = m_maze.getPacWomanPosition();
	m_pacWoman->setPosition(m_maze.mapCellToPixel(pacWomanPosition));
	m_pacWoman->setSpeed(speed+25);

	// create new Ghosts
	auto ghostPosition = m_maze.getGhostPositions()[0];
	Ghost* ghost = new Ghost(getGame()->getTexture(), m_pacWoman);
	ghost->setMaze(&m_maze);
	ghost->setPosition(m_maze.mapCellToPixel(ghostPosition));
	ghost->setSpeed(speed);
	ghost->instanciateStates();
	m_ghosts.push_back(ghost);
	// for(auto ghostPosition: m_maze.getGhostPositions())
	// {
	// 	Ghost* ghost = new Ghost(getGame()->getTexture(), m_pacWoman);
	// 	ghost->setMaze(&m_maze);
	// 	ghost->setPosition(m_maze.mapCellToPixel(ghostPosition));
	// 	ghost->setSpeed(speed);
	// 	ghost->instanciateStates();
	// 	m_ghosts.push_back(ghost);
	// }

	m_camera.setCenter(m_pacWoman->getPosition());

	moveCharactersToInitialPosition();

	m_remainingDots = m_maze.getRemainingDots();

	// Update HUD - Level Text
	m_levelText.setString("level " + std::to_string(speedLevel) + " - " + std::to_string(mapLevel+1));
}

void TestState::resetToZero()
{
	resetLiveCount();

	m_currentLevel = 0;
	resetCurrentLevel();

	m_score = 0;
}

void TestState::resetLiveCount()
{
	m_liveCount = 3;
}

void TestState::resetCurrentLevel()
{
	m_currentLevel--;
	loadNextLevel();
}