import 'package:dio/dio.dart';

class CustomInterceptors extends InterceptorsWrapper {
  final _cache = <Uri, Response>{};

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.contentType = 'application/x-www-form-urlencoded';
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _cache[response.requestOptions.uri] = response;
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    Dio dio = Dio();
    int retries = 3; // Defina o número máximo de tentativas aqui
    int statusCode = err.response?.statusCode ?? 0;
    if (statusCode == 500 ||
        statusCode == 503 ||
        err.error == 'Connecting timed out [5000ms]' ||
        err.error == 'Connecting timed out [7000ms]' ||
        err.error == 'Connecting timed out [10000ms]' ||
        err.error == 'Connecting timed out [15000ms]') {
      for (var i = 0; i < retries; i++) {
        try {
          var response = await dio.request(
            err.requestOptions.path,
            options: Options(
              method: err.requestOptions.method,
              headers: err.requestOptions.headers,
              responseType: err.requestOptions.responseType,
              // adicione aqui outras configurações necessárias
            ),
          );
          return response;
        } on DioException catch (e) {
          // ignore: parameter_assignments
          err = e;
        }
      }
    } else {
      if (statusCode == 500 ||
          statusCode == 503 ||
          err.error == 'Connecting timed out [5000ms]' ||
          err.error == 'Connecting timed out [7000ms]' ||
          err.error == 'Connecting timed out [10000ms]' ||
          err.error == 'Connecting timed out [15000ms]') {}
    }
    return super.onError(err, handler);
  }
}
