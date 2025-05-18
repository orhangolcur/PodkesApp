import 'package:flutter/material.dart';
import 'core/router/app_router.dart';

class PodkesApp extends StatelessWidget {
  const PodkesApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1C1B2D),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        colorScheme: const ColorScheme.dark().copyWith(
          primary: Colors.purpleAccent,
          secondary: Colors.deepPurpleAccent,
        ),
      ),
    );
  }
}