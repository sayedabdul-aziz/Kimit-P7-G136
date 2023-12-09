import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static String Image_Key = 'IMAGE';
  static String Name_Key = 'NAME';
  // set
  static cacheData(String key, String value) async {
    var pref = await SharedPreferences.getInstance();
    pref.setString(key, value);
  }

  //get
  static Future<String> getCachedData(String key) async {
    var pref = await SharedPreferences.getInstance();
    return pref.getString(key) ?? '';
  }
}
