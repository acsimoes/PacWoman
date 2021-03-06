#ifndef MAZE_HPP
#define MAZE_HPP

#include <vector>
#include <SFML/Graphics.hpp>
#include <cassert>

class Maze : public sf::Drawable
{
private:
	enum CellData
	{
		Empty,
		Wall,
		Dot,
		SuperDot,
		Bonus
	};
	
	void draw(sf::RenderTarget& target, sf::RenderStates states) const;		// must override
	
	sf::Vector2i m_mazeSize;
	std::vector<CellData> m_mazeData;
	sf::Vector2i m_pacWomanPosition;
	std::vector<sf::Vector2i> m_ghostPositions;
		
	sf::RenderTexture m_renderTexture;
	sf::Texture& m_texture;

public:	
	Maze(sf::Texture& texture);
	void loadLevel(std::string name);
	
	sf::Vector2i getPacWomanPosition() const;
	std::vector<sf::Vector2i> getGhostPositions() const;
	
	inline std::size_t positionToIndex(sf::Vector2i position) const;
	inline sf::Vector2i indexToPosition(std::size_t index) const;
	
	sf::Vector2i mapPixelToCell(sf::Vector2f pixel) const;
	sf::Vector2f mapCellToPixel(sf::Vector2i cell) const;
	
	bool isWall(sf::Vector2i position) const;
	bool isDot(sf::Vector2i position) const;
	bool isSuperDot(sf::Vector2i position) const;
	bool isBonus(sf::Vector2i position) const;
	bool isEmpty(sf::Vector2i position) const;
	void pickObject(sf::Vector2i position);
	
	sf::Vector2i getSize() const;

	int getRemainingDots() const;
};

#endif // MAZE_HPP
