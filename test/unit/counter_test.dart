import 'package:counter/counter.dart';
import 'package:test/test.dart';

void main() {
  late Counter counter;
  group('Counter Logic Unit Test', () {
    setUp(() {
      counter = Counter();
    });
    test('Counter initial value should be 0', () {
      expect(counter.value, 0);
    });
    test('Increment should increase the counter by 1', () {
      // Act
      counter.increment();

      // Assert
      expect(counter.value, 1);
    });

    test('Decrement should decrease the counter by 1', () {
      // Act
      counter.decrement();

      // Assert
      expect(counter.value, 0);
    });

    test('Counter value should not go below zero', () {
      // Act
      counter.decrement();

      // Assert
      expect(counter.value, 0);
    });
  });
}
