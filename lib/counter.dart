class Counter {
  int value;
  Counter({this.value = 0});
  int increment() => ++value;
  int decrement() => value > 0 ? --value : 0;
}
