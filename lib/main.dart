import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/counter/data/datasources/counter_local_data_source.dart';
import 'features/counter/data/repositories/counter_repository_impl.dart';
import 'features/counter/domain/repositories/counter_repository.dart';
import 'features/counter/domain/usecases/get_counter.dart';
import 'features/counter/domain/usecases/increment_counter.dart';
import 'features/counter/domain/usecases/decrement_counter.dart';
import 'features/counter/presentation/bloc/counter_bloc.dart';
import 'features/counter/presentation/bloc/counter_event.dart';
import 'features/counter/presentation/pages/counter_page.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // Bloc
  getIt.registerFactory(
    () => CounterBloc(
      getCounter: getIt(),
      incrementCounter: getIt(),
      decrementCounter: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetCounter(getIt()));
  getIt.registerLazySingleton(() => IncrementCounter(getIt()));
  getIt.registerLazySingleton(() => DecrementCounter(getIt()));

  // Repository
  getIt.registerLazySingleton<CounterRepository>(
    () => CounterRepositoryImpl(
      localDataSource: getIt(),
    ),
  );

  // Data sources
  getIt.registerLazySingleton<CounterLocalDataSource>(
    () => CounterLocalDataSourceImpl(
      sharedPreferences: getIt(),
    ),
  );

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => getIt<CounterBloc>()..add(GetCounterEvent()),
        child: const CounterPage(),
      ),
    );
  }
}
