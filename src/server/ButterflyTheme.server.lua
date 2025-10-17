-- ButterflyTheme: Creates a beautiful butterfly-themed environment
print("🦋 Creating butterfly theme...")

local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")

-- Update sky and atmosphere for a beautiful butterfly garden feel
local sky = Lighting:FindFirstChildOfClass("Sky")
if not sky then
	sky = Instance.new("Sky")
	sky.Parent = Lighting
end

-- Beautiful pastel sky
sky.SkyboxBk = "rbxassetid://159454299"  -- Back
sky.SkyboxDn = "rbxassetid://159454296"  -- Down
sky.SkyboxFt = "rbxassetid://159454293"  -- Front
sky.SkyboxLf = "rbxassetid://159454286"  -- Left
sky.SkyboxRt = "rbxassetid://159454300"  -- Right
sky.SkyboxUp = "rbxassetid://159454288"  -- Up

-- Pastel lighting for butterfly garden
Lighting.Ambient = Color3.fromRGB(180, 200, 220)
Lighting.Brightness = 2.5
Lighting.ColorShift_Top = Color3.fromRGB(255, 200, 255)
Lighting.OutdoorAmbient = Color3.fromRGB(180, 200, 180)

-- Helper function to create a butterfly decoration
local function createButterfly(position, size, color1, color2)
	local butterfly = Instance.new("Model")
	butterfly.Name = "Butterfly"
	
	-- Left wing
	local leftWing = Instance.new("Part")
	leftWing.Name = "LeftWing"
	leftWing.Size = size or Vector3.new(2, 0.1, 3)
	leftWing.Position = position + Vector3.new(-1, 0, 0)
	leftWing.Anchored = true
	leftWing.CanCollide = false
	leftWing.Color = color1 or Color3.fromRGB(255, 150, 200)
	leftWing.Material = Enum.Material.Neon
	leftWing.Transparency = 0.3
	leftWing.Parent = butterfly
	
	-- Right wing
	local rightWing = Instance.new("Part")
	rightWing.Name = "RightWing"
	rightWing.Size = size or Vector3.new(2, 0.1, 3)
	rightWing.Position = position + Vector3.new(1, 0, 0)
	rightWing.Anchored = true
	rightWing.CanCollide = false
	rightWing.Color = color2 or Color3.fromRGB(200, 150, 255)
	rightWing.Material = Enum.Material.Neon
	rightWing.Transparency = 0.3
	rightWing.Parent = butterfly
	
	-- Body
	local body = Instance.new("Part")
	body.Name = "Body"
	body.Size = Vector3.new(0.3, 0.3, 2)
	body.Position = position
	body.Anchored = true
	body.CanCollide = false
	body.Color = Color3.fromRGB(100, 50, 100)
	body.Material = Enum.Material.Neon
	body.Shape = Enum.PartType.Cylinder
	body.Orientation = Vector3.new(0, 0, 90)
	body.Parent = butterfly
	
	-- Add sparkle effect
	local sparkle = Instance.new("Sparkles")
	sparkle.SparkleColor = color1 or Color3.fromRGB(255, 150, 200)
	sparkle.Parent = body
	
	butterfly.Parent = Workspace
	return butterfly
end

-- Helper function to create floating butterflies with particle effects
local function createFloatingButterfly(position, color)
	local anchor = Instance.new("Part")
	anchor.Name = "ButterflyAnchor"
	anchor.Size = Vector3.new(1, 1, 1)
	anchor.Position = position
	anchor.Anchored = true
	anchor.CanCollide = false
	anchor.Transparency = 1
	anchor.Parent = Workspace
	
	-- Add particle effect
	local particles = Instance.new("ParticleEmitter")
	particles.Name = "ButterflyParticles"
	particles.Texture = "rbxasset://textures/particles/sparkles_main.dds"
	particles.Color = ColorSequence.new(color or Color3.fromRGB(255, 180, 220))
	particles.Size = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 2),
		NumberSequenceKeypoint.new(0.5, 3),
		NumberSequenceKeypoint.new(1, 0)
	})
	particles.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0.5),
		NumberSequenceKeypoint.new(1, 1)
	})
	particles.Lifetime = NumberRange.new(3, 5)
	particles.Rate = 3
	particles.Speed = NumberRange.new(2, 4)
	particles.SpreadAngle = Vector2.new(180, 180)
	particles.Rotation = NumberRange.new(0, 360)
	particles.RotSpeed = NumberRange.new(-100, 100)
	particles.LightEmission = 1
	particles.Parent = anchor
	
	return anchor
end

