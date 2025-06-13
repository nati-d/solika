// Presentation Layer - BLoC
// BLoC (Business Logic Component) handles the business logic for the UI.
// It processes events and emits states.
// This is where we connect the UI with the domain layer.

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_counter.dart';
import '../../domain/usecases/increment_counter.dart';
import '../../domain/usecases/decrement_counter.dart';
import 'counter_event.dart';
import 'counter_state.dart';
import '../../../../core/usecases/usecase.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final GetCounter getCounter;
  final IncrementCounter incrementCounter;
  final DecrementCounter decrementCounter;

  CounterBloc({
    required this.getCounter,
    required this.incrementCounter,
    required this.decrementCounter,
  }) : super(CounterInitial()) {
    on<GetCounterEvent>(_onGetCounter);
    on<IncrementCounterEvent>(_onIncrementCounter);
    on<DecrementCounterEvent>(_onDecrementCounter);
  }

  Future<void> _onGetCounter(
    GetCounterEvent event,
    Emitter<CounterState> emit,
  ) async {
    emit(CounterLoading());
    final result = await getCounter(NoParams());

    result.fold(
      (failure) => emit(CounterError('Failed to get counter')),
      (counter) => emit(CounterLoaded(counter)),
    );
  }

  Future<void> _onIncrementCounter(
    IncrementCounterEvent event,
    Emitter<CounterState> emit,
  ) async {
    emit(CounterLoading());
    final result = await incrementCounter(IncrementCounterParams(
      currentValue: event.currentValue,
    ));

    result.fold(
      (failure) => emit(CounterError('Failed to increment counter')),
      (counter) => emit(CounterLoaded(counter)),
    );
  }

  Future<void> _onDecrementCounter(
    DecrementCounterEvent event,
    Emitter<CounterState> emit,
  ) async {
    emit(CounterLoading());
    final result = await decrementCounter(DecrementCounterParams(
      currentValue: event.currentValue,
    ));

    result.fold(
      (failure) => emit(CounterError('Failed to decrement counter')),
      (counter) => emit(CounterLoaded(counter)),
    );
  }
} 