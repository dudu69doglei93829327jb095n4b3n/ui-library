--[[
    Roblox UI Library - Main Module
    A comprehensive UI component library for Roblox games
]]

local UILibrary = {}
UILibrary.__index = UILibrary

-- Import components
local componentsPath = script:WaitForChild("components")
local utilsPath = script:WaitForChild("utils")

UILibrary.Button = require(componentsPath:WaitForChild("Button"))
UILibrary.Panel = require(componentsPath:WaitForChild("Panel"))
UILibrary.Label = require(componentsPath:WaitForChild("Label"))
UILibrary.TextBox = require(componentsPath:WaitForChild("TextBox"))
UILibrary.ProgressBar = require(componentsPath:WaitForChild("ProgressBar"))
UILibrary.Slider = require(componentsPath:WaitForChild("Slider"))
UILibrary.Checkbox = require(componentsPath:WaitForChild("Checkbox"))
UILibrary.Screen = require(componentsPath:WaitForChild("Screen"))

-- Import utilities
UILibrary.Colors = require(utilsPath:WaitForChild("Colors"))
UILibrary.Themes = require(utilsPath:WaitForChild("Themes"))
UILibrary.Utils = require(utilsPath:WaitForChild("Utils"))

function UILibrary.new()
    local self = setmetatable({}, UILibrary)
    return self
end

return UILibrary
