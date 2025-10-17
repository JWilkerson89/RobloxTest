-- PlayerEffects: Add professional visual effects to the player
local Players = game:GetService("Players")
local player = Players.LocalPlayer

print("✨ Adding player visual effects...")

-- Function to add effects to character
local function addEffects(character)
	wait(0.5)
	
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	local humanoid = character:WaitForChild("Humanoid")
	
	-- Add running trail
	local trail = Instance.new("Trail")
	trail.Name = "PlayerTrail"
	trail.Lifetime = 0.5
	trail.MinLength = 0.1
	trail.Color = ColorSequence.new{
		ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 150, 200)),
		ColorSequenceKeypoint.new(0.5, Color3.fromRGB(200, 150, 255)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 200, 255))
	}
	trail.Transparency = NumberSequence.new{
		NumberSequenceKeypoint.new(0, 0.5),
		NumberSequenceKeypoint.new(1, 1)
	}
	trail.WidthScale = NumberSequence.new{
		NumberSequenceKeypoint.new(0, 1),
		NumberSequenceKeypoint.new(1, 0)
	}
	trail.LightEmission = 0.8
	
	-- Create attachments for trail
	local attachment0 = Instance.new("Attachment")
	attachment0.Name = "TrailAttachment0"
	attachment0.Position = Vector3.new(-0.5, -2, 0)
	attachment0.Parent = humanoidRootPart
	
	local attachment1 = Instance.new("Attachment")
	attachment1.Name = "TrailAttachment1"
	attachment1.Position = Vector3.new(0.5, -2, 0)
	attachment1.Parent = humanoidRootPart
	
	trail.Attachment0 = attachment0
	trail.Attachment1 = attachment1
	trail.Parent = humanoidRootPart
	
	-- Add sparkle particles when moving fast
	local speedParticles = Instance.new("ParticleEmitter")
	speedParticles.Name = "SpeedParticles"
	speedParticles.Texture = "rbxasset://textures/particles/sparkles_main.dds"
	speedParticles.Color = ColorSequence.new(Color3.fromRGB(255, 200, 255))
	speedParticles.Size = NumberSequence.new{
		NumberSequenceKeypoint.new(0, 0.5),
		NumberSequenceKeypoint.new(1, 0)
	}
	speedParticles.Transparency = NumberSequence.new{
		NumberSequenceKeypoint.new(0, 0.3),
		NumberSequenceKeypoint.new(1, 1)
	}
	speedParticles.Lifetime = NumberRange.new(0.3, 0.6)
	speedParticles.Rate = 0
	speedParticles.Speed = NumberRange.new(5, 10)
	speedParticles.SpreadAngle = Vector2.new(30, 30)
	speedParticles.Rotation = NumberRange.new(0, 360)
	speedParticles.RotSpeed = NumberRange.new(-200, 200)
	speedParticles.LightEmission = 1
	speedParticles.Parent = humanoidRootPart
	
	-- Enable particles when moving fast
	game:GetService("RunService").Heartbeat:Connect(function()
		if humanoidRootPart and humanoid then
			local speed = humanoidRootPart.AssemblyLinearVelocity.Magnitude
			if speed > 10 then
				speedParticles.Rate = math.min(speed * 2, 50)
			else
				speedParticles.Rate = 0
			end
		end
	end)
	
	-- Add jump particles
	local jumpParticles = Instance.new("ParticleEmitter")
	jumpParticles.Name = "JumpParticles"
	jumpParticles.Texture = "rbxasset://textures/particles/sparkles_main.dds"
	jumpParticles.Color = ColorSequence.new(Color3.fromRGB(255, 255, 150))
	jumpParticles.Size = NumberSequence.new{
		NumberSequenceKeypoint.new(0, 1),
		NumberSequenceKeypoint.new(1, 0)
	}
	jumpParticles.Transparency = NumberSequence.new{
		NumberSequenceKeypoint.new(0, 0),
		NumberSequenceKeypoint.new(1, 1)
	}
	jumpParticles.Lifetime = NumberRange.new(0.5, 1)
	jumpParticles.Rate = 0
	jumpParticles.Speed = NumberRange.new(5, 15)
	jumpParticles.SpreadAngle = Vector2.new(180, 180)
	jumpParticles.EmissionDirection = Enum.NormalId.Bottom
	jumpParticles.LightEmission = 1
	jumpParticles.Parent = humanoidRootPart
	
	-- Trigger jump particles
	humanoid.StateChanged:Connect(function(oldState, newState)
		if newState == Enum.HumanoidStateType.Jumping then
			jumpParticles:Emit(15)
		end
	end)
	
	print("✅ Player effects added!")
end

-- Add effects to current and future characters
if player.Character then
	addEffects(player.Character)
end

player.CharacterAdded:Connect(addEffects)

