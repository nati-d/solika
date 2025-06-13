// Data Layer - Repository Implementation
// Repository implementations handle the coordination between data sources.
// They implement the repository interfaces defined in the domain layer.
// This is where we handle data operations and error cases.

import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/counter.dart';
import '../../domain/repositories/counter_repository.dart';
import '../datasources/counter_local_data_source.dart';
import '../models/counter_model.dart';

class CounterRepositoryImpl implements CounterRepository {
  final CounterLocalDataSource localDataSource;

  CounterRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, Counter>> getCounter() async {
    try {
      final counter = await localDataSource.getCounter();
      return Right(counter);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Counter>> incrementCounter(int currentValue) async {
    try {
      final newCounter = CounterModel(value: currentValue + 1);
      await localDataSource.cacheCounter(newCounter);
      return Right(newCounter);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Counter>> decrementCounter(int currentValue) async {
    try {
      final newCounter = CounterModel(value: currentValue - 1);
      await localDataSource.cacheCounter(newCounter);
      return Right(newCounter);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
} 