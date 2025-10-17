-- WinManager: Handles the win area
print("✅ Win Manager loaded")

local Players = game:GetService("Players")

-- Wait for workspace to load
wait(1)

-- Function to setup the win part
local function setupWinPart(winPart)
	if not winPart:IsA("BasePart") then return end
	
	-- Make it gold and glowing
	winPart.Color = Color3.fromRGB(255, 215, 0)
	winPart.Material = Enum.Material.Neon
	winPart.CanCollide = false
	
	-- Track who already won
	local winners = {}
	
	-- Handle player touching win part
	winPart.Touched:Connect(function(hit)
		local character = hit.Parent
		local player = Players:GetPlayerFromCharacter(character)
		
		if player and not winners[player.UserId] then
			winners[player.UserId] = true
			
			-- Celebration effects
			local humanoid = character:FindFirstChild("Humanoid")
			if humanoid then
				-- Make them jump for joy!
				humanoid.Jump = true
			end
			
			print("🎉 " .. player.Name .. " completed the obby!")
			
			-- You could add rewards, teleport to a win area, etc here
		end
	end)
end

-- Setup the win part
local function setupWinArea()
	local winPart = workspace:FindFirstChild("WinPart")
	if winPart then
		setupWinPart(winPart)
		print("✅ Win area set up!")
	else
		warn("⚠️ No WinPart found in Workspace! Create one for players to reach the end.")
	end
end

setupWinArea()

