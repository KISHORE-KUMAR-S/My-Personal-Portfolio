import 'package:flutter/material.dart';
import '../extensions/theme_extensions.dart';

class ThemeConfig {
  static List<ThemeData> allThemes({
    required bool isLightMode,
    required int themeIndex,
  }) {
    final baseLightTheme = ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Urbanist',
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      scaffoldBackgroundColor: Colors.white,
      textTheme: _textTheme(Colors.black),
      colorScheme: _colorScheme(lightMode: true),
      inputDecorationTheme: _inputDecorationTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );

    final baseDarkTheme = ThemeData(
      brightness: Brightness.dark,
      fontFamily: 'Urbanist',
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.black,
      textTheme: _textTheme(Colors.white),
      colorScheme: _colorScheme(lightMode: false),
      inputDecorationTheme: _inputDecorationTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );

    final baseTheme = isLightMode ? baseLightTheme : baseDarkTheme;

    return [
      baseTheme,
      modifyThemeColor(theme: baseTheme, color: Colors.indigoAccent),
      modifyThemeColor(theme: baseTheme, color: Colors.blueAccent),
      modifyThemeColor(theme: baseTheme, color: Colors.green),
      modifyThemeColor(theme: baseTheme, color: Colors.amber),
      modifyThemeColor(theme: baseTheme, color: Colors.orange),
      modifyThemeColor(theme: baseTheme, color: Colors.red),
    ];
  }

  static InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      filled: true,
      alignLabelWithHint: true,
    );
  }

  static modifyThemeColor({required ThemeData theme, required Color color}) =>
      theme.copyWith(colorScheme: theme.colorScheme.copyWith(secondary: color));

  static _textTheme(Color color) {
    return TextTheme(
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
      bodyColor: color,
      displayColor: color.withValues(alpha: 0.9),
      // Colors.white.withValues(alpha: 0.9),
      decorationColor: color,
    );
  }

  static _colorScheme({required bool lightMode}) {
    return ColorScheme(
      brightness: lightMode ? Brightness.light : Brightness.dark,
      primary: lightMode ? Colors.white : Colors.black,
      onPrimary: lightMode ? Colors.white : Colors.black,
      secondary: Colors.deepPurpleAccent,
      onSecondary: Colors.red,
      error: Colors.red,
      onError: Colors.red,
      surface: lightMode ? Colors.white : Colors.black,
      onSurface: lightMode ? Colors.white : Colors.black,
    );
  }
}
