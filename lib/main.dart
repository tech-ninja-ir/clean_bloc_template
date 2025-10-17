import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app/di/injection_module.dart';
import 'app/routes/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1️⃣ Load environment variables (.env)
  await dotenv.load(fileName: ".env");

  // 2️⃣ Setup dependency injection (GetIt + Injectable)
  await configureDependencies();

  // 3️⃣ (Optional) Setup a custom BlocObserver for logging
  Bloc.observer = AppBlocObserver();

  // 4️⃣ Run app
  runApp(const MyApp());
}

// Bloc observer just for logging changes (optional)
class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('${bloc.runtimeType} → $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('❌ Error in ${bloc.runtimeType}: $error');
    super.onError(bloc, error, stackTrace);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Clean Architecture Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      routerConfig: router, // از go_router
    );
  }
}
