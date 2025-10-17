import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/pages/login_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LoginPage(),
    ),
    // اگر خواستی صفحه‌ی دیگری اضافه کنی (مثلاً dashboard)
    // GoRoute(
    //   path: '/home',
    //   builder: (context, state) => HomePage(),
    // ),
  ],
);