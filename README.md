# TronGame
## Installation Instructions 
### Step 1: Setting Up Dependencies
- Command 1:
  The following command installs the 'Bloc' baseline, a graphics library for Pharo, providing essential tools and functionalities for the game UI.
 ```smalltalk
  Metacello new
    baseline: 'Bloc';
    repository: 'github://pharo-graphics/Bloc:05e5b0e385811719537f8cd89966b150a07be985/src';
    onConflictUseIncoming;
    load;
    lock.
 ```

- Command 2:
The following command fetches the 'Myg' package, a crucial library providing essential functionalities for the game's graphics and visual elements.
 ```smalltalk
Metacello new
    repository: 'github://Ducasse/Myg:v1.0.0';
    baseline: 'Myg';
    onConflictUseIncoming;
    load.
 ```

### Step 2: Cloning the Game Repository
1- Open Pharo and navigate to the Git Repositories Browser.
2- Add a new repository by clicking on 'Add' and selecting the 'Clone from GitHub' tab.
3- Input the repository details as follows: 
- Owner name: rawanghosn
- Project name: TronGame
- Protocol: Choose either HTTPS or SSH

### Step 3: Confirming Installation
Open the System Browser in Pharo and verify the presence of key packages 'Myg-TronGame' and 'Myg-TronGame-Tests' signaling a complete setup.

## Usage Instructions
### Running the game
1- Open Pharo Playground
2- Execute the following command to load the game : 
 ```smalltalk
TronGame open.
 ```
### Game Interface
- The game features two players, one in blue and the other in yellow.
- Walls outline the borders, and dark gray-colored cells designate the corridors where players can move.

### Player Controls 
- Yellow player controls :
  - Use the keyboard arrows to move in the corresponding directions.
- Blue player controls :
  - S: Move South
  - Z: Move north
  - Q: Move west
  - D: Move east

### Game Interactions
- Esc: Exit the game.
- Space: Restart the game.

### Game Instructions 
- The objective is to navigate through the corridors without hitting the walls or entering the trail left behind by either player.
- If a player hits a wall or enters its own or the other player's trail, they lose and the game ends.

### Code and Tests
- Code location:
  The main code for the game is located in the 'Myg-TronGame' package within the repository.
- Test location:
  The tests for the game can be found in the 'Myg-TronGame-Tests' package within the repository.
- Running tests:
  To ensure the functionality of the game components, click on the button next to the testing methods within the Pharo environment. This will execute the test and provide feedback on the status of the test.
  
## Design Decisions 
### Code Organization: 
The code is structured into two main parts: Model and UI.
### Model Classes
- **Hierarchy and Inheritance:**
 - The model includes a hierarchy of classes to represent the game elements.
 - For example, 'MygTronElement' which extends 'MygAbstractBox' serves as a base class, and various elements like corridors, walls, trails and the ground inherit from it.

- **Game logic and GameManager:**
 - The game logic is encapsulated in classes like 'MygTronBoard' which extends 'MygBoard' and 'MygTronGameManager'.
 - The GameManager orchestrates game events ensuring smooth gameplay
### UI Classes
- **Element Representation:**
  - UI Classes like 'MygTronBoardElement' and 'MygTronBoxElement' are responsible for visually representing the game elements using BlElement.
- **Main Game Class:**
  - The main game class, 'TronGame', is the entry point for the game. It integrates the model and UI, facilitating the interaction between game logic and user interface.

### Testing 
- **Test Priorities:**
  - Tests are prioritized based on critical components with a focus on game logic, game manager, move situations, and structural board integrity.

### Design patterns
- The code incorporates design patterns such as dispatch, hook and template in specific areas to enhance  extensibility and maintainability.
















