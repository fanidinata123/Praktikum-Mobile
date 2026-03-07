import 'package:flutter/material.dart';

/// Theme aplikasi D4TI — dipanggil dari main.dart
class AppTheme {
  // Warna utama
  static const Color primaryColor = Color(0xFF667eea);
  static const Color textPrimaryColor = Color(0xFF1a1a2e);
  static const Color textSecondaryColor = Color(0xFF6b7280);
  static const Color successColor = Color(0xFF43e97b);
  static const Color errorColor = Color(0xFFf5576c);

  /// Light Theme — tema terang (default)
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      scaffoldBackgroundColor: const Color(0xFFF8F9FA),
    ); // ThemeData
  }

  /// Dark Theme — tema gelap
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.dark,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey.shade900,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
    ); // ThemeData
  }
}