import 'package:flutter/material.dart'
    show BuildContext, FontWeight, InputDecorationTheme, Theme, ThemeData;

const bold = FontWeight.w700;
const semiBold = FontWeight.w600;
const medium = FontWeight.w500;
const light = FontWeight.w300;

extension ThemeExtensions on BuildContext {
  ThemeData theme() => Theme.of(this);

  InputDecorationTheme inputDecorationTheme() =>
      InputDecorationTheme(filled: true, alignLabelWithHint: true);
}
