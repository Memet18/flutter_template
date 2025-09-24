import 'package:equatable/equatable.dart';

abstract class ValueFailure<T> extends Equatable {
  const ValueFailure({required this.failedValue});

  final T failedValue;

  @override
  List<Object?> get props => [failedValue];
}

class EmptyValueFailure<T> extends ValueFailure<T> {
  const EmptyValueFailure({required super.failedValue});
}

class MultiLineValueFailure<T> extends ValueFailure<T> {
  const MultiLineValueFailure({required super.failedValue});
}

class NotInRangeValueFailure<T> extends ValueFailure<T> {
  const NotInRangeValueFailure({
    required super.failedValue,
    required this.minimum,
    required this.maximum,
  });

  final T minimum;
  final T maximum;

  @override
  List<Object?> get props => [failedValue, minimum, maximum];
}

class InvalidUniqueIdValueFailure<T> extends ValueFailure<T> {
  const InvalidUniqueIdValueFailure({required super.failedValue});
}
