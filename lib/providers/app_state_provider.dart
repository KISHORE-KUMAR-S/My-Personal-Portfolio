import 'package:flutter/material.dart';

import '../repositories/theme_repository.dart';
import '../utils/config/theme_config.dart';

class AppStateProvider extends ChangeNotifier {
  AppStateProvider(this.themeRepo) {
    Future.delayed(Duration(milliseconds: 300), () {
      initCurrentThemeAndTone();
    });
  }

  bool _isNavbarOpen = false;
  bool get isNavbarOpen => _isNavbarOpen;

  bool _isSplashAnimationDone = false;
  bool get isSplashAnimationDone => _isSplashAnimationDone;

  bool _isLightMode = false;
  bool get isLightMode => _isLightMode;

  final ThemeRepository themeRepo;

  ThemeData get currentTheme {
    return ThemeConfig.allThemes(
      isLightMode: _isLightMode,
      themeIndex: themeRepo.currentTheme,
    )[themeRepo.currentTheme];
  }

  int get currentIndex => themeRepo.currentTheme;

  void initCurrentThemeAndTone() async {
    await themeRepo.getThemeFromDatabase();
    await themeRepo.getToneFromDatabase();

    _isLightMode = themeRepo.currentTone;

    notifyListeners();
  }

  updateThemeIndex(int index) async {
    await themeRepo.updateTheme(index);
    notifyListeners();
  }

  toggleNavbar() {
    _isNavbarOpen = !_isNavbarOpen;
    notifyListeners();
  }

  Future<void> toggleIsLightMode() async {
    _isLightMode = !_isLightMode;
    await themeRepo.updateTone(_isLightMode);
    notifyListeners();
  }

  setNavAnimationStatus(status) {
    _isSplashAnimationDone = status;
    notifyListeners();
  }
}
