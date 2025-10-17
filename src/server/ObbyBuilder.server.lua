-- ObbyBuilder: Creates the obby course programmatically
print("🏗️ Building obby course...")

local Workspace = game:GetService("Workspace")

-- Create folders
local checkpointsFolder = Workspace:FindFirstChild("Checkpoints") or Instance.new("Folder")
checkpointsFolder.Name = "Checkpoints"
checkpointsFolder.Parent = Workspace

local killBricksFolder = Workspace:FindFirstChild("KillBricks") or Instance.new("Folder")
killBricksFolder.Name = "KillBricks"
killBricksFolder.Parent = Workspace

local platformsFolder = Workspace:FindFirstChild("Platforms") or Instance.new("Folder")
platformsFolder.Name = "Platforms"
platformsFolder.Parent = Workspace

-- Helper function to create a platform
local function createPlatform(name, position, size, color)
	local platform = Instance.new("Part")
	platform.Name = name
	platform.Size = size or Vector3.new(10, 1, 10)
	platform.Position = position
	platform.Anchored = true
	platform.Color = color or Color3.fromRGB(180, 220, 180)
	platform.Material = Enum.Material.Grass  -- Nature theme!
	platform.TopSurface = Enum.SurfaceType.Smooth
	platform.BottomSurface = Enum.SurfaceType.Smooth
	return platform
end

-- Helper function to create a checkpoint
local function createCheckpoint(name, stageNumber, position)
	local checkpoint = Instance.new("Part")
	checkpoint.Name = name
	checkpoint.Size = Vector3.new(10, 1, 10)
	checkpoint.Position = position
	checkpoint.Anchored = true
	checkpoint.CanCollide = false
	checkpoint.Color = Color3.fromRGB(0, 170, 255)
	checkpoint.Material = Enum.Material.Neon
	checkpoint.Transparency = 0.3
	checkpoint.TopSurface = Enum.SurfaceType.Smooth
	checkpoint.BottomSurface = Enum.SurfaceType.Smooth
	
	local stageValue = Instance.new("IntValue")
	stageValue.Name = "Stage"
	stageValue.Value = stageNumber
	stageValue.Parent = checkpoint
	
	checkpoint.Parent = checkpointsFolder
	return checkpoint
end

-- Clear old objects
for _, obj in pairs(platformsFolder:GetChildren()) do obj:Destroy() end
for _, obj in pairs(checkpointsFolder:GetChildren()) do obj:Destroy() end
for _, obj in pairs(killBricksFolder:GetChildren()) do obj:Destroy() end
if Workspace:FindFirstChild("WinPart") then Workspace.WinPart:Destroy() end

-- Build the course
print("Creating an awesome obby course...")

-- Stage 1 area (spawn)
local spawn = Workspace:FindFirstChild("SpawnLocation") or Instance.new("SpawnLocation")
spawn.Name = "SpawnLocation"
spawn.Position = Vector3.new(0, 5, 0)
spawn.Size = Vector3.new(20, 1, 20)
spawn.Anchored = true
spawn.TopSurface = Enum.SurfaceType.Smooth
spawn.BottomSurface = Enum.SurfaceType.Smooth
spawn.BrickColor = BrickColor.new("Lime green")
spawn.Material = Enum.Material.Grass
spawn.Parent = Workspace

-- Add decorative spawn walls (butterfly wings themed!)
local spawnWall1 = createPlatform("SpawnWall1", Vector3.new(11, 8, 0), Vector3.new(2, 15, 20), Color3.fromRGB(255, 150, 200))
spawnWall1.Material = Enum.Material.Neon
spawnWall1.Transparency = 0.2
spawnWall1.Parent = platformsFolder

local spawnWall2 = createPlatform("SpawnWall2", Vector3.new(-11, 8, 0), Vector3.new(2, 15, 20), Color3.fromRGB(200, 150, 255))
spawnWall2.Material = Enum.Material.Neon
spawnWall2.Transparency = 0.2
spawnWall2.Parent = platformsFolder

-- STAGE 2 - Challenging jumps (gaps of ~11-12 studs - doable but requires jumping!)
print("Building Stage 2...")
local platform1 = createPlatform("Platform1", Vector3.new(0, 5, -18), Vector3.new(10, 1, 10), Color3.fromRGB(100, 200, 100))
platform1.Parent = platformsFolder

local platform2 = createPlatform("Platform2", Vector3.new(0, 5, -31), Vector3.new(9, 1, 9), Color3.fromRGB(110, 210, 110))
platform2.Parent = platformsFolder

local checkpoint2Platform = createPlatform("Checkpoint2Platform", Vector3.new(0, 5, -44), Vector3.new(12, 1, 12), Color3.fromRGB(120, 220, 120))
checkpoint2Platform.Parent = platformsFolder
createCheckpoint("Checkpoint2", 2, Vector3.new(0, 6.5, -44))

-- STAGE 3 - Diagonal jumps (gaps of ~12 studs diagonal - requires aim!)
print("Building Stage 3...")
local platform3 = createPlatform("Platform3", Vector3.new(7, 5, -57), Vector3.new(10, 1, 10), Color3.fromRGB(150, 150, 200))
platform3.Parent = platformsFolder

local platform4 = createPlatform("Platform4", Vector3.new(-7, 5, -70), Vector3.new(10, 1, 10), Color3.fromRGB(150, 150, 200))
platform4.Parent = platformsFolder

local platform5 = createPlatform("Platform5", Vector3.new(0, 5, -83), Vector3.new(9, 1, 9), Color3.fromRGB(160, 160, 210))
platform5.Parent = platformsFolder

