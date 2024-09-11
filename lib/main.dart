import 'package:cms_pda/screens/collect_screen.dart';
import 'package:cms_pda/screens/home_screen.dart';
import 'package:cms_pda/screens/login_screen.dart';
import 'package:cms_pda/screens/qc_check_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/collect',
      builder: (context, state) => const CollectScreen(),
    ),
    GoRoute(
      path: '/qc/check',
      builder: (context, state) => const QRViewExample(),
    )
  ],
  initialLocation: '/login',
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF005dff)),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF005dff),
          centerTitle: true,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      routerConfig: _router,
    );
  }
}
