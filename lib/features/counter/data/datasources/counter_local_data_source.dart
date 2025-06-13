// Data Layer - Data Sources
// Data sources handle the actual data operations.
// They can be local (database, shared preferences) or remote (API).
// This is where we implement the actual data fetching and storing.

import 'package:shared_preferences/shared_preferences.dart';
import '../models/counter_model.dart';

abstract class CounterLocalDataSource {
  Future<CounterModel> getCounter();
  Future<void> cacheCounter(CounterModel counter);
}

class CounterLocalDataSourceImpl implements CounterLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const String COUNTER_KEY = 'COUNTER_VALUE';

  CounterLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<CounterModel> getCounter() async {
    final value = sharedPreferences.getInt(COUNTER_KEY) ?? 0;
    return CounterModel(value: value);
  }

  @override
  Future<void> cacheCounter(CounterModel counter) async {
    await sharedPreferences.setInt(COUNTER_KEY, counter.value);
  }
} 