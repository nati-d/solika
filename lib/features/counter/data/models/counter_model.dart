// Data Layer - Models
// Models are data layer objects that extend entities.
// They handle the serialization/deserialization of data.
// This is where we implement the data structure for external sources.

import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/counter.dart';

part 'counter_model.g.dart';

@JsonSerializable()
class CounterModel extends Counter {
  const CounterModel({required int value}) : super(value: value);

  factory CounterModel.fromJson(Map<String, dynamic> json) =>
      _$CounterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CounterModelToJson(this);
} 