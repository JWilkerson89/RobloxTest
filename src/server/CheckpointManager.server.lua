-- CheckpointManager: Handles checkpoint touches and stage progression
print("✅ Checkpoint Manager loaded")

local Players = game:GetService("Players")

-- Wait for workspace to load
wait(1)

-- Function to setup a checkpoint
local function setupCheckpoint(checkpoint)
	if not checkpoint:IsA("BasePart") then return end
	if not checkpoint:FindFirstChild("Stage") then return end
	
	local stageNumber = checkpoint.Stage.Value
	
	-- Make checkpoint non-collidable
	checkpoint.CanCollide = false
	
	-- Handle player touching checkpoint
	checkpoint.Touched:Connect(function(hit)
		local character = hit.Parent
		local player = Players:GetPlayerFromCharacter(character)
		
		if player then
			local leaderstats = player:FindFirstChild("leaderstats")
			if not leaderstats then return end
			
			local stageValue = leaderstats:FindFirstChild("Stage")
			if not stageValue then return end
			
			-- Only update if this is the next stage
			if stageNumber == stageValue.Value + 1 then
				stageValue.Value = stageNumber
				
				-- Save respawn position
				if _G.ObbyPlayerData and _G.ObbyPlayerData[player.UserId] then
					_G.ObbyPlayerData[player.UserId].currentStage = stageNumber
					_G.ObbyPlayerData[player.UserId].respawnPosition = checkpoint.CFrame + Vector3.new(0, 5, 0)
				end
				
				-- Epic visual feedback
				local originalColor = checkpoint.Color
				local originalTransparency = checkpoint.Transparency
				
				-- Flash effect
				for i = 1, 3 do
					checkpoint.Color = Color3.fromRGB(255, 255, 0)
					checkpoint.Transparency = 0
					wait(0.1)
					checkpoint.Color = Color3.fromRGB(0, 255, 0)
					wait(0.1)
				end
				
				checkpoint.Color = originalColor
				checkpoint.Transparency = originalTransparency
				
				-- Create celebration particles
				local particles = Instance.new("ParticleEmitter")
				particles.Texture = "rbxasset://textures/particles/sparkles_main.dds"
				particles.Color = ColorSequence.new(Color3.fromRGB(255, 255, 0))
				particles.Size = NumberSequence.new{
					NumberSequenceKeypoint.new(0, 2),
					NumberSequenceKeypoint.new(1, 0)
				}
				particles.Transparency = NumberSequence.new{
					NumberSequenceKeypoint.new(0, 0),
					NumberSequenceKeypoint.new(1, 1)
				}
				particles.Lifetime = NumberRange.new(1, 2)
				particles.Rate = 100
				particles.Speed = NumberRange.new(10, 20)
				particles.SpreadAngle = Vector2.new(180, 180)
				particles.LightEmission = 1
				particles.Parent = checkpoint
				
				wait(0.5)
				particles.Enabled = false
				game:GetService("Debris"):AddItem(particles, 2)
				
				print("🎉 " .. player.Name .. " reached stage " .. stageNumber)
			end
		end
	end)
end

-- Setup all existing checkpoints
local function setupAllCheckpoints()
	local checkpointsFolder = workspace:FindFirstChild("Checkpoints")
	if checkpointsFolder then
		for _, checkpoint in pairs(checkpointsFolder:GetChildren()) do
			setupCheckpoint(checkpoint)
		end
		print("✅ Set up " .. #checkpointsFolder:GetChildren() .. " checkpoints")
	else
		warn("⚠️ No Checkpoints folder found in Workspace! Create one and add checkpoint parts.")
	end
end

-- Setup existing and new checkpoints
setupAllCheckpoints()

-- Watch for new checkpoints being added
if workspace:FindFirstChild("Checkpoints") then
	workspace.Checkpoints.ChildAdded:Connect(setupCheckpoint)
end

