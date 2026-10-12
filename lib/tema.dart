import 'package:flutter/material.dart';

const azulNexo = Color(0xFF082754);
const cianoNexo = Color(0xFF00B8DF);
const fundoNexo = Color(0xFFF4F7FB);
const textoSecundario = Color(0xFF52647A);

ThemeData criarTema() {
  final cores = ColorScheme.fromSeed(
    seedColor: azulNexo,
    primary: azulNexo,
    secondary: cianoNexo,
    surface: Colors.white,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: cores,
    scaffoldBackgroundColor: fundoNexo,
    appBarTheme: const AppBarTheme(
      backgroundColor: fundoNexo,
      foregroundColor: azulNexo,
      centerTitle: false,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w800,
        height: 1.15,
        color: azulNexo,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        height: 1.25,
        color: azulNexo,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: azulNexo,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: azulNexo,
      ),
      bodyLarge: TextStyle(fontSize: 16, height: 1.5, color: azulNexo),
      bodyMedium: TextStyle(fontSize: 14, height: 1.5, color: textoSecundario),
      labelLarge: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Color(0xFFE0E7F0)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: azulNexo,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 54),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.all(18),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0xFFBDCADA)),
      ),
    ),
    snackBarTheme: const SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: azulNexo,
    ),
  );
}
