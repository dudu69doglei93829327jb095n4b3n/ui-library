--[[
    Button Component - Clickable button with hover and press states
]]

local Button = {}
Button.__index = Button

local function createButtonFrame(options)
    local frame = Instance.new("TextButton")
    frame.Name = "Button"
    frame.Size = options.size or UDim2.new(0, 100, 0, 50)
    frame.Position = options.position or UDim2.new(0, 10, 0, 10)
    frame.BackgroundColor3 = options.backgroundColor or Color3.fromRGB(0, 120, 215)
    frame.TextColor3 = options.textColor or Color3.fromRGB(255, 255, 255)
    frame.TextSize = options.textSize or 16
    frame.Font = options.font or Enum.Font.GothamBold
    frame.Text = options.text or "Button"
    frame.BorderSizePixel = 0
    frame.Parent = options.parent
    
    -- Corner radius
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = frame
    
    return frame
end

function Button.new(options)
    options = options or {}
    
    local self = setmetatable({}, Button)
    
    self.frame = createButtonFrame(options)
    self.hoverColor = options.hoverColor or Color3.fromRGB(0, 100, 180)
    self.pressColor = options.pressColor or Color3.fromRGB(0, 80, 150)
    self.normalColor = self.frame.BackgroundColor3
    self.enabled = true
    
    self._connections = {}
    
    self:_setupInteractions()
    
    return self
end

function Button:_setupInteractions()
    local mouseEntered = false
    
    self._connections.mouseEnter = self.frame.MouseEnter:Connect(function()
        if self.enabled then
            mouseEntered = true
            self.frame.BackgroundColor3 = self.hoverColor
        end
    end)
    
    self._connections.mouseLeave = self.frame.MouseLeave:Connect(function()
        mouseEntered = false
        if self.enabled then
            self.frame.BackgroundColor3 = self.normalColor
        end
    end)
    
    self._connections.mouseDown = self.frame.MouseButton1Down:Connect(function()
        if self.enabled then
            self.frame.BackgroundColor3 = self.pressColor
        end
    end)
    
    self._connections.mouseUp = self.frame.MouseButton1Up:Connect(function()
        if self.enabled and mouseEntered then
            self.frame.BackgroundColor3 = self.hoverColor
        elseif self.enabled then
            self.frame.BackgroundColor3 = self.normalColor
        end
    end)
    
    self._connections.click = self.frame.MouseButton1Click:Connect(function()
        if self.enabled and self._clickCallback then
            self._clickCallback()
        end
    end)
end

function Button:Connect(callback)
    self._clickCallback = callback
end

function Button:SetEnabled(enabled)
    self.enabled = enabled
    self.frame.TextTransparency = enabled and 0 or 0.5
    if not enabled then
        self.frame.BackgroundColor3 = self.normalColor
    end
end

function Button:SetText(text)
    self.frame.Text = text
end

function Button:Destroy()
    for _, connection in pairs(self._connections) do
        connection:Disconnect()
    end
    self.frame:Destroy()
end

return Button
