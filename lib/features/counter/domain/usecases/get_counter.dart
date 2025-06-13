// Domain Layer - Use Case
// Use cases contain the application's business logic.
// Each use case represents a single action that can be performed.
// They orchestrate the flow of data to and from entities.

import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/counter.dart';
import '../repositories/counter_repository.dart';

class GetCounter implements UseCase<Counter, NoParams> {
  final CounterRepository repository;

  GetCounter(this.repository);

  @override
  Future<Either<Failure, Counter>> call(NoParams params) async {
    return await repository.getCounter();
  }
} 