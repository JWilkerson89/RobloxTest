-- Config: Shared obby configuration
-- This module can be accessed from both server and client

local Config = {}

-- Game Settings
Config.GameName = "Simple Obby"
Config.Version = "0.1.0"

-- Obby Settings
Config.TotalStages = 6  -- Total number of stages in the obby
Config.RespawnDelay = 0.5  -- Seconds before respawn after death (fast!)

-- Player Settings
Config.WalkSpeed = 16    -- Default player walk speed
Config.JumpPower = 50    -- Default player jump power

-- Visual Settings
Config.CheckpointColor = Color3.fromRGB(0, 170, 255)  -- Light blue
Config.KillBrickColor = Color3.fromRGB(255, 0, 0)      -- Red
Config.WinPartColor = Color3.fromRGB(255, 215, 0)      -- Gold

-- Debug Settings
Config.DebugMode = true

return Config

