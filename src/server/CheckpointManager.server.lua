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
				
				-- Visual feedback
				local originalColor = checkpoint.Color
				checkpoint.Color = Color3.fromRGB(0, 255, 0)
				wait(0.2)
				checkpoint.Color = originalColor
				
				print(player.Name .. " reached stage " .. stageNumber)
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

