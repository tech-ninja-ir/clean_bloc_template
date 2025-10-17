import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class DioClient {
  final Dio dio;

  DioClient(this.dio) {
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }
}
