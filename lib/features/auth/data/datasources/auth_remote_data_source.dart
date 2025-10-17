import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../models/login_response.dart';
import '../../../../core/errors/exceptions.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponse> login(String email, String password);
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;
  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<LoginResponse> login(String email, String password) async {
    try {
      final res = await dio.post('/login', data: {'email': email, 'password': password});
      if (res.statusCode == 200 || res.statusCode == 201) {
        return LoginResponse.fromJson(res.data);
      } else {
        throw ServerException('Status code: ${res.statusCode}');
      }
    } on DioError catch (e) {
      // می‌تونیم جزئیات بیشتری از e.response داشته باشیم
      throw ServerException(e.response?.data?['error'] ?? e.message);
    }
  }
}