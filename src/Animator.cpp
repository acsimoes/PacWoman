#include "Animator.hpp"

Animator::Animator()
: m_currentFrame(0)
, m_isPlaying(false)
, m_duration(sf::Time::Zero)
, m_loop(false)
, m_timeBuffer(sf::Time::Zero)
{
}

void Animator::addFrame(sf::IntRect frame)
{
    m_frames.push_back(frame);
}

void Animator::play(sf::Time duration, bool loop)
{
    m_isPlaying = true;
    m_duration = duration;
    m_loop = loop;
    m_timeBuffer = sf::Time::Zero;
}

bool Animator::isPlaying() const
{
    return m_isPlaying;
}

void Animator::update(sf::Time delta)
{
    if (!isPlaying())
        return;

    m_timeBuffer += delta;

    sf::Time frameDuration = m_duration / static_cast<float>(m_frames.size());

    while (m_timeBuffer > frameDuration)
    {
        m_currentFrame++;

        if (m_currentFrame == m_frames.size())
        {
            if (!m_loop)
                m_isPlaying = false;

            m_currentFrame = 0;
        }

        m_timeBuffer -= frameDuration;
    }
}

void Animator::animate(sf::Sprite& sprite)
{
    sprite.setTextureRect(m_frames[m_currentFrame]);
}
