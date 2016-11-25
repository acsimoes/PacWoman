#ifndef GAME_HPP
#define GAME_HPP

#include <SFML/Graphics.hpp>
#include "GameState.hpp"
#include <array>

class Game{

private:
	sf::RenderWindow m_window;
	GameState* m_currentState;
	std::array<GameState*, GameState::Count> m_gameStates;

	sf::Font m_font;
	sf::Texture m_logo;
	sf::Texture m_texture;

public:
	Game();
	~Game();
	void run();
	void changeGameState(GameState::State gameState);
	sf::Font& getFont();
	sf::Texture& getLogo();
	sf::Texture& getTexture();
	sf::Vector2u getWindowSize();

};

#endif //GAME_HPP