import 'package:dio/dio.dart';

import 'interceptors.dart';

class CustomDio {
  final Dio client;

  CustomDio(this.client) {
    client.options.baseUrl = 'https://storecarapi.onrender.com/';
    client.options.connectTimeout = const Duration(seconds: 5);
    client.interceptors.add(CustomInterceptors());
  }
}
