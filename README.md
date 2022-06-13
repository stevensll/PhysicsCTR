# PhysicsCTR
Physics C Final Project 

[**VIDEO**](https://streamable.com/ikricb)


Remix of the mobile classic, cut the rope. Our game features three levels of gameplay of varying difficulty. 

Steven Lei and Jeremy Wong pd. 5

## Running Instructions

Clone or download this repo. Run `main.pde` in the `main` directory in Processing.


## Game objective

Deliver the black ball to Jeremy by cutting sequence of ropes to win.

## Playing Instructions

Use the buttons to navigate to the level screen. Once in a level, the `levels` button returns you to the levels menu and the `retry` button restarts the level. 

Cut the rope by holding down the mouse and sliding across. You can cut multiple ropes at once.

Since it is visually hard to display rope tension, the some ropes have "imaginary" slack and will extend a little bit more than their starting display. It will stop when taut.

Letting the ball go out of the screen (e.g. gravity or from swinging) will result in a defeat. Swinging the ball under Jeremy will not count as a victory. The ball must hit his face directly by gravity or swinging.

You can replay the level or go back after a defeat/victory.

## Physics Used

**Basic Kinematics**: Used to control the ball's falling motion and application of acceleration.
**Simple Harmonic Motion**: Used to control the ball's movement in a pendulumn.
_**String Tension**_: Although we do not visually display each rope's slack, we do incorporate it into the game engine. When the ball extends too far out of reach for a rope, it becomes taut and the entire system stops moving.





