import 'package:clean_bloc_template/app/di/injection_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

class LoginPage extends StatelessWidget {
  final emailCtrl = TextEditingController(text: 'eve.holt@reqres.in');
  final passCtrl = TextEditingController(text: 'cityslicka');

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (_) => getIt<AuthBloc>(),
      child: Scaffold(
        appBar: AppBar(title: Text('Login Demo')),
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.whenOrNull(
              failure: (msg) => ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(msg))),
              success: (user) => ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Token: ${user.token}'))),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(controller: emailCtrl, decoration: InputDecoration(labelText: 'Email')),
                TextField(controller: passCtrl, decoration: InputDecoration(labelText: 'Password')),
                const SizedBox(height: 16),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () => const CircularProgressIndicator(),
                      orElse: () => ElevatedButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(
                            LoginRequested(
                              emailCtrl.text.trim(),
                              passCtrl.text.trim(),
                            ),
                          );
                        },
                        child: const Text('Login'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
