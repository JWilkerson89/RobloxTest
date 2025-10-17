-- KillBrickManager: Handles kill bricks and falling off the map
print("✅ Kill Brick Manager loaded")

local Players = game:GetService("Players")

-- Function to setup a kill brick
local function setupKillBrick(killBrick)
	if not killBrick:IsA("BasePart") then return end
	
	-- Make it red and slightly transparent for visibility
	killBrick.Color = Color3.fromRGB(255, 0, 0)
	killBrick.Material = Enum.Material.Neon
	killBrick.Transparency = 0.5
	killBrick.CanCollide = false
	
	-- Handle player touching kill brick
	killBrick.Touched:Connect(function(hit)
		local character = hit.Parent
		local humanoid = character:FindFirstChild("Humanoid")
		
		if humanoid and humanoid.Health > 0 then
			humanoid.Health = 0
			print(character.Name .. " fell off the map!")
		end
	end)
end

-- Setup all existing kill bricks
local function setupAllKillBricks()
	local killBricksFolder = workspace:FindFirstChild("KillBricks")
	if killBricksFolder then
		for _, killBrick in pairs(killBricksFolder:GetChildren()) do
			setupKillBrick(killBrick)
		end
		print("✅ Set up " .. #killBricksFolder:GetChildren() .. " kill bricks")
	else
		warn("⚠️ No KillBricks folder found in Workspace! Create one and add kill brick parts.")
	end
end

-- Setup existing and new kill bricks
setupAllKillBricks()

-- Watch for new kill bricks being added
if workspace:FindFirstChild("KillBricks") then
	workspace.KillBricks.ChildAdded:Connect(setupKillBrick)
end

