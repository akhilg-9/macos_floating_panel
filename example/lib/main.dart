import 'package:flutter/material.dart';
import 'package:macos_floating_panel/floating_panel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Floating Panel Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const FloatingPanelExample(),
    );
  }
}

class FloatingPanelExample extends StatefulWidget {
  const FloatingPanelExample({super.key});

  @override
  State<FloatingPanelExample> createState() => _FloatingPanelExampleState();
}

class _FloatingPanelExampleState extends State<FloatingPanelExample> {
  bool _isVisible = false;

  Future<void> _showPanel() async {
    await FloatingPanel.instance.show(
      width: 300,
      height: 400,
    );
    _checkVisibility();
  }

  Future<void> _hidePanel() async {
    await FloatingPanel.instance.hide();
    _checkVisibility();
  }

  Future<void> _checkVisibility() async {
    final visible = await FloatingPanel.instance.isVisible();
    setState(() {
      _isVisible = visible;
    });
  }

  Future<void> _changeSize(double width, double height) async {
    await FloatingPanel.instance.setSize(width, height);
  }

  @override
  void initState() {
    super.initState();
    _checkVisibility();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Floating Panel Example'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Panel Status: ${_isVisible ? "Visible" : "Hidden"}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: _showPanel,
                icon: const Icon(Icons.visibility),
                label: const Text('Show Panel'),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: _hidePanel,
                icon: const Icon(Icons.visibility_off),
                label: const Text('Hide Panel'),
              ),
              const SizedBox(height: 32),
              const Divider(),
              const SizedBox(height: 16),
              Text(
                'Change Size',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ElevatedButton(
                    onPressed: () => _changeSize(200, 300),
                    child: const Text('Small (200x300)'),
                  ),
                  ElevatedButton(
                    onPressed: () => _changeSize(300, 400),
                    child: const Text('Medium (300x400)'),
                  ),
                  ElevatedButton(
                    onPressed: () => _changeSize(400, 600),
                    child: const Text('Large (400x600)'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
