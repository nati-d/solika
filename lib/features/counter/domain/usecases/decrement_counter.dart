import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/counter.dart';
import '../repositories/counter_repository.dart';

class DecrementCounterParams {
  final int currentValue;

  DecrementCounterParams({required this.currentValue});
}

class DecrementCounter implements UseCase<Counter, DecrementCounterParams> {
  final CounterRepository repository;

  DecrementCounter(this.repository);

  @override
  Future<Either<Failure, Counter>> call(DecrementCounterParams params) async {
    return await repository.decrementCounter(params.currentValue);
  }
} 