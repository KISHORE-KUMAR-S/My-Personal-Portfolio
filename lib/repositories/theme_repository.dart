import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

class ThemeRepository {
  int currentlySelectedThemeIndex = 0;
  bool currentlySelectedToneIndex = false;

  ThemeRepository(
    this.currentlySelectedThemeIndex,
    this.currentlySelectedToneIndex,
  );

  int get currentTheme => currentlySelectedThemeIndex;
  bool get currentTone => currentlySelectedToneIndex;

  Future updateTheme(int index) async {
    currentlySelectedThemeIndex = index;
    await updateThemeInDatabase(index);
  }

  Future updateTone(bool value) async {
    currentlySelectedToneIndex = value;
    await updateToneInDatabase(value);
  }

  updateThemeInDatabase(int index) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('current_theme', index);
  }

  updateToneInDatabase(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('current_tone', value);
  }

  Future getThemeFromDatabase() async {
    final prefs = await SharedPreferences.getInstance();
    currentlySelectedThemeIndex = prefs.getInt('current_theme') ?? 0;
  }

  Future getToneFromDatabase() async {
    final prefs = await SharedPreferences.getInstance();
    currentlySelectedToneIndex = prefs.getBool('current_tone') ?? false;
  }
}
