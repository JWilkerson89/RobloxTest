-- GameManager: Main server-side obby logic
print("🎮 Obby Game Server Started!")

local Players = game:GetService("Players")

-- Player data storage
local playerData = {}

-- Wait for players to join
Players.PlayerAdded:Connect(function(player)
	print(player.Name .. " joined the obby!")
	
	-- Initialize player data
	playerData[player.UserId] = {
		currentStage = 1,
		respawnPosition = nil
	}
	
	-- Create leaderstats
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player
	
	local stage = Instance.new("IntValue")
	stage.Name = "Stage"
	stage.Value = 1
	stage.Parent = leaderstats
	
	print("✅ Setup complete for " .. player.Name)
	
	-- Handle character spawning
	player.CharacterAdded:Connect(function(character)
		local humanoid = character:WaitForChild("Humanoid")
		local hrp = character:WaitForChild("HumanoidRootPart")
		
		-- Respawn at saved checkpoint if exists
		wait(0.1)
		if playerData[player.UserId].respawnPosition then
			hrp.CFrame = playerData[player.UserId].respawnPosition
		end
		
		-- Handle death
		humanoid.Died:Connect(function()
			wait(2)
			player:LoadCharacter()
		end)
	end)
end)

Players.PlayerRemoving:Connect(function(player)
	print(player.Name .. " left the obby")
	-- Clean up player data
	playerData[player.UserId] = nil
end)

-- Export for other scripts
_G.ObbyPlayerData = playerData

