-- ClientController: Main client-side logic
local Players = game:GetService("Players")
local player = Players.LocalPlayer

print("👤 Client loaded for: " .. player.Name)

-- Wait for character
player.CharacterAdded:Connect(function(character)
	print("Character spawned!")
	
	-- Example: Make player jump when they spawn
	wait(1)
	local humanoid = character:WaitForChild("Humanoid")
	if humanoid then
		humanoid.Jump = true
		print("Welcome jump!")
	end
end)

