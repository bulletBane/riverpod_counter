import 'package:flutter_riverpod/flutter_riverpod.dart';

var counterVal = StateProvider((_) => 0);
StateNotifierProvider<Counter> counterProvider = StateNotifierProvider((data) {
  return Counter();
});

class Counter extends StateNotifier<int> {
  Counter() : super(0);
  void increment() => state++;
}
