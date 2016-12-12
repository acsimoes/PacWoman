#include "GhostStates.hpp"

GhostStates::GhostStates()
{

}

Chase::Chase()
{

}

void Chase::enter(Ghost* m_ghost)
{
	// play strong animator
	m_strongAnimator.play(sf::seconds(0.25), true);
	m_ghost->isWeak = false;

	sf::Time m_timeBuffer = sf::Time::Zero;
	sf::Vector2f pacWomanPosition = m_ghost->m_pacWoman->getPosition();
	m_goalCell = m_maze->mapPixelToCell(pacWomanPosition);
	m_currentCell = m_maze->mapPixelToCell(m_ghost->getPosition());
}

void Chase::execute(Ghost* m_ghost, sf::Time delay)
{
	m_timeBuffer += delay;

	// recalculate trajectory
	if(timeBuffer >= m_updateGoalDelay)
	{
		sf::Vector2f pacWomanPosition = m_ghost->m_pacWoman->getPosition();
		m_goalCell = m_maze->mapPixelToCell(pacWomanPosition);
	}

	m_weakAnimator.update(delta);
    m_weakAnimator.animate(m_visual);
    Character::update(delta);
}

void Chase::exit(Ghost* m_ghost)
{

}

struct searchNode{
	sf::Vector2i cell;
	float value;
};

inline float euclideanDistance(sf::Vector2i a, sf::Vector2i b)
{
	return(sqrt( (a.x-b.x)*(a.x-b.x) + (a.y-b.y)*(a.y-b.y)));
}
void Chase::searchPath()
{
	// if at an intersection, call change direction
	static sf::Vector2i directions[4] = {
        sf::Vector2i(1, 0),
        sf::Vector2i(0, 1),
        sf::Vector2i(-1, 0),
        sf::Vector2i(0, -1)
        };

    std::vector<searchNode> searchPool;
    searchNode currentNode;
    currentNode.cell = m_currentCell;
    currentNode.value = euclideanDistance(m_currentCell, m_goalCell);
    searchPool.push_back(currentNode);

    std::map<sf::Vector2i, sf::Vector2i> pathMap;	// maps every cell to which cell it came from

    bool reachedGoal = false;
    while(!reachedGoal)
    {
    	float min_value = FLT_MAX;
    	for(searchNode Node : searchPool)
    	{
    		if(min_value > Node.value)
    		{
    			currentNode = Node;
    			min_value = Node.value;
    		}
    	}

    	for(sf::Vector2i dir : directions){

    		sf::Vector2i newCell = currentNode.cell + dir;
    		if(m_maze->isWall(newCell))
    			continue;
    		else if(newcell == m_goalCell){
    			reachedGoal = true;
    			pathMap[newCell] = currentNode.cell;		// add pair to pathMap
    			break;
    		}

    		pathMap[newCell] = currentNode.cell;		// add pair to pathMap
    		currentNode.cell = newCell;
    		currentNode.value = euclideanDistance(newCell, m_goalCell);
    		searchPool.push_back(currentNode);			// add to searchPool
    	}
    }

    m_path.clear();			// forward_list that will store every cell from ghost to pacWoman

    sf::Vector2i currentCell = m_goalCell;
    sf::Vector2i initialCell = m_currentCell;
    sf::Vector2i previousCell;

    m_path.push_front(currentCell);

    while(currentCell != initialCell)
    {

    	previousCell = pathMap[currentCell];

    	m_path.push_front(previousCell);

    	currentCell =  previousCell;
    }
}