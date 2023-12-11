# GodotPlayground3D
 This is a playground for various Godot features that I'm compiling into a single project. 
 For learning purposes and for practicing self-documentation on more complex projects. 
 I intend to add more mechanics to this repository as I learn more about Godot. 
 This project uses Godot 4.1.3 (stable). 
 Feel free to use any of the features or code found within, or make suggestions on how to improve the architecture or on features you want to see. 
 
# How to Install
 1. Download the project files from this repository
 2. Download and Install Godot 4.1.3 (stable) from https://godotengine.org/download/archive/4.1.3-stable/
 3. Import the .godot file extension in the project directory
 4. Start a playtest in the Main.tscn in order to access all mechanics

# Movement Mechanics
- WASD to move
- Mouse to aim camera
- ALT to turn head while walking/sprinting (to look over your shoulder as your being chased, for example)
- Shift to Sprint
- CTRL to Crouch
- Crouch while Sprinting to Slide
- Space to Jump (3 Jumps available, resets on ground touch)
- You can Slide while in mid-air, but this 'feature' can be disabled by adding a 'Is_on_floor()' check to the slide function. I left it in because it feels more fun.
- Head Bobbing Animation when walking, sprinting, and crouching
- Q to deploy and detach Grappling Rope. Right now there is no length limit to the grappling rope, and the pull function is wonky. It works, but the behaviour is not optimal. 

 # Interaction Mechanics
- All keymapping up to this point is experimental and will be changed for both keyboard+mouse and controller once everything is implemented. For now, check the Project > Project Settings > Input Map tab to see what is mapped to what. 

 # Interactable Objects 
(Objects you can pick up and throw such as balls, boxes, weighted blocks, furniture)
- Left Click to Pick up or Drop 'Interactable Objects'
- R to Rotate picked up 'Interactable Objects'
- F to Throw picked up 'Interactable Objects' (If an object is too heavy, it will simply fall to the ground)
- These mechanics can be used for certain types of puzzles (throw an object into a specific location to open a door or blow something up, rotate objects to the correct face and place them)

  # Inventory Mechanics
- I to open Inventory/Equipment Menu
- Consumable Items are consumed by right clicking on them (or when keyed in via hotbar)
- Equipment Items can be placed in your Equipment Inventory (to gain their effects, not implemented yet)
- Number Keys 1 ~ 5 for quick access to Items placed on hot bar
- Items can stack, can be placed one by one (right click while holding). Default stack limit is 99.
- Dragging an item outside of the inventory window and left clicking will drop it on the ground. Right click drops a single item. 
- Walk over items to pick them up automatically. If there's no space in your inventory the item will not be picked up (Items that can be placed in your inventory look like 2d planes that rotate)

  # Container Mechanics
- E to Interact with Container Objects (Chests, Doors, Levers, etc.)
- Containers have their own inventory HUD which can contain items. You can drag from one inventory to the other

  # Character Window
- Press 'C' to open the Character Window
- Player has HP, MP, SP with associated meters
- Player has Bravery, Fatigue, Hunger, and Thirst with associated radial meters
- Player has an EXP bar that fills up as their EXP value increases. When full, it should reset to 0 and give stat points and skill points
- Player has 6 Core Stats, Strength, Vitality, Dexterity, Agility, Spirit, and Coolness/Charisma. 
- Core stats can be increased using stat points. Allocate points, then confirm to lock in your choices. 
- Core stats determine 'Derived Stats', which are things like HP, MP, SP, ATK, DEF, MATK, MDEF, EVA, CRIT. 

  # Known Bugs and Issues
- Turning the camera while accessing a container may result in the container being out of line of sight after being opened, which results in the player being 'locked' in the inventory. Possible solution -> Make it so the container inventory automatically breaks when line of sight breaks. I feel like there's a validation missing somewhere. 
- Grappling rope length is infinite -> Set a function that measures the length between the player and the grapple point and if it exceeds 'X' then detach the rope

# Resources Used

Lots of what you see in this project is derived from the following sources, check them out:

- https://www.youtube.com/@lukky (FPS Controller, Interaction Mechanics)
- https://www.youtube.com/@abradotcs (Rotate and Throw Mechanics)
- https://www.youtube.com/@DevLogLogan (Inventory Mechanics)
- https://www.youtube.com/@GameDevelopmentCenter (User Interface and RPG Mechanics) 

# Addons Used
https://godotengine.org/asset-library/asset/2337 (Grappling Hook 3D)
https://github.com/blackears/cyclopsLevelBuilder (Cyclops Level Builder)


