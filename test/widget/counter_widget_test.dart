import 'package:counter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter Widget Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CounterApp());

    // Verify that the initial counter value is 0.
    expect(find.text('You have pushed the button this many times:'),
        findsOneWidget);
    expect(find.text('0'), findsOneWidget);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that the counter is incremented.
    expect(find.text('1'), findsOneWidget);

    // Tap the '-' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    // Verify that the counter is decremented.
    expect(find.text('0'), findsOneWidget);
  });

  testWidgets('Matches golden file', (tester) async {
    await tester.pumpWidget(const CounterApp());
    await expectLater(
        find.byType(CounterApp), matchesGoldenFile('goldens/counter_app.png'));
  });
}
