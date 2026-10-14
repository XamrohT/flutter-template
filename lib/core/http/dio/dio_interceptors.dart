import 'package:dio/dio.dart';
import 'package:flutter_backoffice_template/core/http/http_service.dart';

/// Converte [DioException] em exceções tipadas de [HttpService].
class DioInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final status = err.response?.statusCode;
    final server = _serverMessage(err.response?.data);

    final HttpError exception = switch (status) {
      400 || 422 => BadRequestException(statusCode: status, serverError: server),
      401 => UnauthorizedException(serverError: server),
      404 => NotFoundException(serverError: server),
      _ => switch (err.type) {
          DioExceptionType.connectionError => NoConnectionException(statusCode: status),
          DioExceptionType.connectionTimeout ||
          DioExceptionType.receiveTimeout ||
          DioExceptionType.sendTimeout =>
            TimeOutException(statusCode: status),
          _ => UnexpectedException(statusCode: status, serverError: server),
        },
    };
    handler.reject(
      DioException(requestOptions: err.requestOptions, response: err.response, type: err.type, error: exception),
    );
  }

  String? _serverMessage(dynamic data) => data is Map && data['error'] is String ? data['error'] : null;
}
