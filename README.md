# Roblox Game Project

This project uses Rojo for professional Roblox development with version control.

## Setup Instructions

### 1. Install Rojo

**Option A - Using Aftman (Recommended):**
```bash
# Install Aftman first
# Download from: https://github.com/LPGhatguy/aftman/releases

# Then install Rojo
aftman init
aftman add rojo-rbx/rojo@7.4.0
```

**Option B - Direct Install:**
Download Rojo from: https://github.com/rojo-rbx/rojo/releases
Extract and add to your PATH

**Option C - Using Cargo (if you have Rust):**
```bash
cargo install rojo
```

### 2. Install Rojo Plugin in Roblox Studio

1. Open Roblox Studio
2. Go to the [Rojo plugin page](https://www.roblox.com/library/13916111004/Rojo-7)
3. Click "Install" to add it to Studio
4. Restart Studio if needed

### 3. Start Development

1. In your terminal, run:
   ```bash
   rojo serve
   ```

2. In Roblox Studio:
   - Open your place file or create a new place
   - Click the Rojo plugin button
   - Click "Connect" (default: localhost:34872)
   - Your code will sync automatically!

### 4. Build the Game

Any changes you make to files in `src/` will automatically sync to Studio when connected.

## Project Structure

```
src/
├── client/          # LocalScripts (StarterPlayerScripts)
├── server/          # ServerScripts (ServerScriptService)
├── shared/          # Shared modules (ReplicatedStorage)
└── workspace/       # Workspace objects
```

## Development Workflow

1. Edit files in your code editor
2. Rojo automatically syncs to Studio
3. Test in Studio
4. Commit changes to git
5. Repeat!

## Useful Commands

- `rojo serve` - Start development server
- `rojo build -o game.rbxl` - Build a place file
- `git add . && git commit -m "message"` - Save your progress

