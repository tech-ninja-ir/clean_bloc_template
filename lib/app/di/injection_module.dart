import 'package:clean_bloc_template/app/di/injection_module.config.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../core/network/dio_client.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => getIt.init();

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio() {
    final baseUrl = dotenv.env['API_BASE_URL'] ?? '';
    return Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      ),
    );
  }
}