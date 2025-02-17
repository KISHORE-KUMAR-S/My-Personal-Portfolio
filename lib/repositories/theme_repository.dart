import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

class ThemeRepository {
  int currentlySelectedThemeIndex = 0;

  ThemeRepository(this.currentlySelectedThemeIndex);

  int get currentTheme => currentlySelectedThemeIndex;

  Future updateTheme(int index) async {
    currentlySelectedThemeIndex = index;
    await updateThemeInDatabase(index);
  }

  updateThemeInDatabase(int index) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('current_theme', index);
  }

  Future getThemeFromDatabase() async {
    final prefs = await SharedPreferences.getInstance();
    currentlySelectedThemeIndex = prefs.getInt('current_theme') ?? 0;
  }
}
