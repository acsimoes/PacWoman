#include "Ghost.hpp"
//DEBUG ONLY
#include <iostream>
//END of DEBUG


Ghost::Ghost(sf::Texture& texture, PacWoman *pacWoman)
:m_visual(texture)
,m_isWeak(false)
,m_weaknessDuration(sf::Time::Zero)
,m_pacWoman(pacWoman)
,m_currentState(nullptr)
{
	setOrigin(20, 20);
	
	m_strongAnimator.addFrame(sf::IntRect(40, 32, 40, 40));
    m_strongAnimator.addFrame(sf::IntRect(80, 32, 40, 40));

    m_weakAnimator.addFrame(sf::IntRect(40, 72, 40, 40));
    m_weakAnimator.addFrame(sf::IntRect(80, 72, 40, 40));

    m_strongAnimator.play(sf::seconds(0.25), true);
    m_weakAnimator.play(sf::seconds(1), true);

    m_ghostStates[ChaseState] = NULL;
    m_ghostStates[EvadeState] = NULL;
    m_ghostStates[DeadState] = NULL;
}

Ghost::~Ghost()
{
    // delete ghostStates!!!!
    for (GhostState* ghostState : m_ghostStates)
        delete ghostState;
}

void Ghost::setWeak(sf::Time duration)
{
    // std::cout << "setWeak called\n";
	m_isWeak =true;
	m_weaknessDuration = duration;
    changeState(EvadeState);
}


bool Ghost::isWeak() const
{
	return m_isWeak;
}

void Ghost::draw(sf::RenderTarget& target, sf::RenderStates states) const
{
	states.transform *= getTransform();
	
	target.draw(m_visual, states);
}

void Ghost::update(sf::Time delta)            
{    
	
	if (m_isWeak)
    {
        m_weaknessDuration -= delta;

        if (m_weaknessDuration <= sf::Time::Zero)       // change back to strong
        { 
            m_isWeak = false;
            m_strongAnimator.play(sf::seconds(0.25), true);
            changeState(ChaseState);
        }
        else{                                           // Play weak animation
            m_weakAnimator.update(delta);
            m_weakAnimator.animate(m_visual);
        }
    }
    else                                                // PLay strong animation
    {
        m_strongAnimator.update(delta);
        m_strongAnimator.animate(m_visual);
    }

    m_currentState->execute(this, delta);

    Character::update(delta);
}

void Ghost::changeDirection()
{
    // static sf::Vector2i directions[4] = {
    //     sf::Vector2i(1, 0),
    //     sf::Vector2i(0, 1),
    //     sf::Vector2i(-1, 0),
    //     sf::Vector2i(0, -1)
    //     };

    // std::map<float, sf::Vector2i> directionProb;

    // float targetAngle;

    // sf::Vector2f distance = m_pacWoman->getPosition() - getPosition();

    // targetAngle = std::atan2(distance.x, distance.y) * (180/3.14);  // in degrees

    // for(auto direction : directions){
    //     float directionAngle = std::atan2(direction.x, direction.y) / (180/3.14);

    //     //normalize the angle difference
    //     float diff = 180 - std::abs(std::abs(directionAngle - targetAngle) - 180);

    //     directionProb[diff] = direction;
    // }

    // auto it = directionProb.begin();
    // do
    // {
    //     setDirection(it->second);
    //     it++;
    // }while(!willMove());
}

void Ghost::instanciateStates()
{
    const Maze* maze = getMaze();
    sf::Vector2i homeCell = maze->mapPixelToCell(getPosition());

    m_ghostStates[ChaseState] = new Chase(maze, m_pacWoman);
    m_ghostStates[EvadeState] = new Evade(maze, m_pacWoman);
    m_ghostStates[DeadState] = new Dead(maze, homeCell);
    static_cast<Dead*>(m_ghostStates[DeadState])->setDeadDuration(sf::seconds(1));

    m_currentState = m_ghostStates[ChaseState];
    static_cast<Chase*>(m_currentState)->setUpdateDelay(sf::seconds(500));
    m_currentState->enter(this);
}

void Ghost::changeState(State state)
{
    m_currentState->exit(this);

    m_currentState = m_ghostStates[state];

    m_currentState->enter(this);
}