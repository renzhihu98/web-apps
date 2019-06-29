
# Set Game Test Plan # 
For `set_game.rb`, instead of creating test cases we performed vigorous white box testing.The goal was to make sure game flow was working and that all commands functioned as intended at various 'phases' of the game.  

### Test 1 - Base Game Instance
Basic start with a single player, successfully entering name then quitting. 

### Test 2 - Basic Game Procedure
Basic start with a single player, successfully entering name then playing with no incorrect sets until score reached.

### Test 2 - Basic Game Procedure
Basic start with a single player, entering name and getting a mix of right and wrong sets with score adjusted accordingly

### Test 3 - Basic Game Restart
Basic start with a single player, restarting the game after entering name.

### Test 3.1 - Basic Game Help
Basic start with a single player, successfully displaying help message.

### Test 3.2 - Basic Game Quit
Basic start with a single player, after name input successfully quitting mid-game.

### Test 4 - Mid-game Restart
Basic start with a single player, restarting after 2 set selections, and printing a single scoreboard. 

### Test 5 - Multiplayer Base Game Instance
Start with 2 players initialized, successfully entering name then quitting.

### Test 5 - Multiplayer Base Game Procedure 
Start with 2 players initialized, successfully alternating set selection with proper score allocation then quitting.

### Test 6 - Player Count/Score Limit 
Starts that had various player counts within range to scores in range to make sure initialization passed.
