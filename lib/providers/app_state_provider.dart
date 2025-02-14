import 'package:flutter/material.dart';

import '../repositories/theme_repository.dart';
import '../utils/config/theme_config.dart';

class AppStateProvider extends ChangeNotifier {
  AppStateProvider(this.themeRepo) {
    Future.delayed(Duration(milliseconds: 300), () {
      initCurrentTheme();
    });
  }

  bool _isNavbarOpen = false;
  bool get isNavbarOpen => _isNavbarOpen;

  bool _isSplashAnimationDone = false;
  bool get isSplashAnimationDone => _isSplashAnimationDone;

  final ThemeRepository themeRepo;

  ThemeData get currentTheme => ThemeConfig.allThemes()[themeRepo.currentTheme];
  int get currentIndex => themeRepo.currentTheme;

  void initCurrentTheme() async {
    await themeRepo.getThemeFromDatabase();
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

  setNavAnimationStatus(status) {
    _isSplashAnimationDone = status;
    notifyListeners();
  }
}
