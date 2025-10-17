-- GameManager: Main server-side game logic
print("🎮 Game Server Started!")

-- Wait for players to join
game.Players.PlayerAdded:Connect(function(player)
	print(player.Name .. " joined the game!")
	
	-- Give them a welcome message
	player:WaitForChild("PlayerGui")
	
	-- Create leaderstats
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player
	
	local coins = Instance.new("IntValue")
	coins.Name = "Coins"
	coins.Value = 0
	coins.Parent = leaderstats
	
	print("✅ Setup complete for " .. player.Name)
end)

game.Players.PlayerRemoving:Connect(function(player)
	print(player.Name .. " left the game")
end)

