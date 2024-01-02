import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App Integration Test', () {
    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      driver.close();
    });

    test('Increment and Decrement', () async {
      // Verify the initial state of the counter.
      expect(await driver.getText(find.byValueKey('counter')), '0');

      // Tap the '+' button.
      await driver.tap(find.byTooltip('Increment'));

      // Verify the incremented state.
      expect(await driver.getText(find.byValueKey('counter')), '1');

      // Tap the '-' button.
      await driver.tap(find.byTooltip('Decrement'));

      // Verify the decremented state.
      expect(await driver.getText(find.byValueKey('counter')), '0');

      // Tap the '-' button.
      await driver.tap(find.byTooltip('Decrement'));

      // Verify the decremented state cannot go below zero. (negative)
      expect(await driver.getText(find.byValueKey('counter')), '0');
    });
  });
}
