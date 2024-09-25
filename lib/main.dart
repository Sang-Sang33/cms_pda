import 'package:cms_pda/screens/check_detail_screen.dart';
import 'package:cms_pda/screens/collect_screen.dart';
import 'package:cms_pda/screens/collet_detail_screen.dart';
import 'package:cms_pda/screens/home_screen.dart';
import 'package:cms_pda/screens/login_screen.dart';
import 'package:cms_pda/screens/palletize_screen.dart';
import 'package:cms_pda/screens/qc_check_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (_, __) => const HomeScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (_, __) => const LoginScreen(),
    ),
    GoRoute(
      path: '/collect',
      builder: (_, __) => const CollectScreen(),
    ),
    GoRoute(
      path: '/collect/:materialName',
      builder: (_, state) => ColletDetailScreen(
        materialName: state.pathParameters['materialName']!,
      ),
    ),
    GoRoute(
      path: '/qc/check',
      builder: (_, __) => const QcCheckScreen(),
    ),
    GoRoute(
      path: '/qc/check/:orderCode',
      builder: (_, state) => CheckDetailScreen(
        orderCode: state.pathParameters['orderCode']!,
      ),
    ),
    GoRoute(
      path: '/palletize',
      builder: (_, __) => const PalletizeScreen(),
    ),
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
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF005dff),
          primary: const Color(0xFF008fff),
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF005dff),
          centerTitle: true,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontSize: 20,
          ),
        ),
        scaffoldBackgroundColor: const Color(0xfff6fbff),
        outlinedButtonTheme: const OutlinedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll<Color>(
              Color(0xff008fff),
            ),
            backgroundColor: WidgetStatePropertyAll<Color>(
              Color(0xffeef7ff),
            ),
            side: WidgetStatePropertyAll<BorderSide>(
              BorderSide(
                color: Color(0xffaed7f6),
              ),
            ),
          ),
        ),
      ),
      routerConfig: _router,
    );
  }
}
