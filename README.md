# Roblox UI Library

A comprehensive, easy-to-use UI component library for Roblox games. Build beautiful and responsive user interfaces with minimal code.

## Features

✨ **Component-Based Architecture** - Modular, reusable UI components

🎨 **Customizable Themes** - Built-in color schemes and theme system

📱 **Responsive Design** - Auto-scaling UI elements

⚡ **High Performance** - Optimized rendering and memory management

🎯 **Easy to Use** - Simple API with sensible defaults

🔧 **Extensible** - Create custom components easily

## Installation

1. Download the latest release from the [Releases](https://github.com/dudu69doglei93829327jb095n4b3n/ui-library/releases) page
2. Extract the files to your Roblox project
3. Require the library in your scripts

```lua
local UILibrary = require(game.ServerStorage:WaitForChild("UILibrary"))
```

## Quick Start

```lua
local UILibrary = require(game.ServerStorage:WaitForChild("UILibrary"))

-- Create a new screen
local screen = UILibrary.Screen.new()

-- Create a button
local button = UILibrary.Button.new({
    parent = screen.frame,
    text = "Click Me!",
    position = UDim2.new(0.5, -50, 0.5, -25),
    size = UDim2.new(0, 100, 0, 50)
})

-- Connect to button press
button:Connect(function()
    print("Button clicked!")
end)
```

## Components

### Button
Clickable button component with hover and press states.

### Panel
Container for organizing UI elements.

### Label
Text display component.

### TextBox
Text input component.

### ProgressBar
Visual progress indicator.

### Slider
Range selection component.

### Checkbox
Boolean toggle component.

## Documentation

See the [docs](./docs) folder for detailed documentation on each component.

## Examples

Check out the [examples](./examples) folder for sample projects.

## License

MIT License - See LICENSE file for details

## Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](./CONTRIBUTING.md) first.
