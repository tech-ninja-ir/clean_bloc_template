// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:clean_bloc_template/app/di/injection_module.dart' as _i42;
import 'package:clean_bloc_template/core/network/dio_client.dart' as _i763;
import 'package:clean_bloc_template/features/auth/data/datasources/auth_remote_data_source.dart'
    as _i79;
import 'package:clean_bloc_template/features/auth/data/repositories/auth_repository_impl.dart'
    as _i366;
import 'package:clean_bloc_template/features/auth/domain/repositories/auth_repository.dart'
    as _i359;
import 'package:clean_bloc_template/features/auth/domain/usecases/login_user.dart'
    as _i362;
import 'package:clean_bloc_template/features/auth/presentation/bloc/auth_bloc.dart'
    as _i583;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio());
    gh.lazySingleton<_i79.AuthRemoteDataSource>(
        () => _i79.AuthRemoteDataSourceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i763.DioClient>(() => _i763.DioClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i359.AuthRepository>(() => _i366.AuthRepositoryImpl(
        remoteDataSource: gh<_i79.AuthRemoteDataSource>()));
    gh.lazySingleton<_i362.LoginUser>(
        () => _i362.LoginUser(gh<_i359.AuthRepository>()));
    gh.factory<_i583.AuthBloc>(
        () => _i583.AuthBloc(loginUser: gh<_i362.LoginUser>()));
    return this;
  }
}

class _$NetworkModule extends _i42.NetworkModule {}
