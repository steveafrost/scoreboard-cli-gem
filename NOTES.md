## How to Setup the Gem ##

1. Plan the gem. Imagine your interface.
2. Start with a project structure - checkout bundler
3. Start with an entry point - the file run
4. force that to build the CLI interface
5. stub out the interface
6. start making things real
7. discover objects
8. program

## Objective ##
To build a gem called Scoreboard which displays the scores from yesterday's MLB games.

## Behavior ##
2. All matches are listed from current day
3. User selects a number and that game is displayed with runs, hits, errors
3. User is able to type 'exit' to exit CLI

## What is a score? ##
* A score has teams
* A score has a time
* A score has runs, hits, and errors

## Extendability ##
* The gem will later be extended to include a way to get scores from one team for their last 7 games. If this is able to be programmed while building the primary objective, it will be incorporated.
* Several other sports to be included at a later date

## Other Notes ##
* self.today interates through scoreboard and displays each score
* Does each score need to be an object?