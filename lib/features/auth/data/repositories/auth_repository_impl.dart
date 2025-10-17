import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/login_entity.dart';
import '../datasources/auth_remote_data_source.dart';
import '../../domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, LoginEntity>> login(String email, String password) async {
    try {
      final response = await remoteDataSource.login(email, password);
      // map LoginResponse to LoginEntity (domain)
      final entity = LoginEntity(token: response.token);
      return Right(entity);
    } on ServerException catch (e) {
      return Left(Failure(e.message ?? 'Server error'));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
