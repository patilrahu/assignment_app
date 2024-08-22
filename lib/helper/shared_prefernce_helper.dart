import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefernceHelper {
  static var customSharedPreferences = SharedPrefernceHelper();
  static const saveListofImage = 'saveImageList';
  static const addToCartImage = 'addToCartImage';

  SharedPreferences? _prefs;
  Future<void> initPrefs() async {
    return await SharedPreferences.getInstance().then((prefs) {
      _prefs = prefs;
    });
  }

  void saveValue<T>(String key, T value) {
    if (_prefs == null) {
      throw Exception('SharedPreferences not initialized');
    }

    if (value is List<String>) {
      _prefs!.setStringList(key, value);
    } else {
      throw Exception('Unsupported value type');
    }
  }

  getValue<T>(String key) {
    if (_prefs == null) {
      throw Exception('SharedPreferences not initialized');
    }

    if (T == List<String>) {
      return _prefs?.getStringList(key);
    } else {
      throw Exception('Unsupported value type');
    }
  }
}
