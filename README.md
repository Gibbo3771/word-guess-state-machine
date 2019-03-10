# word-guess-state-machine

Originally for a lab for Codeclan course, I sorta went off in another direction. I originally wrote the word guessing game
and the logic was all handled in a big case statement, [which was yucky](https://github.com/Gibbo3771/word-guess-state-machine/commit/6628d2b7266a9427a74d1966f5d494e58623c8fd.)

I implemented a state machine with enough functionality to handle the logic of the game, and split each step into it's own
self contained state.

Results of this:

* Cleaner code
* No logical depedencies between states unless specificailly designed like so (See any class that requires input)
* Easily add new states and slot them in where required
* Bugs are easy to track down and fix
