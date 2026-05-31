--[[
    Roblox UI Library - Main Module
    A comprehensive UI component library for Roblox games
]]

local UILibrary = {}
UILibrary.__index = UILibrary

-- Check if we're running via loadstring or as a script
local isLoadstring = not script or script == nil

if isLoadstring then
    -- For loadstring usage, create stub modules
    UILibrary.Button = {}
    UILibrary.Panel = {}
    UILibrary.Label = {}
    UILibrary.TextBox = {}
    UILibrary.ProgressBar = {}
    UILibrary.Slider = {}
    UILibrary.Checkbox = {}
    UILibrary.Screen = {}
    
    -- Colors utility
    UILibrary.Colors = {
        Primary = Color3.fromRGB(0, 120, 255),
        Gray50 = Color3.fromRGB(50, 50, 50),
    }
    
    UILibrary.Themes = {}
    UILibrary.Utils = {}
    UILibrary.Drawing = {}
else
    -- Import components for script usage
    local componentsPath = script:FindFirstChild("components")
    local utilsPath = script:FindFirstChild("utils")

    -- Wait for paths with timeout
    local startTime = tick()
    while not componentsPath and tick() - startTime < 5 do
        componentsPath = script:FindFirstChild("components")
        wait(0.1)
    end

    while not utilsPath and tick() - startTime < 5 do
        utilsPath = script:FindFirstChild("utils")
        wait(0.1)
    end

    if componentsPath then
        pcall(function()
            UILibrary.Button = require(componentsPath:WaitForChild("Button", 5))
            UILibrary.Panel = require(componentsPath:WaitForChild("Panel", 5))
            UILibrary.Label = require(componentsPath:WaitForChild("Label", 5))
            UILibrary.TextBox = require(componentsPath:WaitForChild("TextBox", 5))
            UILibrary.ProgressBar = require(componentsPath:WaitForChild("ProgressBar", 5))
            UILibrary.Slider = require(componentsPath:WaitForChild("Slider", 5))
            UILibrary.Checkbox = require(componentsPath:WaitForChild("Checkbox", 5))
            UILibrary.Screen = require(componentsPath:WaitForChild("Screen", 5))
        end)
    end

    if utilsPath then
        pcall(function()
            UILibrary.Colors = require(utilsPath:WaitForChild("Colors", 5))
            UILibrary.Themes = require(utilsPath:WaitForChild("Themes", 5))
            UILibrary.Utils = require(utilsPath:WaitForChild("Utils", 5))
            UILibrary.Drawing = require(utilsPath:WaitForChild("Drawing", 5))
        end)
    end
end

function UILibrary.new()
    local self = setmetatable({}, UILibrary)
    return self
end

return UILibrary
