-- PlatformEnhancer: Makes platforms look professional
print("✨ Enhancing platform visuals...")

local Workspace = game:GetService("Workspace")

wait(2)  -- Wait for ObbyBuilder to create platforms

local function enhancePlatform(platform)
	if not platform:IsA("BasePart") then return end
	
	-- Add subtle glow to all platforms
	local surfaceLight = Instance.new("SurfaceLight")
	surfaceLight.Face = Enum.NormalId.Top
	surfaceLight.Brightness = 0.3
	surfaceLight.Range = 10
	surfaceLight.Color = platform.Color
	surfaceLight.Parent = platform
	
	-- Add outline/highlight
	local highlight = Instance.new("Highlight")
	highlight.FillTransparency = 1
	highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
	highlight.OutlineTransparency = 0.8
	highlight.Parent = platform
end

-- Enhance all platforms
local platformsFolder = Workspace:FindFirstChild("Platforms")
if platformsFolder then
	for _, platform in pairs(platformsFolder:GetChildren()) do
		enhancePlatform(platform)
	end
	print("✅ Enhanced " .. #platformsFolder:GetChildren() .. " platforms")
end

-- Enhance checkpoints with special effects
local checkpointsFolder = Workspace:FindFirstChild("Checkpoints")
if checkpointsFolder then
	for _, checkpoint in pairs(checkpointsFolder:GetChildren()) do
		if checkpoint:IsA("BasePart") then
			-- Add pulsing light
			local light = Instance.new("PointLight")
			light.Brightness = 2
			light.Range = 15
			light.Color = checkpoint.Color
			light.Parent = checkpoint
			
			-- Add ambient particles
			local particles = Instance.new("ParticleEmitter")
			particles.Texture = "rbxasset://textures/particles/sparkles_main.dds"
			particles.Color = ColorSequence.new(checkpoint.Color)
			particles.Size = NumberSequence.new{
				NumberSequenceKeypoint.new(0, 0.5),
				NumberSequenceKeypoint.new(1, 0)
			}
			particles.Transparency = NumberSequence.new{
				NumberSequenceKeypoint.new(0, 0.5),
				NumberSequenceKeypoint.new(1, 1)
			}
			particles.Lifetime = NumberRange.new(1, 2)
			particles.Rate = 5
			particles.Speed = NumberRange.new(2, 4)
			particles.SpreadAngle = Vector2.new(30, 30)
			particles.LightEmission = 1
			particles.Parent = checkpoint
			
			-- Pulsing animation
			spawn(function()
				while checkpoint.Parent do
					for i = 1, 20 do
						light.Brightness = 2 + math.sin(i / 3) * 0.5
						wait(0.1)
					end
				end
			end)
		end
	end
	print("✅ Enhanced checkpoints with effects")
end

-- Make spawn extra special
local spawn = Workspace:FindFirstChild("SpawnLocation")
if spawn then
	-- Add big glow
	local spawnLight = Instance.new("PointLight")
	spawnLight.Brightness = 3
	spawnLight.Range = 30
	spawnLight.Color = Color3.fromRGB(150, 255, 150)
	spawnLight.Parent = spawn
	
	-- Add welcome particles
	local welcomeParticles = Instance.new("ParticleEmitter")
	welcomeParticles.Texture = "rbxasset://textures/particles/sparkles_main.dds"
	welcomeParticles.Color = ColorSequence.new{
		ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 200, 255)),
		ColorSequenceKeypoint.new(0.5, Color3.fromRGB(200, 255, 255)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 200))
	}
	welcomeParticles.Size = NumberSequence.new{
		NumberSequenceKeypoint.new(0, 2),
		NumberSequenceKeypoint.new(1, 0)
	}
	welcomeParticles.Transparency = NumberSequence.new{
		NumberSequenceKeypoint.new(0, 0.3),
		NumberSequenceKeypoint.new(1, 1)
	}
	welcomeParticles.Lifetime = NumberRange.new(2, 4)
	welcomeParticles.Rate = 10
	welcomeParticles.Speed = NumberRange.new(3, 6)
	welcomeParticles.SpreadAngle = Vector2.new(180, 180)
	welcomeParticles.Rotation = NumberRange.new(0, 360)
	welcomeParticles.RotSpeed = NumberRange.new(-100, 100)
	welcomeParticles.LightEmission = 1
	welcomeParticles.Parent = spawn
end

print("✅ Platform enhancement complete!")

