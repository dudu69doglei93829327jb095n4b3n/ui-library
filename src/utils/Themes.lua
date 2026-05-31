--[[
    Themes Utility - Pre-defined themes for UI components
]]

local Colors = require(script.Parent:WaitForChild("Colors"))

local Themes = {}

-- Light Theme
Themes.Light = {
    name = "Light",
    primary = Colors.Primary,
    secondary = Colors.Secondary,
    background = Colors.White,
    surface = Colors.Gray50,
    text = Colors.Black,
    textSecondary = Colors.Gray500,
    border = Colors.Gray200,
    success = Colors.Success,
    warning = Colors.Warning,
    error = Colors.Error,
    info = Colors.Info,
}

-- Dark Theme
Themes.Dark = {
    name = "Dark",
    primary = Color3.fromRGB(59, 130, 246),
    secondary = Colors.Gray400,
    background = Colors.Gray900,
    surface = Colors.Gray800,
    text = Colors.White,
    textSecondary = Colors.Gray400,
    border = Colors.Gray700,
    success = Color3.fromRGB(34, 197, 94),
    warning = Color3.fromRGB(245, 158, 11),
    error = Color3.fromRGB(239, 68, 68),
    info = Color3.fromRGB(59, 130, 246),
}

-- Neon Theme
Themes.Neon = {
    name = "Neon",
    primary = Color3.fromRGB(0, 255, 255),
    secondary = Color3.fromRGB(255, 0, 255),
    background = Colors.Black,
    surface = Color3.fromRGB(20, 20, 20),
    text = Color3.fromRGB(0, 255, 255),
    textSecondary = Color3.fromRGB(255, 0, 255),
    border = Color3.fromRGB(0, 255, 255),
    success = Color3.fromRGB(0, 255, 0),
    warning = Color3.fromRGB(255, 255, 0),
    error = Color3.fromRGB(255, 0, 0),
    info = Color3.fromRGB(0, 255, 255),
}

return Themes
