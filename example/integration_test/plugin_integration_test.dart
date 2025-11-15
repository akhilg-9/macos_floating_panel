// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://flutter.dev/to/integration-testing


import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:macos_floating_panel/floating_panel.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('show panel test', (WidgetTester tester) async {
    final result = await FloatingPanel.instance.show(width: 300, height: 400);
    expect(result, true);
  });

  testWidgets('hide panel test', (WidgetTester tester) async {
    final result = await FloatingPanel.instance.hide();
    expect(result, true);
  });

  testWidgets('isVisible test', (WidgetTester tester) async {
    await FloatingPanel.instance.show();
    final visible = await FloatingPanel.instance.isVisible();
    expect(visible, isA<bool>());
  });
}
