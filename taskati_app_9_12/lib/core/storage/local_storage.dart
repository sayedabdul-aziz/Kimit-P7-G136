import 'package:hive/hive.dart';

class AppLocalStorage {
  static String Image_Key = 'IMAGE';
  static String Name_Key = 'NAME';
  static String IS_UPLOAD = 'IS_UPLOAD';
  // set
  static cacheData(String key, dynamic value) async {
    var box = Hive.box('user');
    box.put(key, value);
  }

  //get
  static Future<dynamic> getCachedData(String key) async {
    var box = Hive.box('user');
    return box.get(key);
  }
}
