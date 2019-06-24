import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  Future<SharedPreferences> instance() async {
    return SharedPreferences.getInstance();
  }
}
