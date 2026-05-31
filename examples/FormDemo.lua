--[[
    Form Demo - Example with input fields and validation
]]

local UILibrary = require(game.ServerStorage:WaitForChild("UILibrary"))

-- Create screen
local screen = UILibrary.Screen.new()

-- Create main panel
local formPanel = UILibrary.Panel.new({
    parent = screen.frame,
    position = UDim2.new(0.5, -200, 0.5, -250),
    size = UDim2.new(0, 400, 0, 500),
    backgroundColor = UILibrary.Colors.White
})

-- Title
local title = UILibrary.Label.new({
    parent = formPanel.frame,
    text = "User Registration Form",
    position = UDim2.new(0, 10, 0, 10),
    size = UDim2.new(1, -20, 0, 30),
    textSize = 24,
    textColor = UILibrary.Colors.Primary
})

-- Username label and input
local usernameLabel = UILibrary.Label.new({
    parent = formPanel.frame,
    text = "Username:",
    position = UDim2.new(0, 10, 0, 50),
    size = UDim2.new(1, -20, 0, 20),
    textSize = 14
})

local usernameInput = UILibrary.TextBox.new({
    parent = formPanel.frame,
    placeholder = "Enter username",
    position = UDim2.new(0, 10, 0, 75),
    size = UDim2.new(1, -20, 0, 35)
})

-- Email label and input
local emailLabel = UILibrary.Label.new({
    parent = formPanel.frame,
    text = "Email:",
    position = UDim2.new(0, 10, 0, 120),
    size = UDim2.new(1, -20, 0, 20),
    textSize = 14
})

local emailInput = UILibrary.TextBox.new({
    parent = formPanel.frame,
    placeholder = "Enter email",
    position = UDim2.new(0, 10, 0, 145),
    size = UDim2.new(1, -20, 0, 35)
})

-- Password label and input
local passwordLabel = UILibrary.Label.new({
    parent = formPanel.frame,
    text = "Password:",
    position = UDim2.new(0, 10, 0, 190),
    size = UDim2.new(1, -20, 0, 20),
    textSize = 14
})

local passwordInput = UILibrary.TextBox.new({
    parent = formPanel.frame,
    placeholder = "Enter password",
    position = UDim2.new(0, 10, 0, 215),
    size = UDim2.new(1, -20, 0, 35)
})

-- Checkbox for terms
local termsCheckbox = UILibrary.Checkbox.new({
    parent = formPanel.frame,
    text = "I agree to the Terms of Service",
    position = UDim2.new(0, 10, 0, 260),
    size = UDim2.new(1, -20, 0, 30)
})

-- Submit button
local submitButton = UILibrary.Button.new({
    parent = formPanel.frame,
    text = "Submit",
    position = UDim2.new(0.5, -75, 0, 310),
    size = UDim2.new(0, 150, 0, 40)
})

submitButton:Connect(function()
    local username = usernameInput:GetText()
    local email = emailInput:GetText()
    local agreed = termsCheckbox:IsChecked()
    
    if username == "" or email == "" then
        print("Please fill in all fields")
        return
    end
    
    if not agreed then
        print("Please agree to terms")
        return
    end
    
    print("Form submitted!")
    print("Username: " .. username)
    print("Email: " .. email)
end)
