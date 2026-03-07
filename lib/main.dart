import 'package:trying_flutter/core/constants/app_constants.dart';
import 'package:trying_flutter/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:trying_flutter/features/dashboard/presentation/pages/dashboard_page.dart';

// Run | Debug | Profile
void main() {
  // runApp(const MyApp()); // tanpa Riverpod
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,       // Tema terang
      darkTheme: AppTheme.darkTheme,    // Tema gelap
      themeMode: ThemeMode.light,       // Default: tema terang
      home: const DashboardPage(),      // Halaman pertama
    ); // MaterialApp
  }
}