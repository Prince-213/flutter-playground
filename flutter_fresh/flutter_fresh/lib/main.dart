import 'package:flutter/material.dart';
import 'package:flutter_fresh/provider/test.dart';
import 'package:flutter_fresh/screens/futurescreen.dart';
import 'package:flutter_fresh/screens/homescreen.dart';
import 'package:flutter_fresh/screens/search_screen.dart';
import 'package:flutter_fresh/screens/statescreen.dart';
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
      builder: (context, state) => const Homescreen(),
    ),
    GoRoute(
      path: "/state",
      builder: (context, state) => const Statescreen(),
    ),
    GoRoute(
      path: "/future",
      builder: (context, state) => const Futurescreen(),
    ),
    GoRoute(
      path: "/search",
      builder: (context, state) => const Searchscreen(),
    ),
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
      theme: theme ? ThemeData.light() : ThemeData.dark(),
      routerConfig: _router,
    );
  }
}

