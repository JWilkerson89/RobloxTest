-- LightingSetup: Makes the obby look better with nice lighting
print("💡 Setting up lighting...")

local Lighting = game:GetService("Lighting")

-- Set up nice lighting
Lighting.Ambient = Color3.fromRGB(100, 100, 120)
Lighting.Brightness = 2
Lighting.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
Lighting.ColorShift_Top = Color3.fromRGB(0, 0, 0)
Lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
Lighting.ClockTime = 14 -- 2 PM, bright and clear
Lighting.GeographicLatitude = 41.733

-- Add atmosphere
local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
if not atmosphere then
	atmosphere = Instance.new("Atmosphere")
	atmosphere.Parent = Lighting
end

atmosphere.Density = 0.3
atmosphere.Offset = 0.25
atmosphere.Color = Color3.fromRGB(199, 199, 199)
atmosphere.Decay = Color3.fromRGB(106, 112, 125)
atmosphere.Glare = 0
atmosphere.Haze = 0

-- Add bloom for glowing effects
local bloom = Lighting:FindFirstChildOfClass("BloomEffect")
if not bloom then
	bloom = Instance.new("BloomEffect")
	bloom.Parent = Lighting
end

bloom.Intensity = 0.4
bloom.Size = 24
bloom.Threshold = 0.8

print("✅ Lighting configured for an awesome obby experience!")

