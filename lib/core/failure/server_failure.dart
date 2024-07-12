import 'failure.dart';

/// General remote failures
class ServerFailure extends Failure {
  String? error, errorCode;

  ServerFailure({
    required super.statusCode,
    super.message,
    this.error,
    this.errorCode,
  });

  factory ServerFailure.fromMap(Map<String, dynamic> json) {
    return ServerFailure(
      statusCode: json['statusCode'] ?? '',
      error: json['error'],
      message: json["message"],
      errorCode: json['errorCode'] ?? '',
    );
  }
}
