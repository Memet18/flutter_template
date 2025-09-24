import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  const Failure({this.message});
  final String? message;

  @override
  List<Object?> get props => [message];
}

final class LocalFailure extends Failure {
  const LocalFailure({super.message});
}

final class CouldNotLaunchUrlFailure extends Failure {
  const CouldNotLaunchUrlFailure();
}

sealed class ServerFailure extends Failure {
  const ServerFailure({required super.message});
}

final class CancelRequest extends ServerFailure {
  const CancelRequest({required super.message});
}

final class TimeOutServerFailure extends ServerFailure {
  const TimeOutServerFailure({required super.message});
}

final class BadResponse extends ServerFailure {
  const BadResponse({required this.statusCode, required super.message});
  final int? statusCode;
}

final class ConnectionServerFailure extends ServerFailure {
  const ConnectionServerFailure({required super.message});
}

final class BadCertificate extends ServerFailure {
  const BadCertificate({required super.message});
}

final class UnknownServerFailure extends ServerFailure {
  const UnknownServerFailure({required super.message});
}

final class ValidationFailure extends ServerFailure {
  const ValidationFailure({required super.message});
}
