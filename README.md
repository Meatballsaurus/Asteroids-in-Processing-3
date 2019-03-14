# Asteroids-in-Processing-3
(link to official processing 3 download - https://processing.org/download/ )

Sean Tyrrell

Description:
My program is a simple recreation of the classic Asteroids arcade game. There is a main menu, instructions screen, credits screen,
and a game over screen. The menu system makes use of a finite state machine to navigate between the screens. The user clicks on the
buttons on the various screens to navigate between them, as well as start a new game or continue a paused game. When in game, the
user uses the arrow keys to control the ship while also shooting asteroids and trying not to hit the asteroids. The number of asteroids
increases every round, and the ship has a set life total. When the ships health reaches 0, game over.

Motivation:
I wanted to create a game that would be a bit challenging to play, but wass't just another 2D platformer. As the processing library
only detects one key being pressed at a time, it adds a level of difficulty to the game.

User commands:
Left click: click on buttons to navigate the menu system
Escape: exit the program
Spacebar: shoot
left arrow key: turn the ship left
right arrow key: turn the ship right
up arrow key: accelerate in the direction the ship is facing
'p' : pause the game to the main menu, click continue to continue playing where you left off
