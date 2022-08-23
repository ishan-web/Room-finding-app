import 'package:shared_preferences/shared_preferences.dart';

class SharedServices {
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("login") != null ? true : false;
  }

  static Future<String?> loginDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("login");
  }

  static Future<bool> setLoginDetails(
    String loginResponse,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("login", loginResponse);
  }

  static Future<dynamic> setHomePageData(
    dynamic valueData,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("value", valueData);
  }

  static Future<String?> getHomePageData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("value");
  }

  static Future<bool> setTokenDetails(String tokenResponse) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("gettoken", tokenResponse);
  }

  static Future<String?> getTokenDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("gettoken");
  }

  static Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
