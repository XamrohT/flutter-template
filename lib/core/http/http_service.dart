import 'package:flutter_backoffice_template/generated/l10n.dart';

abstract class HttpService {
  HttpService(this.baseUrl, this.timeout);

  String baseUrl;
  int timeout;

  void updateHeaders({Map<String, dynamic>? headers});
  Future get({required String path, data, queryParams});
  Future post({required String path, data, queryParams});
  Future put({required String path, data, queryParams});
  Future patch({required String path, data, queryParams});
  Future delete({required String path, data, queryParams});
}

/// Erro HTTP tipado. [message] vem do servidor ou da tradução (l10n).
class HttpError implements Exception {
  final int? statusCode;
  final String message;

  HttpError(this.message, {this.statusCode});

  @override
  String toString() => message;
}

class BadRequestException extends HttpError {
  BadRequestException({super.statusCode = 400, String? serverError})
      : super(serverError ?? S.current.badRequestExceptionMessage);
}

class UnauthorizedException extends HttpError {
  UnauthorizedException({super.statusCode = 401, String? serverError})
      : super(serverError ?? S.current.unauthorizedExceptionMessage);
}

class NotFoundException extends HttpError {
  NotFoundException({super.statusCode = 404, String? serverError})
      : super(serverError ?? S.current.notFoundExceptionMessage);
}

class NoConnectionException extends HttpError {
  NoConnectionException({super.statusCode, String? serverError})
      : super(serverError ?? S.current.noConnectionExceptionMessage);
}

class TimeOutException extends HttpError {
  TimeOutException({super.statusCode, String? serverError})
      : super(serverError ?? S.current.timeOutExceptionMessage);
}

class UnexpectedException extends HttpError {
  UnexpectedException({super.statusCode = 500, String? serverError})
      : super(serverError ?? S.current.defaultExceptionMessage);
}
