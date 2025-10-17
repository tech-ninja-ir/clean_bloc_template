import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import '../../domain/usecases/login_user.dart';

@Injectable()
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUser loginUser;
  AuthBloc({required this.loginUser}) : super(const AuthState.initial()) {
    on<LoginRequested>((event, emit) async {
      emit(const AuthState.loading());
      final res = await loginUser(event.email, event.password);
      res.fold(
            (failure) => emit(AuthState.failure(failure.message)),
            (user) => emit(AuthState.success(user)),
      );
    });
  }
}
