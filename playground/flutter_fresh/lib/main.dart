import 'package:flutter/material.dart';
import 'package:flutter_fresh/provider/test.dart';
import 'package:flutter_fresh/screens/auth/forgot.dart';
import 'package:flutter_fresh/screens/auth/registerscreen.dart';
import 'package:flutter_fresh/screens/auth/regsucess.dart';
import 'package:flutter_fresh/screens/auth/verify.dart';

import 'package:flutter_fresh/screens/homescreen.dart';
import 'package:flutter_fresh/screens/introscreen.dart';
import 'package:flutter_fresh/screens/auth/loginscreen.dart';
import 'package:flutter_fresh/screens/splashscreen.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
        path: "/",
        pageBuilder: (context, state) => CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1200),
              key: state.pageKey,
              child: const Splashscreen(),
              transitionsBuilder: (context, animation, secondaryAnimation,
                      child) =>
                  FadeTransition(
                      opacity: CurveTween(curve: Curves.easeInOut)
                          .animate(animation),
                      child: child),
            )),
    GoRoute(
        path: "/intro",
        pageBuilder: (context, state) => CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1200),
              key: state.pageKey,
              child: const Introscreen(),
              transitionsBuilder: (context, animation, secondaryAnimation,
                      child) =>
                  FadeTransition(
                      opacity: CurveTween(curve: Curves.easeInOut)
                          .animate(animation),
                      child: child),
            )),
    GoRoute(
        path: "/home",
        pageBuilder: (context, state) => CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1700),
              key: state.pageKey,
              child: const Homescreen(),
              transitionsBuilder: (context, animation, secondaryAnimation,
                      child) =>
                  FadeTransition(
                      opacity: CurveTween(curve: Curves.elasticInOut)
                          .animate(animation),
                      child: child),
            )),
    GoRoute(
        path: "/auth",
        pageBuilder: (context, state) => CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1700),
              key: state.pageKey,
              child: Loginscreen(),
              transitionsBuilder: (context, animation, secondaryAnimation,
                      child) =>
                  FadeTransition(
                      opacity: CurveTween(curve: Curves.elasticInOut)
                          .animate(animation),
                      child: child),
            ),
        routes: [
          GoRoute(
            path: "register",
            pageBuilder: (context, state) => CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1700),
              key: state.pageKey,
              child: Registerscreen(),
              transitionsBuilder: (context, animation, secondaryAnimation,
                      child) =>
                  FadeTransition(
                      opacity: CurveTween(curve: Curves.elasticInOut)
                          .animate(animation),
                      child: child),
            )
          ),
          GoRoute(
            path: "forgot",
            pageBuilder: (context, state) => CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1700),
              key: state.pageKey,
              child: Forgot(),
              transitionsBuilder: (context, animation, secondaryAnimation,
                      child) =>
                  FadeTransition(
                      opacity: CurveTween(curve: Curves.elasticInOut)
                          .animate(animation),
                      child: child),
            )
          ),

          GoRoute(
            path: "verify",
            pageBuilder: (context, state) => CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1700),
              key: state.pageKey,
              child: Verify(),
              transitionsBuilder: (context, animation, secondaryAnimation,
                      child) =>
                  FadeTransition(
                      opacity: CurveTween(curve: Curves.elasticInOut)
                          .animate(animation),
                      child: child),
            )
          ),

          GoRoute(
            path: "regsuccess",
            pageBuilder: (context, state) => CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1700),
              key: state.pageKey,
              child: const Regsucess(),
              transitionsBuilder: (context, animation, secondaryAnimation,
                      child) =>
                  FadeTransition(
                      opacity: CurveTween(curve: Curves.elasticInOut)
                          .animate(animation),
                      child: child),
            )
          )
        ]),
  ],
);

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  // This widget is the root of your application.

  @override
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
