import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/login_entity.dart';
part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.success(LoginEntity user) = AuthSuccess;
  const factory AuthState.failure(String message) = AuthFailure;
}
