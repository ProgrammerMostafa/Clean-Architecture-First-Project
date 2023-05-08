import '../network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  ServerException({required this.errorMessageModel});
}

class DatabaseException implements Exception {
  final ErrorMessageModel errorMessageModel;

  DatabaseException({required this.errorMessageModel});
}
