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

-- Helper function to create a butterfly decoration with realistic wings
local function createButterfly(position, size, color1, color2)
	local butterfly = Instance.new("Model")
	butterfly.Name = "Butterfly"
	
	local baseSize = size or Vector3.new(4, 0.3, 5)
	
	-- LEFT WING - Upper section (larger wedge)
	local leftWingUpper = Instance.new("WedgePart")
	leftWingUpper.Name = "LeftWingUpper"
	leftWingUpper.Size = Vector3.new(baseSize.X * 0.8, 0.2, baseSize.Z * 0.7)
	leftWingUpper.Position = position + Vector3.new(-baseSize.X * 0.5, 0, baseSize.Z * 0.15)
	leftWingUpper.Orientation = Vector3.new(0, 90, 0)
	leftWingUpper.Anchored = true
	leftWingUpper.CanCollide = false
	leftWingUpper.Color = color1 or Color3.fromRGB(255, 150, 200)
	leftWingUpper.Material = Enum.Material.Neon
	leftWingUpper.Transparency = 0.15
	leftWingUpper.Parent = butterfly
	
	-- LEFT WING - Lower section (smaller wedge)
	local leftWingLower = Instance.new("WedgePart")
	leftWingLower.Name = "LeftWingLower"
	leftWingLower.Size = Vector3.new(baseSize.X * 0.6, 0.2, baseSize.Z * 0.5)
	leftWingLower.Position = position + Vector3.new(-baseSize.X * 0.35, 0, -baseSize.Z * 0.25)
	leftWingLower.Orientation = Vector3.new(0, -90, 0)
	leftWingLower.Anchored = true
	leftWingLower.CanCollide = false
	leftWingLower.Color = color1 or Color3.fromRGB(255, 150, 200)
	leftWingLower.Material = Enum.Material.Neon
	leftWingLower.Transparency = 0.15
	leftWingLower.Parent = butterfly
	
	-- LEFT WING - Pattern spots
	local leftSpot1 = Instance.new("Part")
	leftSpot1.Size = Vector3.new(1, 0.25, 1.2)
	leftSpot1.Position = position + Vector3.new(-baseSize.X * 0.45, 0.05, baseSize.Z * 0.25)
	leftSpot1.Anchored = true
	leftSpot1.CanCollide = false
	leftSpot1.Color = color2 or Color3.fromRGB(200, 150, 255)
	leftSpot1.Material = Enum.Material.Neon
	leftSpot1.Transparency = 0.2
	leftSpot1.Shape = Enum.PartType.Ball
	leftSpot1.Parent = butterfly
	
	local leftSpot2 = Instance.new("Part")
	leftSpot2.Size = Vector3.new(0.6, 0.25, 0.8)
	leftSpot2.Position = position + Vector3.new(-baseSize.X * 0.3, 0.05, -baseSize.Z * 0.15)
	leftSpot2.Anchored = true
	leftSpot2.CanCollide = false
	leftSpot2.Color = color2 or Color3.fromRGB(200, 150, 255)
	leftSpot2.Material = Enum.Material.Neon
	leftSpot2.Transparency = 0.2
	leftSpot2.Shape = Enum.PartType.Ball
	leftSpot2.Parent = butterfly
	
	-- RIGHT WING - Upper section (larger wedge)
	local rightWingUpper = Instance.new("WedgePart")
	rightWingUpper.Name = "RightWingUpper"
	rightWingUpper.Size = Vector3.new(baseSize.X * 0.8, 0.2, baseSize.Z * 0.7)
	rightWingUpper.Position = position + Vector3.new(baseSize.X * 0.5, 0, baseSize.Z * 0.15)
	rightWingUpper.Orientation = Vector3.new(0, -90, 0)
	rightWingUpper.Anchored = true
	rightWingUpper.CanCollide = false
	rightWingUpper.Color = color2 or Color3.fromRGB(200, 150, 255)
	rightWingUpper.Material = Enum.Material.Neon
	rightWingUpper.Transparency = 0.15
	rightWingUpper.Parent = butterfly
	
	-- RIGHT WING - Lower section (smaller wedge)
	local rightWingLower = Instance.new("WedgePart")
	rightWingLower.Name = "RightWingLower"
	rightWingLower.Size = Vector3.new(baseSize.X * 0.6, 0.2, baseSize.Z * 0.5)
	rightWingLower.Position = position + Vector3.new(baseSize.X * 0.35, 0, -baseSize.Z * 0.25)
	rightWingLower.Orientation = Vector3.new(0, 90, 0)
	rightWingLower.Anchored = true
	rightWingLower.CanCollide = false
	rightWingLower.Color = color2 or Color3.fromRGB(200, 150, 255)
	rightWingLower.Material = Enum.Material.Neon
	rightWingLower.Transparency = 0.15
	rightWingLower.Parent = butterfly
	
	-- RIGHT WING - Pattern spots
	local rightSpot1 = Instance.new("Part")
	rightSpot1.Size = Vector3.new(1, 0.25, 1.2)
	rightSpot1.Position = position + Vector3.new(baseSize.X * 0.45, 0.05, baseSize.Z * 0.25)
	rightSpot1.Anchored = true
	rightSpot1.CanCollide = false
	rightSpot1.Color = color1 or Color3.fromRGB(255, 150, 200)
	rightSpot1.Material = Enum.Material.Neon
	rightSpot1.Transparency = 0.2
	rightSpot1.Shape = Enum.PartType.Ball
	rightSpot1.Parent = butterfly
	
	local rightSpot2 = Instance.new("Part")
	rightSpot2.Size = Vector3.new(0.6, 0.25, 0.8)
	rightSpot2.Position = position + Vector3.new(baseSize.X * 0.3, 0.05, -baseSize.Z * 0.15)
	rightSpot2.Anchored = true
	rightSpot2.CanCollide = false
	rightSpot2.Color = color1 or Color3.fromRGB(255, 150, 200)
	rightSpot2.Material = Enum.Material.Neon
	rightSpot2.Transparency = 0.2
	rightSpot2.Shape = Enum.PartType.Ball
	rightSpot2.Parent = butterfly
	
	-- BODY - Main body
	local body = Instance.new("Part")
	body.Name = "Body"
	body.Size = Vector3.new(0.6, 0.6, 3)
	body.Position = position
	body.Anchored = true
	body.CanCollide = false
	body.Color = Color3.fromRGB(40, 20, 60)
	body.Material = Enum.Material.Neon
	body.Shape = Enum.PartType.Cylinder
	body.Orientation = Vector3.new(0, 0, 90)
	body.Parent = butterfly
	
	-- HEAD - Small sphere at front
	local head = Instance.new("Part")
	head.Name = "Head"
	head.Size = Vector3.new(0.8, 0.8, 0.8)
	head.Position = position + Vector3.new(0, 0, 1.7)
	head.Anchored = true
	head.CanCollide = false
	head.Color = Color3.fromRGB(60, 30, 90)
	head.Material = Enum.Material.Neon
	head.Shape = Enum.PartType.Ball
	head.Parent = butterfly
	
	-- ANTENNAE - Left
	local antennaLeft = Instance.new("Part")
	antennaLeft.Size = Vector3.new(0.1, 0.1, 1.2)
	antennaLeft.Position = position + Vector3.new(-0.3, 0.4, 2.2)
	antennaLeft.Orientation = Vector3.new(30, 45, 0)
	antennaLeft.Anchored = true
	antennaLeft.CanCollide = false
	antennaLeft.Color = Color3.fromRGB(80, 40, 120)
	antennaLeft.Material = Enum.Material.Neon
	antennaLeft.Parent = butterfly
	
	-- ANTENNAE - Right
	local antennaRight = Instance.new("Part")
	antennaRight.Size = Vector3.new(0.1, 0.1, 1.2)
	antennaRight.Position = position + Vector3.new(0.3, 0.4, 2.2)
	antennaRight.Orientation = Vector3.new(30, -45, 0)
	antennaRight.Anchored = true
	antennaRight.CanCollide = false
	antennaRight.Color = Color3.fromRGB(80, 40, 120)
	antennaRight.Material = Enum.Material.Neon
	antennaRight.Parent = butterfly
	
	-- Add sparkle effect to body
	local sparkle = Instance.new("Sparkles")
	sparkle.SparkleColor = color1 or Color3.fromRGB(255, 150, 200)
	sparkle.Parent = body
	
	-- Add glowing point light
	local light = Instance.new("PointLight")
	light.Brightness = 4
	light.Range = 20
	light.Color = color1 or Color3.fromRGB(255, 150, 200)
	light.Parent = body
	
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

