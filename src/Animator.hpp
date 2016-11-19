#ifndef ANIMATOR_HPP
#define ANIMATOR_HPP

#include <SFML/Graphics.hpp>

class Animator{

private:
    std::vector<sf::IntRect> m_frames;

    unsigned int m_currentFrame;
    bool m_isPlaying;
    sf::Time m_duration;
    bool m_loop;

    public:
    Animator();

    void addFrame(sf::IntRect frame);

    void play(sf::Time duration, bool loop);
    bool isPlaying() const;

    void update(sf::Time delta);
    void animate(sf::Sprite& sprite);
};

#endif // PACWOMAN_ANIMATOR_HPP