local checkpoint3Platform = createPlatform("Checkpoint3Platform", Vector3.new(0, 5, -96), Vector3.new(12, 1, 12), Color3.fromRGB(170, 170, 220))
checkpoint3Platform.Parent = platformsFolder
createCheckpoint("Checkpoint3", 3, Vector3.new(0, 6.5, -96))

-- STAGE 4 - Climbing section (gaps of ~11 studs + height - climbing challenge!)
print("Building Stage 4...")
local platform6 = createPlatform("Platform6", Vector3.new(0, 7, -108), Vector3.new(10, 1, 10), Color3.fromRGB(200, 150, 100))
platform6.Parent = platformsFolder

local platform7 = createPlatform("Platform7", Vector3.new(0, 10, -120), Vector3.new(9, 1, 9), Color3.fromRGB(200, 150, 100))
platform7.Parent = platformsFolder

local platform8 = createPlatform("Platform8", Vector3.new(0, 13, -132), Vector3.new(9, 1, 9), Color3.fromRGB(200, 150, 100))
platform8.Parent = platformsFolder

local checkpoint4Platform = createPlatform("Checkpoint4Platform", Vector3.new(0, 13, -144), Vector3.new(12, 1, 12), Color3.fromRGB(220, 170, 120))
checkpoint4Platform.Parent = platformsFolder
createCheckpoint("Checkpoint4", 4, Vector3.new(0, 14.5, -144))

-- STAGE 5 - Advanced diagonal jumps (gaps of ~12 studs - precision required!)
print("Building Stage 5...")
local platform9 = createPlatform("Platform9", Vector3.new(-8, 13, -157), Vector3.new(9, 1, 9), Color3.fromRGB(180, 100, 180))
platform9.Parent = platformsFolder

local platform10 = createPlatform("Platform10", Vector3.new(8, 13, -170), Vector3.new(9, 1, 9), Color3.fromRGB(180, 100, 180))
platform10.Parent = platformsFolder

local platform11 = createPlatform("Platform11", Vector3.new(-6, 13, -183), Vector3.new(8, 1, 8), Color3.fromRGB(190, 110, 190))
platform11.Parent = platformsFolder

local checkpoint5Platform = createPlatform("Checkpoint5Platform", Vector3.new(0, 13, -195), Vector3.new(12, 1, 12), Color3.fromRGB(200, 120, 200))
checkpoint5Platform.Parent = platformsFolder
createCheckpoint("Checkpoint5", 5, Vector3.new(0, 14.5, -195))

-- STAGE 6 - Final gauntlet (gaps of ~11 studs - last challenge!)
print("Building Stage 6...")
local platform12 = createPlatform("Platform12", Vector3.new(0, 13, -207), Vector3.new(10, 1, 10), Color3.fromRGB(255, 200, 50))
platform12.Parent = platformsFolder

local platform13 = createPlatform("Platform13", Vector3.new(0, 13, -219), Vector3.new(9, 1, 9), Color3.fromRGB(255, 210, 70))
platform13.Parent = platformsFolder

-- CHECKPOINT 6 - Final checkpoint before win!
local checkpoint6Platform = createPlatform("Checkpoint6Platform", Vector3.new(0, 13, -231), Vector3.new(12, 1, 12), Color3.fromRGB(255, 215, 0))
checkpoint6Platform.Parent = platformsFolder
createCheckpoint("Checkpoint6", 6, Vector3.new(0, 14.5, -231))

-- WIN AREA - Epic golden platform (one final jump!)
local winPlatform = createPlatform("WinPlatform", Vector3.new(0, 13, -244), Vector3.new(20, 2, 20), Color3.fromRGB(255, 215, 0))
winPlatform.Material = Enum.Material.Neon
winPlatform.Parent = platformsFolder

-- Add win walls for effect
local winWall1 = createPlatform("WinWall1", Vector3.new(12, 20, -244), Vector3.new(2, 15, 20), Color3.fromRGB(255, 215, 0))
winWall1.Material = Enum.Material.Neon
winWall1.Transparency = 0.3
winWall1.Parent = platformsFolder

local winWall2 = createPlatform("WinWall2", Vector3.new(-12, 20, -244), Vector3.new(2, 15, 20), Color3.fromRGB(255, 215, 0))
winWall2.Material = Enum.Material.Neon
winWall2.Transparency = 0.3
winWall2.Parent = platformsFolder

-- Create the actual win trigger
local winPart = Instance.new("Part")
winPart.Name = "WinPart"
winPart.Size = Vector3.new(18, 10, 18)
winPart.Position = Vector3.new(0, 19, -244)
winPart.Anchored = true
winPart.CanCollide = false
winPart.Color = Color3.fromRGB(255, 215, 0)
winPart.Material = Enum.Material.Neon
winPart.Transparency = 0.3
winPart.TopSurface = Enum.SurfaceType.Smooth
winPart.BottomSurface = Enum.SurfaceType.Smooth
winPart.Parent = Workspace

-- Create kill brick (large area below entire course)
print("Creating kill brick...")
local killBrick = Instance.new("Part")
killBrick.Name = "KillBrick"
killBrick.Size = Vector3.new(300, 1, 350)
killBrick.Position = Vector3.new(0, -30, -140)
killBrick.Anchored = true
killBrick.Parent = killBricksFolder

-- Add some guide platforms near spawn
local guide1 = createPlatform("Guide1", Vector3.new(0, 4, -12), Vector3.new(6, 0.5, 6), Color3.fromRGB(255, 255, 100))
guide1.Material = Enum.Material.Neon
guide1.Parent = platformsFolder

print("✅ Epic obby course built successfully!")
print("   - 6 stages with checkpoints")
print("   - " .. #platformsFolder:GetChildren() .. " platforms and decorations")
print("   - Progressive difficulty")
print("   - Kill brick below entire course")
print("   - Golden win area at the end!")

