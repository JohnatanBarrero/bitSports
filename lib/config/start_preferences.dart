import 'package:shared_preferences/shared_preferences.dart';

class StrarPreferences {
  static final StrarPreferences _instance = StrarPreferences._internal();

  //Esto es el singleton
  factory StrarPreferences() {
    return _instance;
  }
  StrarPreferences._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String get token {
    return _prefs.getString('token') ?? '';
  }

  set token(String value) {
    _prefs.setString('token', value);
  }
}