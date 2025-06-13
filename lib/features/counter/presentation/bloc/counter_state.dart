// Presentation Layer - States
// States represent the UI state at any given moment.
// They are part of the BLoC pattern for state management.
// States are immutable and contain all the information needed to render the UI.

import 'package:equatable/equatable.dart';
import '../../domain/entities/counter.dart';

abstract class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object> get props => [];
}

class CounterInitial extends CounterState {}

class CounterLoading extends CounterState {}

class CounterLoaded extends CounterState {
  final Counter counter;

  const CounterLoaded(this.counter);

  @override
  List<Object> get props => [counter];
}

class CounterError extends CounterState {
  final String message;

  const CounterError(this.message);

  @override
  List<Object> get props => [message];
} 