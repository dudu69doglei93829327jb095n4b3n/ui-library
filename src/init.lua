--[[
    Roblox UI Library - Main Module
    A comprehensive UI component library for Roblox games
]]

local UILibrary = {}
UILibrary.__index = UILibrary

-- Check if we're running via loadstring or as a script
local isLoadstring = (script == nil) or (typeof(script) ~= "Instance")

if isLoadstring then
    -- For loadstring usage, create functional stub modules
    
    -- Screen module
    UILibrary.Screen = {}
    UILibrary.Screen.__index = UILibrary.Screen
    
    function UILibrary.Screen.new(config)
        local self = setmetatable({}, UILibrary.Screen)
        config = config or {}
        
        -- Create a ScreenGui
        self.frame = Instance.new("ScreenGui")
        self.frame.Name = "UILibraryScreen"
        self.frame.ResetOnSpawn = false
        self.frame.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
        
        return self
    end
    
    -- Panel module
    UILibrary.Panel = {}
    UILibrary.Panel.__index = UILibrary.Panel
    
    function UILibrary.Panel.new(config)
        local self = setmetatable({}, UILibrary.Panel)
        config = config or {}
        
        self.frame = Instance.new("Frame")
        self.frame.Name = "Panel"
        self.frame.BackgroundColor3 = config.backgroundColor or Color3.fromRGB(50, 50, 50)
        self.frame.BorderSizePixel = 0
        self.frame.Position = config.position or UDim2.new(0, 0, 0, 0)
        self.frame.Size = config.size or UDim2.new(0, 300, 0, 200)
        self.frame.Parent = config.parent
        
        return self
    end
    
    -- Label module
    UILibrary.Label = {}
    UILibrary.Label.__index = UILibrary.Label
    
    function UILibrary.Label.new(config)
        local self = setmetatable({}, UILibrary.Label)
        config = config or {}
        
        self.frame = Instance.new("TextLabel")
        self.frame.Name = "Label"
        self.frame.Text = config.text or "Label"
        self.frame.TextSize = config.textSize or 14
        self.frame.TextColor3 = config.textColor or Color3.fromRGB(255, 255, 255)
        self.frame.BackgroundTransparency = 1
        self.frame.BorderSizePixel = 0
        self.frame.Position = config.position or UDim2.new(0, 0, 0, 0)
        self.frame.Size = config.size or UDim2.new(1, 0, 0, 30)
        self.frame.Parent = config.parent
        
        return self
    end
    
    function UILibrary.Label:SetText(text)
        self.frame.Text = text
    end
    
    -- Button module
    UILibrary.Button = {}
    UILibrary.Button.__index = UILibrary.Button
    
    function UILibrary.Button.new(config)
        local self = setmetatable({}, UILibrary.Button)
        config = config or {}
        
        self.frame = Instance.new("TextButton")
        self.frame.Name = "Button"
        self.frame.Text = config.text or "Button"
        self.frame.BackgroundColor3 = config.backgroundColor or Color3.fromRGB(0, 120, 255)
        self.frame.TextColor3 = Color3.fromRGB(255, 255, 255)
        self.frame.TextSize = 14
        self.frame.BorderSizePixel = 0
        self.frame.Position = config.position or UDim2.new(0, 0, 0, 0)
        self.frame.Size = config.size or UDim2.new(0, 100, 0, 40)
        self.frame.Parent = config.parent
        
        self._connections = {}
        
        return self
    end
    
    function UILibrary.Button:Connect(callback)
        local connection = self.frame.MouseButton1Click:Connect(callback)
        table.insert(self._connections, connection)
        return connection
    end
    
    -- TextBox module
    UILibrary.TextBox = {}
    UILibrary.TextBox.__index = UILibrary.TextBox
    
    function UILibrary.TextBox.new(config)
        local self = setmetatable({}, UILibrary.TextBox)
        config = config or {}
        
        self.frame = Instance.new("TextBox")
        self.frame.Name = "TextBox"
        self.frame.Text = config.text or ""
        self.frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        self.frame.TextColor3 = Color3.fromRGB(0, 0, 0)
        self.frame.TextSize = 14
        self.frame.BorderSizePixel = 1
        self.frame.Position = config.position or UDim2.new(0, 0, 0, 0)
        self.frame.Size = config.size or UDim2.new(1, 0, 0, 30)
        self.frame.Parent = config.parent
        
        return self
    end
    
    -- ProgressBar module
    UILibrary.ProgressBar = {}
    UILibrary.ProgressBar.__index = UILibrary.ProgressBar
    
    function UILibrary.ProgressBar.new(config)
        local self = setmetatable({}, UILibrary.ProgressBar)
        config = config or {}
        
        self.frame = Instance.new("Frame")
        self.frame.Name = "ProgressBar"
        self.frame.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        self.frame.BorderSizePixel = 0
        self.frame.Position = config.position or UDim2.new(0, 0, 0, 0)
        self.frame.Size = config.size or UDim2.new(1, 0, 0, 20)
        self.frame.Parent = config.parent
        
        self.progress = Instance.new("Frame")
        self.progress.Name = "Progress"
        self.progress.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        self.progress.BorderSizePixel = 0
        self.progress.Size = UDim2.new(0, 0, 1, 0)
        self.progress.Parent = self.frame
        
        self.value = 0
        
        return self
    end
    
    function UILibrary.ProgressBar:SetValue(value)
        self.value = math.clamp(value, 0, 100)
        self.progress.Size = UDim2.new(0, (self.frame.AbsoluteSize.X * self.value / 100), 1, 0)
    end
    
    -- Slider module
    UILibrary.Slider = {}
    UILibrary.Slider.__index = UILibrary.Slider
    
    function UILibrary.Slider.new(config)
        local self = setmetatable({}, UILibrary.Slider)
        config = config or {}
        
        self.frame = Instance.new("Frame")
        self.frame.Name = "Slider"
        self.frame.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        self.frame.BorderSizePixel = 0
        self.frame.Position = config.position or UDim2.new(0, 0, 0, 0)
        self.frame.Size = config.size or UDim2.new(1, 0, 0, 20)
        self.frame.Parent = config.parent
        
        self.thumb = Instance.new("Frame")
        self.thumb.Name = "Thumb"
        self.thumb.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
        self.thumb.BorderSizePixel = 0
        self.thumb.Size = UDim2.new(0, 10, 1, 0)
        self.thumb.Parent = self.frame
        
        self.value = 0
        
        return self
    end
    
    -- Checkbox module
    UILibrary.Checkbox = {}
    UILibrary.Checkbox.__index = UILibrary.Checkbox
    
    function UILibrary.Checkbox.new(config)
        local self = setmetatable({}, UILibrary.Checkbox)
        config = config or {}
        
        self.frame = Instance.new("TextButton")
        self.frame.Name = "Checkbox"
        self.frame.Text = ""
        self.frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        self.frame.BorderSizePixel = 1
        self.frame.Position = config.position or UDim2.new(0, 0, 0, 0)
        self.frame.Size = config.size or UDim2.new(0, 20, 0, 20)
        self.frame.Parent = config.parent
        
        self.checked = false
        
        return self
    end
    
    -- Colors utility
    UILibrary.Colors = {
        Primary = Color3.fromRGB(0, 120, 255),
        Secondary = Color3.fromRGB(100, 100, 100),
        Gray50 = Color3.fromRGB(50, 50, 50),
        White = Color3.fromRGB(255, 255, 255),
        Black = Color3.fromRGB(0, 0, 0),
        Green = Color3.fromRGB(0, 200, 0),
        Red = Color3.fromRGB(255, 0, 0),
    }
    
    UILibrary.Themes = {}
    UILibrary.Utils = {}
    UILibrary.Drawing = {}
else
    -- Import components for script usage (only when script exists)
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
