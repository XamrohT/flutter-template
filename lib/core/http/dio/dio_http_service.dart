import 'package:dio/dio.dart';
import 'package:flutter_backoffice_template/core/http/dio/dio_interceptors.dart';
import 'package:flutter_backoffice_template/core/http/http_service.dart';

class DioHttpService implements HttpService {
  final Dio _client = Dio();

  DioHttpService({required this.baseUrl, this.timeout = 60, Interceptor? interceptor}) {
    _client.interceptors.add(interceptor ?? DioInterceptor());
    _client.options
      ..baseUrl = baseUrl
      ..connectTimeout = Duration(seconds: timeout)
      ..receiveTimeout = Duration(seconds: timeout);
  }

  @override
  String baseUrl;

  @override
  int timeout;

  @override
  void updateHeaders({Map<String, dynamic>? headers}) => _client.options.headers = headers ?? {};

  Future _send(String method, String path, data, queryParams) async {
    try {
      final response = await _client.request(
        path,
        data: data,
        queryParameters: queryParams,
        options: Options(method: method),
      );
      return response.data;
    } on DioException catch (e) {
      throw e.error is HttpError ? e.error! : e;
    }
  }

  @override
  Future get({required String path, data, queryParams}) => _send('GET', path, data, queryParams);
  @override
  Future post({required String path, data, queryParams}) => _send('POST', path, data, queryParams);
  @override
  Future put({required String path, data, queryParams}) => _send('PUT', path, data, queryParams);
  @override
  Future patch({required String path, data, queryParams}) => _send('PATCH', path, data, queryParams);
  @override
  Future delete({required String path, data, queryParams}) => _send('DELETE', path, data, queryParams);
}
