import 'package:flutter/material.dart';
import '../extensions/theme_extensions.dart';

class ThemeConfig {
  static List<ThemeData> allThemes() {
    final defaultTheme = ThemeData(
      fontFamily: "Urbanist",
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.black,
      textTheme: TextTheme(
        headlineLarge: TextStyle(fontSize: 127),
        headlineMedium: TextStyle(fontSize: 70, fontWeight: semiBold),
        headlineSmall: TextStyle(fontSize: 60, fontWeight: bold),
        titleLarge: TextStyle(fontSize: 48, fontWeight: bold),
        titleMedium: TextStyle(fontSize: 28, fontWeight: bold),
        titleSmall: TextStyle(fontSize: 26, fontWeight: bold),
        labelLarge: TextStyle(fontSize: 25, fontWeight: bold),
        labelMedium: TextStyle(fontSize: 25, fontWeight: bold),
        labelSmall: TextStyle(fontSize: 18),
        bodyLarge: TextStyle(fontSize: 16, fontWeight: light),
        bodyMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
        bodySmall: TextStyle(fontSize: 10, fontWeight: medium),
      ).apply(
        bodyColor: Colors.white,
        displayColor: Colors.white.withValues(alpha: 0.9),
        decorationColor: Colors.white,
      ),
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Colors.black,
        onPrimary: Colors.black,
        secondary: Colors.deepPurple,
        onSecondary: Colors.red,
        error: Colors.red,
        onError: Colors.red,
        surface: Colors.black,
        onSurface: Colors.black,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        alignLabelWithHint: true,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );

    return [
      defaultTheme,
      modifyThemeColor(theme: defaultTheme, color: Colors.indigo),
      modifyThemeColor(theme: defaultTheme, color: Colors.blue),
      modifyThemeColor(theme: defaultTheme, color: Colors.green),
      modifyThemeColor(theme: defaultTheme, color: Colors.yellow),
      modifyThemeColor(theme: defaultTheme, color: Colors.orange),
      modifyThemeColor(theme: defaultTheme, color: Colors.red),
    ];
  }

  static modifyThemeColor({required ThemeData theme, required Color color}) =>
      theme.copyWith(colorScheme: theme.colorScheme.copyWith(secondary: color));
}
