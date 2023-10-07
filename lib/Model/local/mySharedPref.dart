import 'package:shared_preferences/shared_preferences.dart';

class MySharedPref {

  //Keys
  static const String _fcmTokenKey = 'fcm_token';

  // get storage
  static late SharedPreferences _sharedPreferences;

  /// init get storage services
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static setStorage(SharedPreferences sharedPreferences) {
    _sharedPreferences = sharedPreferences;
  }
  /// save generated fcm token
  static Future<void> setFcmToken(String token) =>
      _sharedPreferences.setString(_fcmTokenKey, token);

  /// get generated fcm token
  static String? getFcmToken() =>
      _sharedPreferences.getString(_fcmTokenKey);

}