# How to Build Your Obby Course

## Current Status: ✅ All Scripts are Synced!

Your scripts are working! Now build the physical course in Studio.

## Quick Start Guide:

### 1. Create Folders in Workspace:
- `Checkpoints` (folder)
- `KillBricks` (folder)

### 2. Build Stage 1 (Starting Area):
- The SpawnLocation is your stage 1
- Build some platforms leading away from spawn

### 3. Create Checkpoint 2:
1. Insert a Part into the `Checkpoints` folder
2. Make it stand out (bright blue, neon material)
3. Important: Right-click the part → Insert Object → **IntValue**
   - Name it: `Stage`
   - Set Value to: `2`
4. Make the part CanCollide = false (in Properties)

### 4. Add More Stages:
Repeat step 3 for stages 3, 4, 5, etc.
- Each checkpoint needs an IntValue named "Stage" with the stage number

### 5. Add Kill Bricks:
- Create parts in the `KillBricks` folder
- Place them below your course or as obstacles
- The script will auto-make them deadly and red

### 6. Create the Win Area:
- Add a part directly in Workspace (not in a folder)
- Name it exactly: `WinPart`
- Place it at the end of your course

## Test Your Obby:
Press F5 and try:
- ✅ Touch checkpoint 2 → Your stage number should increase
- ✅ Fall into kill brick → You respawn at your last checkpoint
- ✅ Reach WinPart → Victory message!

## Tips:
- Make checkpoints visible but CanCollide = false
- Space stages out so there's actual platforming between them
- Test frequently!

