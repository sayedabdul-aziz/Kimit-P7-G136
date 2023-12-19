import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static String Image_Key = 'IMAGE';
  static String Name_Key = 'NAME';
  static String IS_UPLOAD = 'IS_UPLOAD';
  // set
  static cacheData(String key, value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (value is String) {
      pref.setString(key, value);
    } else if (value is bool) {
      pref.setBool(key, value);
    } else {
      pref.setInt(key, value);
    }
  }

  //get
  static Future<dynamic> getCachedData(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.get(key);
  }
}
