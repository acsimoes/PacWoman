#include "GhostStates.hpp"
#include <cfloat>       // for FLT_MAX
#include <set>
//DEBUG ONLY
#include <iostream>
//END of DEBUG

std::forward_list<sf::Vector2i>* searchPath(sf::Vector2i start, sf::Vector2i goal, const Maze* m_maze);

GhostState::GhostState(const Maze* maze)
:m_currentCell(sf::Vector2i(0,0))
,m_goalCell(sf::Vector2i(0,0))
,m_maze(maze)
{

}

GhostState::~GhostState()
{

}

void GhostState::enter(Ghost* m_ghost)
{

}

void GhostState::execute(Ghost* m_ghost, sf::Time delta)
{

}

void GhostState::exit(Ghost* m_ghost)
{
    
}

//-------------------------------------- CHASE CLASS -----------------------------//

Chase::Chase(const Maze* maze, PacWoman* pacWoman)
:GhostState(maze)
,m_timeBuffer(sf::Time::Zero)
,m_updateGoalDelay(sf::Time::Zero)
,m_path(nullptr)
,m_pacWoman(pacWoman)
{

}

Chase::~Chase()
{

}

void Chase::enter(Ghost* m_ghost)
{
	std::cout << "At Chase::enter()\n";
	sf::Time m_timeBuffer = sf::Time::Zero;
	sf::Vector2f pacWomanPosition = m_pacWoman->getPosition();
    std::cout << "pacWomanPosition = (" << pacWomanPosition.x << ", " << pacWomanPosition.y << ")\n";
	m_goalCell = m_maze->mapPixelToCell(pacWomanPosition);
    std::cout << "pacWomanCell = (" << m_goalCell.x << ", " << m_goalCell.y << ")\n";
	m_currentCell = m_maze->mapPixelToCell(m_ghost->getPosition());
    m_path = searchPath(m_currentCell, m_goalCell, m_maze);
}

void Chase::execute(Ghost* m_ghost, sf::Time delta)
{
    std::cout << "At Chase::execute()\n";
	m_timeBuffer += delta;

	// recalculate trajectory
	if(m_timeBuffer >= m_updateGoalDelay)
	{
		sf::Vector2f pacWomanPosition = m_pacWoman->getPosition();
		m_goalCell = m_maze->mapPixelToCell(pacWomanPosition);

        m_path->clear();
        m_path = searchPath(m_currentCell, m_goalCell, m_maze);
	}

    m_currentCell = m_maze->mapPixelToCell(m_ghost->getPosition());

    // update direction
    std::cout << "m_currentCell = (" << m_currentCell.x << ", " << m_currentCell.y << ")\t";
    std::cout << "m_path.being() = (" << m_path->begin()->x << ", " << m_path->begin()->y << ")\n";
    if(m_currentCell != *m_path->begin())
    {
        m_path->pop_front();

        sf::Vector2i nextCell = *(++m_path->begin());
        if(m_currentCell + m_ghost->getDirection() != nextCell)
        {
            std::cout << "Changing Directions!!!!!!\n";
            std::cout << "m_currentCell = (" << m_currentCell.x << ", " << m_currentCell.y << ")\t";
            std::cout << "nextCell = (" << nextCell.x << ", " << nextCell.y << ")\t";
            sf::Vector2i newDirection = nextCell - m_currentCell;
            std::cout << "newDirection = (" << newDirection.x << ", " << newDirection.y << ")\t";            
            m_ghost->setDirection(newDirection);
        }
    }


	// m_ghost->m_strongAnimator.update(delta);
    // m_ghost->m_strongAnimator.animate(m_visual);
    // Character::update(delta);
}

void Chase::exit(Ghost* m_ghost)
{

}

void Chase::setUpdateDelay(sf::Time delay)
{
    m_updateGoalDelay = delay;
}


//---------------------------------- EVADE CLASS ---------------------------//

Evade::Evade(const Maze* maze, PacWoman* pacWoman)
:GhostState(maze)
,m_timeBuffer(sf::Time::Zero)
,m_pacWoman(pacWoman)
{

}

Evade::~Evade()
{

}

void Evade::enter(Ghost* m_ghost)
{   
    std::cout << "At Evade::enter()\n";
    sf::Time m_timeBuffer = sf::Time::Zero;
    sf::Vector2f pacWomanPosition = m_pacWoman->getPosition();
    m_goalCell = m_maze->mapPixelToCell(pacWomanPosition);
    m_currentCell = m_maze->mapPixelToCell(m_ghost->getPosition());
}

void Evade::execute(Ghost* m_ghost, sf::Time delta)
{
    //TO COMPLETE
}

void Evade::exit(Ghost* m_ghost)
{
    // TO COMPLETE
}


//-------------------------------- DEAD CLASS ---------------------------------//
Dead::Dead(const Maze* maze, sf::Vector2i home)
:GhostState(maze)
,m_homeCell(home)
,m_path(nullptr)

{

}

Dead::~Dead()
{

}

void Dead::enter(Ghost* m_ghost)
{
    m_goalCell = m_homeCell;
    m_currentCell = m_maze->mapPixelToCell(m_ghost->getPosition());

    if(m_path != NULL)
        m_path->clear();
    m_path = searchPath(m_currentCell, m_goalCell, m_maze);
}

