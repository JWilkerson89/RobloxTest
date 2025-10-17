-- ObbyUI: Client-side UI for the obby
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

print("🎨 Creating Obby UI...")

-- Wait for leaderstats
local leaderstats = player:WaitForChild("leaderstats")
local stageValue = leaderstats:WaitForChild("Stage")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ObbyUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Create stage display
local stageFrame = Instance.new("Frame")
stageFrame.Name = "StageFrame"
stageFrame.Size = UDim2.new(0, 200, 0, 80)
stageFrame.Position = UDim2.new(0.5, -100, 0, 20)
stageFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
stageFrame.BackgroundTransparency = 0.5
stageFrame.BorderSizePixel = 0
stageFrame.Parent = screenGui

-- Add rounded corners
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = stageFrame

-- Stage label
local stageLabel = Instance.new("TextLabel")
stageLabel.Name = "StageLabel"
stageLabel.Size = UDim2.new(1, 0, 0.4, 0)
stageLabel.Position = UDim2.new(0, 0, 0.1, 0)
stageLabel.BackgroundTransparency = 1
stageLabel.Text = "STAGE"
stageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
stageLabel.TextScaled = true
stageLabel.Font = Enum.Font.GothamBold
stageLabel.Parent = stageFrame

-- Stage number
local stageNumber = Instance.new("TextLabel")
stageNumber.Name = "StageNumber"
stageNumber.Size = UDim2.new(1, 0, 0.45, 0)
stageNumber.Position = UDim2.new(0, 0, 0.5, 0)
stageNumber.BackgroundTransparency = 1
stageNumber.Text = tostring(stageValue.Value)
stageNumber.TextColor3 = Color3.fromRGB(0, 255, 255)
stageNumber.TextScaled = true
stageNumber.Font = Enum.Font.GothamBold
stageNumber.Parent = stageFrame

-- Update stage number when it changes
stageValue.Changed:Connect(function(newStage)
	stageNumber.Text = tostring(newStage)
	
	-- Animate on stage change
	stageFrame.Size = UDim2.new(0, 220, 0, 90)
	stageNumber.TextColor3 = Color3.fromRGB(0, 255, 0)
	wait(0.2)
	stageFrame.Size = UDim2.new(0, 200, 0, 80)
	stageNumber.TextColor3 = Color3.fromRGB(0, 255, 255)
end)

-- Create checkpoint feedback
local checkpointLabel = Instance.new("TextLabel")
checkpointLabel.Name = "CheckpointLabel"
checkpointLabel.Size = UDim2.new(0, 300, 0, 60)
checkpointLabel.Position = UDim2.new(0.5, -150, 0.3, 0)
checkpointLabel.BackgroundTransparency = 1
checkpointLabel.Text = ""
checkpointLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
checkpointLabel.TextScaled = true
checkpointLabel.Font = Enum.Font.GothamBold
checkpointLabel.TextStrokeTransparency = 0.5
checkpointLabel.Visible = false
checkpointLabel.Parent = screenGui

-- Show checkpoint message when stage increases
stageValue.Changed:Connect(function(newStage)
	if newStage > 1 then
		checkpointLabel.Text = "✓ CHECKPOINT " .. newStage
		checkpointLabel.Visible = true
		wait(2)
		checkpointLabel.Visible = false
	end
end)

print("✅ Obby UI created!")

