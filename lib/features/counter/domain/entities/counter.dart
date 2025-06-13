// Domain Layer - Entities
// Entities are the core business objects of the application.
// They are independent of any specific implementation details.
// This is the innermost layer of Clean Architecture.

import 'package:equatable/equatable.dart';

class Counter extends Equatable {
  final int value;

  const Counter({required this.value});

  @override
  List<Object> get props => [value];
} 