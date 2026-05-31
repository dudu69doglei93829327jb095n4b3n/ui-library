--[[
    Slider Component - Range selection component
]]

local Slider = {}
Slider.__index = Slider

local function createSliderFrame(options)
    local frame = Instance.new("Frame")
    frame.Name = "Slider"
    frame.Size = options.size or UDim2.new(0, 300, 0, 30)
    frame.Position = options.position or UDim2.new(0, 10, 0, 10)
    frame.BackgroundTransparency = 1
    frame.BorderSizePixel = 0
    frame.Parent = options.parent
    
    -- Track
    local track = Instance.new("Frame")
    track.Name = "Track"
    track.Size = UDim2.new(1, 0, 0, 4)
    track.Position = UDim2.new(0, 0, 0.5, -2)
    track.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    track.BorderSizePixel = 0
    track.Parent = frame
    
    -- Handle
    local handle = Instance.new("Frame")
    handle.Name = "Handle"
    handle.Size = UDim2.new(0, 16, 0, 16)
    handle.Position = UDim2.new(0.5, -8, 0.5, -8)
    handle.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
    handle.BorderSizePixel = 0
    handle.Parent = frame
    
    local handleCorner = Instance.new("UICorner")
    handleCorner.CornerRadius = UDim.new(1, 0)
    handleCorner.Parent = handle
    
    return frame, track, handle
end

function Slider.new(options)
    options = options or {}
    
    local self = setmetatable({}, Slider)
    
    self.frame, self.track, self.handle = createSliderFrame(options)
    self.min = options.min or 0
    self.max = options.max or 100
    self.value = options.value or 50
    self.dragging = false
    self._connections = {}
    
    self:_setupInteractions()
    self:SetValue(self.value)
    
    return self
end

function Slider:_setupInteractions()
    self._connections.mouseDown = self.handle.MouseButton1Down:Connect(function()
        self.dragging = true
    end)
    
    self._connections.mouseUp = game:GetService("UserInputService").InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            self.dragging = false
        end
    end)
    
    self._connections.mouseMove = game:GetService("RunService").RenderStepped:Connect(function()
        if self.dragging then
            local mouse = game:GetService("Players").LocalPlayer:GetMouse()
            local relativeX = mouse.X - self.frame.AbsolutePosition.X
            local percentage = math.clamp(relativeX / self.frame.AbsoluteSize.X, 0, 1)
            self:SetValue(self.min + (self.max - self.min) * percentage)
            if self._changeCallback then
                self._changeCallback(self.value)
            end
        end
    end)
end

function Slider:SetValue(value)
    self.value = math.clamp(value, self.min, self.max)
    local percentage = (self.value - self.min) / (self.max - self.min)
    self.handle.Position = UDim2.new(percentage, -8, 0.5, -8)
end

function Slider:GetValue()
    return self.value
end

function Slider:OnChanged(callback)
    self._changeCallback = callback
end

function Slider:Destroy()
    for _, connection in pairs(self._connections) do
        connection:Disconnect()
    end
    self.frame:Destroy()
end

return Slider
