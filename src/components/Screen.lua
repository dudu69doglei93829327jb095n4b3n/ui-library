--[[
    Screen Component - Main container for UI elements
]]

local Screen = {}
Screen.__index = Screen

local function createScreenFrame()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "UIScreen"
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(1, 0, 1, 0)
    mainFrame.BackgroundTransparency = 1
    mainFrame.Parent = screenGui
    
    return screenGui, mainFrame
end

function Screen.new(options)
    options = options or {}
    
    local self = setmetatable({}, Screen)
    
    local gui, frame = createScreenFrame()
    
    self.gui = gui
    self.frame = frame
    self.parent = options.parent or game.Players.LocalPlayer:WaitForChild("PlayerGui")
    self.enabled = options.enabled ~= false
    
    gui.Parent = self.parent
    
    return self
end

function Screen:Destroy()
    self.gui:Destroy()
end

function Screen:SetEnabled(enabled)
    self.enabled = enabled
    self.gui.Enabled = enabled
end

function Screen:IsEnabled()
    return self.enabled
end

return Screen
