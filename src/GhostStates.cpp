#include "GhostStates.hpp"
#include <cfloat>       // for FLT_MAX
#include <set>
//DEBUG ONLY
#include <iostream>
//END of DEBUG

inline float euclideanDistance(sf::Vector2i a, sf::Vector2i b);
void printPath(std::forward_list<sf::Vector2i>* path);
std::forward_list<sf::Vector2i>* searchPath(sf::Vector2i start, sf::Vector2i goal, const Maze* m_maze);
std::forward_list<sf::Vector2i>* evadePath(sf::Vector2i start, sf::Vector2i player, const Maze* m_maze, int m_safeDistance, sf::Vector2i* pointerLastElement);

GhostState::GhostState(const Maze* maze)
:m_currentCell(sf::Vector2i(0,0))
,m_goalCell(sf::Vector2i(0,0))
,m_path(nullptr)
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
,m_pacWoman(pacWoman)
,m_killPlayer(false)
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
	m_killPlayer = false;
}

void Chase::execute(Ghost* m_ghost, sf::Time delta)
{
	std::cout << "At Chase::execute()\n";
	m_timeBuffer += delta;

	if(!m_killPlayer)
	{
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

		if(m_currentCell == *m_path->begin())
		{
			m_path->pop_front();
            if(m_path->empty())         // if reached Goal
            {
                if(m_pacWoman->isDead() || m_pacWoman->isDying())       // if PacWoman is dead/dying, stops
                {
                	std::cout << "Player is dead, stopping!\n";
                	m_ghost->setDirection(sf::Vector2i(0,0));
                	m_killPlayer = true;
                	return;                                             
                }
                else{                                                   // otherwise search PacWoman location again
                	std::cout << "Path is empty, searching again!\n";
                	sf::Vector2f pacWomanPosition = m_pacWoman->getPosition();
                	m_goalCell = m_maze->mapPixelToCell(pacWomanPosition);
                	delete m_path;
                	m_path = searchPath(m_currentCell, m_goalCell, m_maze);
                	std::cout << "Finished searching!\n";
                }
            }

            sf::Vector2i nextCell = *(m_path->begin());
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
    }

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
,m_safeDistance(6.0)
,m_endOfPath(sf::Vector2i(0,0))
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
	m_path = evadePath(m_currentCell, m_goalCell, m_maze, m_safeDistance, &m_endOfPath);
}

void Evade::execute(Ghost* m_ghost, sf::Time delta)
{
	std::cout << "At Evade::execute()\n";
	m_timeBuffer += delta;

	m_goalCell = m_maze->mapPixelToCell(m_pacWoman->getPosition());
	int distanceToPlayer = euclideanDistance(m_endOfPath, m_goalCell);

    // recalculate trajectory
    if(distanceToPlayer <= m_safeDistance)		// If Player is too close, recalculate an Evade Path
    {
        m_path->clear();
        delete m_path;
        m_path = evadePath(m_currentCell, m_goalCell, m_maze, m_safeDistance, &m_endOfPath);
    }

	m_currentCell = m_maze->mapPixelToCell(m_ghost->getPosition());

    // update direction
	std::cout << "m_currentCell = (" << m_currentCell.x << ", " << m_currentCell.y << ")\t";
	std::cout << "m_path.being() = (" << m_path->begin()->x << ", " << m_path->begin()->y << ")\n";
	printPath(m_path);

	if(m_currentCell == *m_path->begin())
	{
		m_path->pop_front();
        if(m_path->empty())         // if reached Goal
        {                                                 // otherwise search PacWoman location again
            std::cout << "Path is empty, searching again!\n";
            delete m_path;
            m_path = evadePath(m_currentCell, m_goalCell, m_maze, m_safeDistance, &m_endOfPath);
            std::cout << "Finished searching!\n";           
        }

        sf::Vector2i nextCell = *(m_path->begin());
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
}

void Evade::exit(Ghost* m_ghost)
{
    // TO COMPLETE
}


//-------------------------------- DEAD CLASS ---------------------------------//
Dead::Dead(const Maze* maze, sf::Vector2i home)
:GhostState(maze)
,m_homeCell(home)
,m_atHome(false)
,m_timeBuffer(sf::Time::Zero)
,m_deadDuration(sf::Time::Zero)

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
	{
		m_path->clear();
		delete m_path;
	}
		
	m_path = searchPath(m_currentCell, m_goalCell, m_maze);

	m_timeBuffer = sf::Time::Zero;
	m_atHome = false;
}

void Dead::execute(Ghost* m_ghost, sf::Time delta)
{

	if(m_atHome)
	{
		m_timeBuffer += delta;
		if(m_timeBuffer >= m_deadDuration)
		{
			m_ghost->changeState(ChaseState);
			return;
		}
	}
	else{
		m_currentCell = m_maze->mapPixelToCell(m_ghost->getPosition());

        // update direction
		std::cout << "m_currentCell = (" << m_currentCell.x << ", " << m_currentCell.y << ")\t";
		std::cout << "m_path.begin() = (" << m_path->begin()->x << ", " << m_path->begin()->y << ")\n";

		if(m_currentCell == *m_path->begin())
		{
			m_path->pop_front();
			if(m_path->empty())
			{
				m_atHome = true;
				return;
			}

			sf::Vector2i nextCell = *(m_path->begin());
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
	}
}

void Dead::exit(Ghost* m_ghost)
{
    // TO COMPLETE
}

void Dead::setDeadDuration(sf::Time duration)
{
	m_deadDuration = duration;
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

void printPath(std::forward_list<sf::Vector2i>* path)
{
	std::cout << "Path:\n";
	for(auto it = path->begin(); it != path->end(); ++it)
	{
		printVector(*it);
		std::cout << "\n";
	}
}

std::forward_list<sf::Vector2i>* searchPath(sf::Vector2i start, sf::Vector2i goal, const Maze* m_maze)
{

	if(goal == start)
	{
		std::forward_list<sf::Vector2i> *path = new std::forward_list<sf::Vector2i>;
		path->push_front(goal);
		return path;
	}
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


std::forward_list<sf::Vector2i>* evadePath(sf::Vector2i start, sf::Vector2i player, const Maze* m_maze, int m_safeDistance, sf::Vector2i* pointerLastElement)
{
    // if at an intersection, call change direction
	static sf::Vector2i directions[4] = {    // sf::Vector2i currentCell = newCell;		// Already Initialized to this value, I leave this is for clarity

		sf::Vector2i(1, 0),
		sf::Vector2i(0, 1),
		sf::Vector2i(-1, 0),
		sf::Vector2i(0, -1)
	};

	std::vector<searchNode> searchPool;
	std::set<sf::Vector2i, VectorComparer> alreadyVisited;

	searchNode currentNode;
	currentNode.cell = start;
	currentNode.value = euclideanDistance(start, player);
	searchPool.push_back(currentNode);


    std::map<sf::Vector2i, sf::Vector2i, VectorComparer> pathMap;   // maps every cell to which cell it came from

    sf::Vector2i currentCell;

    bool safe = false;
    int iterations = -1;
    while(!safe)
    {
    	float max_value = FLT_MIN;
    	int ind = -1;
    	for(uint i = 0; i < searchPool.size(); i++)
    	{
    		if(max_value < searchPool[i].value)
    		{
    			currentNode = searchPool[i];
    			max_value = currentNode.value;
    			ind = i;
    		}
    	}
    	// std::cout << "iterations = " << ++iterations << std::endl;
    	// std::cout << "currentNode.cell = "; printVector(currentNode.cell); std::cout << "\n";
    	// std::cout << "currentNode.value = " << currentNode.value << std::endl;
    	searchPool.erase(searchPool.begin()+ind);
    	alreadyVisited.insert(currentNode.cell);
        // if(iterations % 5 == 0)
        // {
        //     printSet(alreadyVisited);
        //     printPool(searchPool);
        // }

    	for(sf::Vector2i dir : directions){

    		sf::Vector2i newCell = currentNode.cell + dir;
    		// std::cout << "dir = "; printVector(dir); std::cout << "\n";
    		// std::cout << "newCell = "; printVector(newCell); std::cout << "\n";
    		float eucValue = euclideanDistance(newCell, player);
            if(m_maze->isWall(newCell))      // If it is a Wall or is an already visited cell, ignore
            	continue;
            else if(alreadyVisited.find(newCell) != alreadyVisited.end())
            	continue;
            else if(eucValue > m_safeDistance){
            	safe = true;
                pathMap[newCell] = currentNode.cell;        // add pair to pathMap
                currentCell = newCell;
                // std::cout << "Destination = "; printVector(newCell); std::cout << "\n";
                // std::cout << "Destination value = " << eucValue << std::endl;
                break;
            }
            
            pathMap[newCell] = currentNode.cell;        // add pair to pathMap
            searchNode newNode;
            newNode.cell = newCell;
            newNode.value = eucValue;
            searchPool.push_back(newNode);          // add to searchPool
        }
        
    }

    std::forward_list<sf::Vector2i> *path;
    path = new std::forward_list<sf::Vector2i>;


    // sf::Vector2i currentCell = newCell;		// Already Initialized to this value, I leave this is for clarity
    sf::Vector2i initialCell = start;
    sf::Vector2i previousCell;

    path->push_front(currentCell);
    pointerLastElement = &(*path->begin());		// Since we always add at the front this will be last element

    while(currentCell != initialCell)
    {
    	previousCell = pathMap[currentCell];

    	path->push_front(previousCell);

    	currentCell =  previousCell;
    }

    std::cout << "Leaving evadePath()\n";
    printPath(path);
    return path;
}
