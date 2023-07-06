
import 'package:dio/dio.dart';

abstract class IHttpClient {
  Future get({required String url});
}

class HttpClient implements IHttpClient {
  //final client = dio.Client();

  @override
  Future get({required String url}) async {
    //return await client.get(Uri.parse(url));
  }
}
