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
	platform.Color = color or Color3.fromRGB(128, 128, 128)
	platform.Material = Enum.Material.Concrete
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
print("Creating platforms...")

-- Stage 1 area (spawn)
local spawn = Workspace:FindFirstChild("SpawnLocation") or Instance.new("SpawnLocation")
spawn.Name = "SpawnLocation"
spawn.Position = Vector3.new(0, 5, 0)
spawn.Size = Vector3.new(15, 1, 15)
spawn.Anchored = true
spawn.TopSurface = Enum.SurfaceType.Smooth
spawn.BottomSurface = Enum.SurfaceType.Smooth
spawn.Parent = Workspace

-- Create path with platforms and checkpoints
local zPosition = 20
local platformNumber = 1

for stage = 2, 6 do
	-- Create platform
	local platform = createPlatform("Platform" .. platformNumber, Vector3.new(0, 5, zPosition), Vector3.new(10, 1, 10))
	platform.Parent = platformsFolder
	
	-- Create checkpoint on the platform
	createCheckpoint("Checkpoint" .. stage, stage, Vector3.new(0, 6.5, zPosition))
	
	-- Add some intermediate platforms between checkpoints
	if stage < 6 then
		zPosition = zPosition + 10
		platformNumber = platformNumber + 1
		local midPlatform = createPlatform("Platform" .. platformNumber, Vector3.new(5, 4, zPosition), Vector3.new(8, 1, 8))
		midPlatform.Parent = platformsFolder
		
		zPosition = zPosition + 10
		platformNumber = platformNumber + 1
		local midPlatform2 = createPlatform("Platform" .. platformNumber, Vector3.new(-5, 5, zPosition), Vector3.new(8, 1, 8))
		midPlatform2.Parent = platformsFolder
	end
	
	zPosition = zPosition + 15
	platformNumber = platformNumber + 1
end

-- Create win platform and part
local winPlatform = createPlatform("WinPlatform", Vector3.new(0, 5, zPosition), Vector3.new(15, 1, 15), Color3.fromRGB(255, 215, 0))
winPlatform.Material = Enum.Material.Marble
winPlatform.Parent = platformsFolder

local winPart = Instance.new("Part")
winPart.Name = "WinPart"
winPart.Size = Vector3.new(12, 8, 12)
winPart.Position = Vector3.new(0, 10, zPosition)
winPart.Anchored = true
winPart.CanCollide = false
winPart.Color = Color3.fromRGB(255, 215, 0)
winPart.Material = Enum.Material.Neon
winPart.Transparency = 0.2
winPart.TopSurface = Enum.SurfaceType.Smooth
winPart.BottomSurface = Enum.SurfaceType.Smooth
winPart.Parent = Workspace

-- Create kill brick (large area below course)
print("Creating kill brick...")
local killBrick = Instance.new("Part")
killBrick.Name = "KillBrick"
killBrick.Size = Vector3.new(200, 1, 200)
killBrick.Position = Vector3.new(0, -20, zPosition/2)
killBrick.Anchored = true
killBrick.Parent = killBricksFolder

print("✅ Obby course built successfully!")
print("   - 5 stages with checkpoints")
print("   - " .. #platformsFolder:GetChildren() .. " platforms")
print("   - Kill brick at Y = -20")
print("   - Win area at stage 6")

