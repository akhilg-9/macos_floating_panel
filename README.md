# macos_floating_panel

A Flutter plugin for creating floating panel windows on macOS.

This plugin allows you to create a floating panel window that stays on top of other windows and can be positioned anywhere on the screen. Perfect for creating overlay UIs, quick-access panels, or persistent tool windows.

## Platform Support

| Platform | Support |
|----------|---------|
| macOS    | ✅       |
| Windows  | ❌       |
| Linux    | ❌       |
| iOS      | ❌       |
| Android  | ❌       |
| Web      | ❌       |

## Features

- Create a floating panel window that stays on top of other windows
- Show and hide the panel programmatically
- Customize panel size and position
- Check if the panel is currently visible
- Smooth integration with Flutter widgets

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  macos_floating_panel: ^0.0.1
```

## Usage

### Basic Example

```dart
import 'package:flutter/material.dart';
import 'package:macos_floating_panel/floating_panel.dart';

// Show the floating panel
await FloatingPanel.instance.show(
  width: 300,
  height: 400,
);

// Hide the floating panel
await FloatingPanel.instance.hide();

// Check if panel is visible
bool isVisible = await FloatingPanel.instance.isVisible();

// Change panel size
await FloatingPanel.instance.setSize(400, 600);

// Change panel position
await FloatingPanel.instance.setPosition(100, 100);
```

### Complete Example

```dart
import 'package:flutter/material.dart';
import 'package:macos_floating_panel/floating_panel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> _showPanel() async {
    await FloatingPanel.instance.show(
      width: 300,
      height: 400,
    );
  }

  Future<void> _hidePanel() async {
    await FloatingPanel.instance.hide();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Floating Panel Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _showPanel,
                child: const Text('Show Panel'),
              ),
              ElevatedButton(
                onPressed: _hidePanel,
                child: const Text('Hide Panel'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

## API Reference

### FloatingPanel.instance

The singleton instance of the FloatingPanel.

#### Methods

- `show({double? width, double? height, double? x, double? y})` - Shows the floating panel with optional size and position parameters
- `hide()` - Hides the floating panel
- `isVisible()` - Returns true if the panel is currently visible
- `setSize(double width, double height)` - Sets the size of the panel
- `setPosition(double x, double y)` - Sets the position of the panel (coordinates from bottom-left corner)

## macOS Permissions

This plugin requires the following permissions in your macOS app:

The plugin automatically configures the necessary window properties for a floating panel:
- Borderless window style
- Non-activating panel
- Floating window level
- Can join all spaces
- Stationary across space switches

## Example App

See the [example](example) directory for a complete sample application demonstrating all features of the plugin.

## Current Implementation

This is version 0.0.1 - a basic implementation that creates a native macOS floating panel window. The panel currently displays a native NSView with a standard macOS window background.

### Future Enhancements

Future versions will support:
- Embedding Flutter content in the floating panel
- Custom panel styling and appearance
- Window dragging and resizing callbacks
- Multiple floating panels
- Panel content configuration from Flutter

## Limitations

- Currently only supports macOS
- The panel shows a native view (no Flutter content yet)
- One panel instance at a time

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Credits

Based on the floating panel tutorial by Jared Davidson.
