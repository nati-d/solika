import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/counter.dart';
import '../repositories/counter_repository.dart';

class IncrementCounterParams {
  final int currentValue;

  IncrementCounterParams({required this.currentValue});
}

class IncrementCounter implements UseCase<Counter, IncrementCounterParams> {
  final CounterRepository repository;

  IncrementCounter(this.repository);

  @override
  Future<Either<Failure, Counter>> call(IncrementCounterParams params) async {
    return await repository.incrementCounter(params.currentValue);
  }
} 