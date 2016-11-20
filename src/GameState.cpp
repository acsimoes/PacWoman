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

GetReadyState::GetReadyState(Game* game)
:GameState(game)
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
, m_pacWoman(game->getTexture())
, m_ghost(game->getTexture())
{
	m_pacWoman.move(100, 100);
	m_ghost.move(200, 200);
	std::cout << "loading maze!\n";
	m_maze.loadLevel("level");
	std::cout << "Loaded maze\n";
}

PlayingState::~PlayingState()
{
}


WonState::WonState(Game* game)
:GameState(game)
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


LostState::LostState(Game* game)
:GameState(game)
{
	m_text.setFont(game->getFont());
	m_text.setString("You lost!");
	m_text.setCharacterSize(42);
	
	centerOrigin(m_text);
	m_text.setPosition(240, 120);
	
	m_countDownText.setFont(game->getFont());
	m_countDownText.setCharacterSize(12);
	
	centerOrigin(m_countDownText);
	m_countDownText.setPosition(240, 240);
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

void GetReadyState::insertCoin()
{
	
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
		getGame()->changeGameState(GameState::Won);   
}
void GetReadyState::update(sf::Time delta)
{
	
}
void GetReadyState::draw(sf::RenderWindow& window)
{
	window.draw(m_text);
}

void PlayingState::insertCoin()
{
	// std::cout << "m_pacWoman.die() triggered\n";
	m_pacWoman.die();
}
void PlayingState::pressButton()
{
	m_ghost.setWeak(sf::seconds(3));
}
void PlayingState::moveStick(sf::Vector2i direction)
{
	
}
void PlayingState::update(sf::Time delta)
{
	// std::cout << "PlayinState update!\n";
	m_pacWoman.update(delta);
	m_ghost.update(delta);
}
void PlayingState::draw(sf::RenderWindow& window)
{
	window.draw(m_pacWoman);
	window.draw(m_ghost);
	window.draw(m_maze);
}

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
			getGame()->changeGameState(GameState::GetReady);
}
void WonState::draw(sf::RenderWindow& window)
{
	window.draw(m_text);
}

void LostState::insertCoin()
{
	
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
		getGame()->changeGameState(GameState::GetReady);
	
	m_countDownText.setString("Insert a coin to continue... " + std::to_string(10- static_cast<int>(m_countDown.asSeconds())));
	
}
void LostState::draw(sf::RenderWindow& window)
{
	window.draw(m_text);
    window.draw(m_countDownText);
}