-- Create decorative butterflies along the course
print("Placing decorative butterflies...")

-- Butterflies at spawn
createButterfly(Vector3.new(-15, 10, 0), Vector3.new(1.5, 0.1, 2), Color3.fromRGB(255, 150, 200), Color3.fromRGB(255, 200, 150))
createButterfly(Vector3.new(15, 10, 0), Vector3.new(1.5, 0.1, 2), Color3.fromRGB(150, 200, 255), Color3.fromRGB(200, 150, 255))

-- Butterflies along the course
local butterflyColors = {
	{Color3.fromRGB(255, 150, 200), Color3.fromRGB(255, 200, 220)},  -- Pink
	{Color3.fromRGB(200, 150, 255), Color3.fromRGB(220, 180, 255)},  -- Purple
	{Color3.fromRGB(150, 255, 200), Color3.fromRGB(180, 255, 220)},  -- Green
	{Color3.fromRGB(255, 200, 100), Color3.fromRGB(255, 220, 150)},  -- Orange
	{Color3.fromRGB(150, 200, 255), Color3.fromRGB(180, 220, 255)},  -- Blue
}

for i = 1, 15 do
	local zPos = -i * 20
	local colorSet = butterflyColors[math.random(1, #butterflyColors)]
	
	-- Left side butterfly
	createButterfly(
		Vector3.new(-15 + math.random(-5, 5), 8 + math.random(0, 8), zPos),
		Vector3.new(1.2, 0.1, 1.8),
		colorSet[1],
		colorSet[2]
	)
	
	-- Right side butterfly
	createButterfly(
		Vector3.new(15 + math.random(-5, 5), 8 + math.random(0, 8), zPos),
		Vector3.new(1.2, 0.1, 1.8),
		colorSet[2],
		colorSet[1]
	)
end

-- Create floating butterfly particle effects
print("Creating floating butterfly particles...")
for i = 1, 20 do
	local zPos = -i * 15
	local xPos = math.random(-20, 20)
	local yPos = math.random(6, 20)
	local color = butterflyColors[math.random(1, #butterflyColors)][1]
	
	createFloatingButterfly(Vector3.new(xPos, yPos, zPos), color)
end

-- Add flower decorations
print("Adding flower decorations...")
local function createFlower(position, color)
	local stem = Instance.new("Part")
	stem.Name = "FlowerStem"
	stem.Size = Vector3.new(0.2, 3, 0.2)
	stem.Position = position
	stem.Anchored = true
	stem.CanCollide = false
	stem.Color = Color3.fromRGB(100, 200, 100)
	stem.Material = Enum.Material.Grass
	stem.Parent = Workspace
	
	local bloom = Instance.new("Part")
	bloom.Name = "FlowerBloom"
	bloom.Size = Vector3.new(1.5, 0.5, 1.5)
	bloom.Position = position + Vector3.new(0, 2, 0)
	bloom.Anchored = true
	bloom.CanCollide = false
	bloom.Color = color or Color3.fromRGB(255, 100, 150)
	bloom.Material = Enum.Material.Neon
	bloom.Shape = Enum.PartType.Cylinder
	bloom.Orientation = Vector3.new(0, 0, 90)
	bloom.Parent = Workspace
end

-- Place flowers around the course
for i = 1, 30 do
	local zPos = -i * 10
	local flowerColors = {
		Color3.fromRGB(255, 100, 150),
		Color3.fromRGB(255, 150, 200),
		Color3.fromRGB(200, 100, 255),
		Color3.fromRGB(255, 200, 100),
	}
	
	-- Flowers on both sides
	createFlower(
		Vector3.new(-20 + math.random(-5, 5), 0.5, zPos + math.random(-5, 5)),
		flowerColors[math.random(1, #flowerColors)]
	)
	createFlower(
		Vector3.new(20 + math.random(-5, 5), 0.5, zPos + math.random(-5, 5)),
		flowerColors[math.random(1, #flowerColors)]
	)
end

-- Add ambient butterfly particles at spawn
local spawnParticles = createFloatingButterfly(Vector3.new(0, 15, 0), Color3.fromRGB(255, 150, 220))
local emitter = spawnParticles:FindFirstChild("ButterflyParticles")
if emitter then
	emitter.Rate = 10
	emitter.Size = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 3),
		NumberSequenceKeypoint.new(0.5, 4),
		NumberSequenceKeypoint.new(1, 0)
	})
end

print("✅ Butterfly theme complete!")
print("   - Beautiful sky background")
print("   - " .. #Workspace:GetChildren() .. " decorative elements added")
print("   - Floating butterfly particles")
print("   - Flower decorations")

