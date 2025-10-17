import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../entities/login_entity.dart';
import '../repositories/auth_repository.dart';

@LazySingleton()
class LoginUser {
  final AuthRepository repository;
  LoginUser(this.repository);

  Future<Either<Failure, LoginEntity>> call(String email, String password) {
    return repository.login(email, password);
  }
}
