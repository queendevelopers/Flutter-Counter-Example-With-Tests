// ignore_for_file: avoid_print

import 'dart:io';

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

      await driver.takeScreenshot('increment_by_1');

      // Verify the incremented state.
      expect(await driver.getText(find.byValueKey('counter')), '1');

      // Tap the '-' button.
      await driver.tap(find.byTooltip('Decrement'));

      await driver.takeScreenshot('decrement_by_1');

      // Verify the decremented state.
      expect(await driver.getText(find.byValueKey('counter')), '0');

      // Tap the '-' button.
      await driver.tap(find.byTooltip('Decrement'));

      await driver.takeScreenshot('decrement_no_negative');
      // Verify the decremented state cannot go below zero. (negative)
      expect(await driver.getText(find.byValueKey('counter')), '0');
    });
  });
}

extension on FlutterDriver {
  Future<void> takeScreenshot(String name) async {
    String platform = Platform.environment['TARGET_PLATFORM'] ?? 'unknown';
    final filePath = File('screenshots/generated/$platform/$name.png');
    if (await filePath.exists()) {
      await filePath.delete(recursive: true);
    }
    final file = await filePath.create(recursive: true);
    final png = await screenshot();
    file.writeAsBytesSync(png);
    print('screensho with name : $name was taken');
  }
}
