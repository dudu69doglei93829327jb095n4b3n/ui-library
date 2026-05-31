--[[
    Load String Example - How to require the UI Library from a loadstring
]]

-- Method 1: Load from GitHub repository (Raw content)
local UILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/dudu69doglei93829327jb095n4b3n/ui-library/main/src/init.lua"))()

-- Now you can use the library immediately
local screen = UILibrary.Screen.new()

-- Create a simple welcome panel
local mainPanel = UILibrary.Panel.new({
    parent = screen.frame,
    position = UDim2.new(0.5, -150, 0.5, -100),
    size = UDim2.new(0, 300, 0, 200),
    backgroundColor = UILibrary.Colors.Gray50
})

-- Add title
local titleLabel = UILibrary.Label.new({
    parent = mainPanel.frame,
    text = "Loaded via Loadstring!",
    position = UDim2.new(0, 10, 0, 10),
    size = UDim2.new(1, -20, 0, 40),
    textSize = 20,
    textColor = UILibrary.Colors.Primary
})

-- Add button
local button = UILibrary.Button.new({
    parent = mainPanel.frame,
    text = "Hello World!",
    position = UDim2.new(0.5, -60, 0, 60),
    size = UDim2.new(0, 120, 0, 40)
})

button:Connect(function()
    print("UI Library is working via loadstring!")
    titleLabel:SetText("Button Clicked!")
end)