void Dead::execute(Ghost* m_ghost, sf::Time delta)
{
    m_currentCell = m_maze->mapPixelToCell(m_ghost->getPosition());

    // update direction
    std::cout << "m_currentCell = (" << m_currentCell.x << ", " << m_currentCell.y << ")\t";
    std::cout << "m_path.being() = (" << m_path->begin()->x << ", " << m_path->begin()->y << ")\n";
    if(m_currentCell != *m_path->begin())
    {
        m_path->pop_front();

        sf::Vector2i nextCell = *(++m_path->begin());
        if(m_currentCell + m_ghost->getDirection() != nextCell)
        {
            std::cout << "Changing Directions!!!!!!\n";
            std::cout << "m_currentCell = (" << m_currentCell.x << ", " << m_currentCell.y << ")\t";
            std::cout << "nextCell = (" << nextCell.x << ", " << nextCell.y << ")\t";
            sf::Vector2i newDirection = nextCell - m_currentCell;
            std::cout << "newDirection = (" << newDirection.x << ", " << newDirection.y << ")\t";
            m_ghost->setDirection(newDirection);
        }
    }


    // m_ghost->m_weakAnimator.update(delta);
    // m_ghost->m_weakAnimator.animate(m_visual);
    // Character::update(delta);
}

void Dead::exit(Ghost* m_ghost)
{
    // TO COMPLETE
}

//-------------------------------- SEARCH FUNTION --------------------------//
struct searchNode{
    sf::Vector2i cell;
    float value;
};

struct VectorComparer
{
    bool operator()( const sf::Vector2i& first , const sf::Vector2i& second) const
    {
        if ( first.x == second.x )
        {
            return first.y < second.y;
        }

        return first.x < second.x;
    }
};

inline float euclideanDistance(sf::Vector2i a, sf::Vector2i b)
{
    return(sqrt( ((a.x-b.x)*(a.x-b.x)) + ((a.y-b.y)*(a.y-b.y)) ));
}

inline void printVector(sf::Vector2i v)
{
    std::cout << "(" << v.x << ", " << v.y << ")";
}

void printSet(std::set<sf::Vector2i, VectorComparer> set)
{
    std::cout << "Set:\t";
    for(auto it = set.begin(); it != set.end(); ++it)
    {
        printVector(*it);
        std::cout <<"\t"; 
    }
    std::cout << "\nEnd of Set\n";
}

void printPool(std::vector<searchNode> vec)
{
    std::cout << "VectorPool:\n";
    for(searchNode Node : vec)
    {
        std::cout << "Cell = ";
        printVector(Node.cell);
        std::cout << "\t value = " << Node.value << std::endl;
    }
    std::cout << "End of VectorPool\n";
}

std::forward_list<sf::Vector2i>* searchPath(sf::Vector2i start, sf::Vector2i goal, const Maze* m_maze)
{
    // if at an intersection, call change direction
    static sf::Vector2i directions[4] = {
        sf::Vector2i(1, 0),
        sf::Vector2i(0, 1),
        sf::Vector2i(-1, 0),
        sf::Vector2i(0, -1)
        };

    std::vector<searchNode> searchPool;
    std::set<sf::Vector2i, VectorComparer> alreadyVisited;

    searchNode currentNode;
    currentNode.cell = start;
    currentNode.value = euclideanDistance(start, goal);
    searchPool.push_back(currentNode);

    std::map<sf::Vector2i, sf::Vector2i, VectorComparer> pathMap;   // maps every cell to which cell it came from

    bool reachedGoal = false;
    int iterations = -1;
    while(!reachedGoal)
    {
        float min_value = FLT_MAX;
        int ind = -1;
        for(uint i = 0; i < searchPool.size(); i++)
        {
            if(min_value > searchPool[i].value)
            {
                currentNode = searchPool[i];
                min_value = currentNode.value;
                ind = i;
            }
        }
        std::cout << "iterations = " << ++iterations << std::endl;
        std::cout << "currentNode.cell = "; printVector(currentNode.cell); std::cout << "\n";
        std::cout << "currentNode.value = " << currentNode.value << std::endl;
        searchPool.erase(searchPool.begin()+ind);
        alreadyVisited.insert(currentNode.cell);
        // if(iterations % 5 == 0)
        // {
        //     printSet(alreadyVisited);
        //     printPool(searchPool);
        // }

        for(sf::Vector2i dir : directions){

            sf::Vector2i newCell = currentNode.cell + dir;
            std::cout << "dir = "; printVector(dir); std::cout << "\n";
            std::cout << "newCell = "; printVector(newCell); std::cout << "\n";
            if(m_maze->isWall(newCell))      // If it is a Wall or is an already visited cell, ignore
                continue;
            else if(alreadyVisited.find(newCell) != alreadyVisited.end())
                continue;
            else if(newCell == goal){
                reachedGoal = true;
                pathMap[newCell] = currentNode.cell;        // add pair to pathMap
                break;
            }

            pathMap[newCell] = currentNode.cell;        // add pair to pathMap
            searchNode newNode;
            newNode.cell = newCell;
            newNode.value = euclideanDistance(newCell, goal);
            searchPool.push_back(newNode);          // add to searchPool
        }
        
    }

    std::forward_list<sf::Vector2i> *path;
    path = new std::forward_list<sf::Vector2i>;

    sf::Vector2i currentCell = goal;
    sf::Vector2i initialCell = start;
    sf::Vector2i previousCell;

    path->push_front(currentCell);

    while(currentCell != initialCell)
    {

        previousCell = pathMap[currentCell];

        path->push_front(previousCell);

        currentCell =  previousCell;
    }

    return path;
}
