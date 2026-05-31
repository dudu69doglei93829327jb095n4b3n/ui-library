--[[
    ProgressBar Component - Visual progress indicator
]]

local ProgressBar = {}
ProgressBar.__index = ProgressBar

local function createProgressBarFrame(options)
    local frame = Instance.new("Frame")
    frame.Name = "ProgressBar"
    frame.Size = options.size or UDim2.new(0, 300, 0, 20)
    frame.Position = options.position or UDim2.new(0, 10, 0, 10)
    frame.BackgroundColor3 = options.backgroundColor or Color3.fromRGB(230, 230, 230)
    frame.BorderSizePixel = 0
    frame.Parent = options.parent
    
    -- Corner radius
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = frame
    
    -- Progress fill
    local fill = Instance.new("Frame")
    fill.Name = "Fill"
    fill.Size = UDim2.new(0.5, 0, 1, 0)
    fill.BackgroundColor3 = options.fillColor or Color3.fromRGB(0, 120, 215)
    fill.BorderSizePixel = 0
    fill.Parent = frame
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(0, 4)
    fillCorner.Parent = fill
    
    return frame, fill
end

function ProgressBar.new(options)
    options = options or {}
    
    local self = setmetatable({}, ProgressBar)
    
    self.frame, self.fill = createProgressBarFrame(options)
    self.progress = options.progress or 0.5
    self.fillColor = options.fillColor or Color3.fromRGB(0, 120, 215)
    
    self:SetProgress(self.progress)
    
    return self
end

function ProgressBar:SetProgress(progress)
    self.progress = math.clamp(progress, 0, 1)
    self.fill.Size = UDim2.new(self.progress, 0, 1, 0)
end

function ProgressBar:GetProgress()
    return self.progress
end

function ProgressBar:SetFillColor(color)
    self.fillColor = color
    self.fill.BackgroundColor3 = color
end

function ProgressBar:Destroy()
    self.frame:Destroy()
end

return ProgressBar
