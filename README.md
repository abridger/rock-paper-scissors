Rock, Paper, Scissors
=====================
[![Code Climate](https://codeclimate.com/github/abridger/rock-paper-scissors/badges/gpa.svg)](https://codeclimate.com/github/abridger/rock-paper-scissors) [![Test Coverage](https://codeclimate.com/github/abridger/rock-paper-scissors/badges/coverage.svg)](https://codeclimate.com/github/abridger/rock-paper-scissors)

Makers Academy Week 3 Challenge to make a Rock, Paper, Scissors game using Ruby and Sinatra

Technologies
------------
* Ruby
* Sinatra
* Heroku
* RSpec
* Cucumber
* Capybara

Brief
-----
The Makers Academy Marketing Array (MAMA) have asked us to provide a game for them. Their daily grind is pretty tough and they need time to steam a little.

Your task is to provide a Rock, Paper, Scissors game for them so they can play on the web with the following features:

* the marketeer has to enter their name before the game
* the marketeer will be presented the choices (rock, paper and scissors)
* the marketeer can choose one option
* the game will choose a random option
* a winner will be declared

### Basic Rules
* Rock beats Scissors
* Scissors beats Paper
* Paper beats Rock

### Bonus 1: Multiplayer
Change the game so that two marketeers can play against each other.

### Bonus 2: Rock, Paper, Scissors, Spock, Lizard
Expand the game using the special rules (http://en.wikipedia.org/wiki/Rock-paper-scissors-lizard-Spock).

Classes
--------------------
* Player
* Game
* Objects (rock, paper, scissors)

### Player
| Responsibiities | Collaborators |
|-----------------|---------------|
| Enter name | Game |
| Choose an object | Object |

### Game
| Responsibiities | Collaborators |
|-----------------|---------------|
| Start a round | Player |
| Present choices to player | Object |
| Randomly select an object |  |
| Decide on winning object | |
| Declare a winner | |

### Object
| Responsibiities | Collaborators |
|-----------------|---------------|
| Have a name |  |

Installation
------------
* Install dependencies: `bundle install`
* Run the server: `rackup`

Testing
-------
* Run `rspec` from the project root to run unit tests
* Run `cucumber` from the project root to run feature tests
