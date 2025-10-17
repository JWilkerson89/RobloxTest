-- WinCelebration: Epic win celebration system
print("🏆 Setting up win celebration...")

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Wait for workspace
wait(2)

local winPart = workspace:FindFirstChild("WinPart")
if not winPart then
	warn("⚠️ WinPart not found!")
	return
end

-- Track winners
local winners = {}

-- Create epic particles on win part
local confetti = Instance.new("ParticleEmitter")
confetti.Name = "Confetti"
confetti.Texture = "rbxasset://textures/particles/sparkles_main.dds"
confetti.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 100, 100)),
	ColorSequenceKeypoint.new(0.25, Color3.fromRGB(255, 255, 100)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(100, 255, 100)),
	ColorSequenceKeypoint.new(0.75, Color3.fromRGB(100, 255, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 100, 255))
}
confetti.Size = NumberSequence.new{
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(1, 0)
}
confetti.Transparency = NumberSequence.new{
	NumberSequenceKeypoint.new(0, 0),
	NumberSequenceKeypoint.new(1, 1)
}
confetti.Lifetime = NumberRange.new(3, 5)
confetti.Rate = 50
confetti.Speed = NumberRange.new(10, 20)
confetti.SpreadAngle = Vector2.new(180, 180)
confetti.Rotation = NumberRange.new(0, 360)
confetti.RotSpeed = NumberRange.new(-200, 200)
confetti.LightEmission = 1
confetti.Parent = winPart

-- Handle players reaching the win area
winPart.Touched:Connect(function(hit)
	local character = hit.Parent
	local player = Players:GetPlayerFromCharacter(character)
	
	if player and not winners[player.UserId] then
		winners[player.UserId] = true
		
		print("🎉🎉🎉 " .. player.Name .. " COMPLETED THE OBBY! 🎉🎉🎉")
		
		-- Server-side celebration
		local humanoid = character:FindFirstChild("Humanoid")
		if humanoid then
			-- Make them jump for joy!
			humanoid.Jump = true
			
			-- Add fireworks particles to player
			local fireworks = Instance.new("ParticleEmitter")
			fireworks.Name = "Fireworks"
			fireworks.Texture = "rbxasset://textures/particles/sparkles_main.dds"
			fireworks.Color = ColorSequence.new{
				ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 0)),
				ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 100, 255)),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 255, 255))
			}
			fireworks.Size = NumberSequence.new{
				NumberSequenceKeypoint.new(0, 2),
				NumberSequenceKeypoint.new(1, 0)
			}
			fireworks.Transparency = NumberSequence.new{
				NumberSequenceKeypoint.new(0, 0),
				NumberSequenceKeypoint.new(1, 1)
			}
			fireworks.Lifetime = NumberRange.new(1, 2)
			fireworks.Rate = 50
			fireworks.Speed = NumberRange.new(15, 25)
			fireworks.SpreadAngle = Vector2.new(180, 180)
			fireworks.LightEmission = 1
			fireworks.Parent = character:FindFirstChild("HumanoidRootPart")
			
			wait(5)
			fireworks:Destroy()
		end
		
		-- Create remote event to trigger client-side celebration
		local celebrateEvent = ReplicatedStorage:FindFirstChild("CelebrateWin")
		if not celebrateEvent then
			celebrateEvent = Instance.new("RemoteEvent")
			celebrateEvent.Name = "CelebrateWin"
			celebrateEvent.Parent = ReplicatedStorage
		end
		
		celebrateEvent:FireClient(player)
	end
end)

print("✅ Win celebration ready!")

