# Project 2
### Game of Set

### Roles
* Overall Project Manager: Celia Tang
* Coding Manager: Renzhi Hu
* Testing Manager: Leslie Zhou
* Documentation: Kordell Stewart

### Contributions
Please list who did what for each part of the project.
Also list if people worked together (pair programmed) on a particular section.

Celia Tang: Deal class and test, edited variables in Card class, added delete functionality to set game

Renzhi Hu: Output methods that are in output file and output tests, and scoreboard, and printing out cards in playing field

Leslie Zhou: Input methods that were in input class but later moved to set game and tests

Kordell Stewart: Checker and player_record classes and tests. Set_game testing plan and file.

Anna Yu: Card class and tests, outlined and impletmented game flow (update) for set_game

Celia Tang, Anna Yu, and Leslie Zhou worked together (pair programmed) on the ask_for_card method in set_game.rb

Anna Yu and Renzhi Hu worked together (pair programmed) on the update method in set_game.rb
### Instructions for Grader
Before running our game, please install the Ruby gem colorize. One way to do this is to enter the following into terminal:

<code>gem install colorize</code>

Run our game by running the set_game.rb file.

Here are the rules:

    There will be 12 cards on display. Each card contains four features:
    color (red, purple or green),
    shape (oval (), squiggle {} or diamond <>),
    number (1, 2 or 3)
    shading (solid *, striped = or open ).

    A SET is three cards where each feature, when looked at individually,
    is either all the same OR all different.

    The first player to see a SET, enters the three cards that make the SET.
    Player will be able to delete and reenter the card.
    The player will be awarded +-1 to their score depending on if it's a set.

    If none of the players see a SET, press Q or q to quit the game.

    To WIN : a player's score must achieve the selected goal score chosen from the start or the deck is exhausted.
