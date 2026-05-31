# Components Documentation

## Overview

This document provides detailed information about all available components in the Roblox UI Library.

## Button Component

### Description
A clickable button component with hover and press states.

### Properties
- `text` (string): Button text
- `position` (UDim2): Button position
- `size` (UDim2): Button size
- `backgroundColor` (Color3): Normal background color
- `hoverColor` (Color3): Background color on hover
- `pressColor` (Color3): Background color on press
- `textColor` (Color3): Text color
- `textSize` (number): Text size in pixels
- `font` (Enum.Font): Font type

### Methods
- `Connect(callback)`: Connect a callback to button click
- `SetEnabled(enabled)`: Enable/disable button
- `SetText(text)`: Update button text
- `Destroy()`: Destroy the button

### Example
```lua
local button = UILibrary.Button.new({
    parent = screen.frame,
    text = "Click Me!",
    position = UDim2.new(0.5, -50, 0.5, -25),
    size = UDim2.new(0, 100, 0, 50)
})

button:Connect(function()
    print("Button clicked!")
end)
```

## Label Component

### Description
Text display component for showing information.

### Properties
- `text` (string): Label text
- `position` (UDim2): Label position
- `size` (UDim2): Label size
- `textColor` (Color3): Text color
- `textSize` (number): Text size
- `font` (Enum.Font): Font type
- `textWrapped` (boolean): Enable text wrapping
- `backgroundTransparency` (number): Background transparency

### Methods
- `SetText(text)`: Update text
- `GetText()`: Get current text
- `SetTextColor(color)`: Update text color
- `SetTextSize(size)`: Update text size
- `Destroy()`: Destroy the label

## Panel Component

### Description
Container for organizing and grouping UI elements.

### Properties
- `position` (UDim2): Panel position
- `size` (UDim2): Panel size
- `backgroundColor` (Color3): Background color

### Methods
- `AddChild(element)`: Add element to panel
- `RemoveChild(element)`: Remove element from panel
- `GetChildren()`: Get all child elements
- `Destroy()`: Destroy the panel

## TextBox Component

### Description
Text input field for user input.

### Properties
- `placeholder` (string): Placeholder text
- `position` (UDim2): TextBox position
- `size` (UDim2): TextBox size
- `textColor` (Color3): Text color
- `placeholderColor` (Color3): Placeholder text color
- `borderColor` (Color3): Border color

### Methods
- `GetText()`: Get input text
- `SetText(text)`: Set input text
- `Clear()`: Clear the text box
- `Focus()`: Focus the text box
- `OnFocusLost(callback)`: Set callback when focus is lost
- `Destroy()`: Destroy the text box

## ProgressBar Component

### Description
Visual progress indicator.

### Properties
- `progress` (number): Progress value (0-1)
- `position` (UDim2): ProgressBar position
- `size` (UDim2): ProgressBar size
- `backgroundColor` (Color3): Background color
- `fillColor` (Color3): Fill color

### Methods
- `SetProgress(progress)`: Set progress (0-1)
- `GetProgress()`: Get current progress
- `SetFillColor(color)`: Update fill color
- `Destroy()`: Destroy the progress bar

## Slider Component

### Description
Range selection component for choosing values.

### Properties
- `min` (number): Minimum value
- `max` (number): Maximum value
- `value` (number): Current value
- `position` (UDim2): Slider position
- `size` (UDim2): Slider size

### Methods
- `SetValue(value)`: Set slider value
- `GetValue()`: Get current value
- `OnChanged(callback)`: Set callback for value changes
- `Destroy()`: Destroy the slider

## Checkbox Component

### Description
Boolean toggle component.

### Properties
- `checked` (boolean): Initial checked state
- `text` (string): Checkbox label
- `position` (UDim2): Checkbox position
- `size` (UDim2): Checkbox size

### Methods
- `Toggle()`: Toggle checked state
- `SetChecked(checked)`: Set checked state
- `IsChecked()`: Get checked state
- `SetText(text)`: Update label text
- `OnChanged(callback)`: Set callback for state changes
- `Destroy()`: Destroy the checkbox

## Screen Component

### Description
Main container for all UI elements.

### Properties
- `parent` (Instance): Parent object (defaults to PlayerGui)
- `enabled` (boolean): Whether screen is enabled

### Methods
- `SetEnabled(enabled)`: Show/hide screen
- `IsEnabled()`: Check if screen is enabled
- `Destroy()`: Destroy the screen