-- Large butterflies at spawn (very visible!)
createButterfly(Vector3.new(-12, 10, 0), Vector3.new(4, 0.3, 5), Color3.fromRGB(255, 150, 200), Color3.fromRGB(255, 200, 150))
createButterfly(Vector3.new(12, 10, 0), Vector3.new(4, 0.3, 5), Color3.fromRGB(150, 200, 255), Color3.fromRGB(200, 150, 255))
createButterfly(Vector3.new(0, 12, -10), Vector3.new(3.5, 0.3, 4.5), Color3.fromRGB(255, 180, 220), Color3.fromRGB(220, 150, 255))

-- Butterflies along the course
local butterflyColors = {
	{Color3.fromRGB(255, 150, 200), Color3.fromRGB(255, 200, 220)},  -- Pink
	{Color3.fromRGB(200, 150, 255), Color3.fromRGB(220, 180, 255)},  -- Purple
	{Color3.fromRGB(150, 255, 200), Color3.fromRGB(180, 255, 220)},  -- Green
	{Color3.fromRGB(255, 200, 100), Color3.fromRGB(255, 220, 150)},  -- Orange
	{Color3.fromRGB(150, 200, 255), Color3.fromRGB(180, 220, 255)},  -- Blue
}

for i = 1, 20 do
	local zPos = -i * 15
	local colorSet = butterflyColors[math.random(1, #butterflyColors)]
	
	-- Left side butterfly (bigger and closer)
	createButterfly(
		Vector3.new(-12 + math.random(-3, 3), 6 + math.random(0, 10), zPos),
		Vector3.new(2.5, 0.2, 3.5),
		colorSet[1],
		colorSet[2]
	)
	
	-- Right side butterfly (bigger and closer)
	createButterfly(
		Vector3.new(12 + math.random(-3, 3), 6 + math.random(0, 10), zPos),
		Vector3.new(2.5, 0.2, 3.5),
		colorSet[2],
		colorSet[1]
	)
	
	-- Center butterfly occasionally
	if i % 3 == 0 then
		createButterfly(
			Vector3.new(0, 10 + math.random(0, 5), zPos),
			Vector3.new(3, 0.3, 4),
			colorSet[1],
			colorSet[2]
		)
	end
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

