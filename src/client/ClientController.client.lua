-- ClientController: Main client-side obby logic
local Players = game:GetService("Players")
local player = Players.LocalPlayer

print("👤 Obby Client loaded for: " .. player.Name)

-- Wait for character
player.CharacterAdded:Connect(function(character)
	print("Character spawned! Good luck on the obby!")
	
	local humanoid = character:WaitForChild("Humanoid")
	
	-- Optional: Add some extra jump power for easier obby gameplay
	-- humanoid.JumpPower = 50 -- Default is 50, increase for easier jumps
end)

-- Watch for stage changes and give feedback
local leaderstats = player:WaitForChild("leaderstats")
local stage = leaderstats:WaitForChild("Stage")

stage.Changed:Connect(function(newStage)
	if newStage > 1 then
		print("✅ Checkpoint! You're now on stage " .. newStage)
	end
end)

