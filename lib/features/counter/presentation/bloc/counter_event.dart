// Presentation Layer - Events
// Events represent user actions or system events.
// They are part of the BLoC pattern for state management.
// Events are immutable and contain all the information needed to handle the action.

import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class GetCounterEvent extends CounterEvent {}

class IncrementCounterEvent extends CounterEvent {
  final int currentValue;

  const IncrementCounterEvent(this.currentValue);

  @override
  List<Object> get props => [currentValue];
}

class DecrementCounterEvent extends CounterEvent {
  final int currentValue;

  const DecrementCounterEvent(this.currentValue);

  @override
  List<Object> get props => [currentValue];
} 