// Domain Layer - Repository Interface
// Repository interfaces define the contract for data operations.
// They are part of the domain layer and are implemented in the data layer.
// This follows the Dependency Inversion Principle.

import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/counter.dart';

abstract class CounterRepository {
  Future<Either<Failure, Counter>> getCounter();
  Future<Either<Failure, Counter>> incrementCounter(int currentValue);
  Future<Either<Failure, Counter>> decrementCounter(int currentValue);
} 