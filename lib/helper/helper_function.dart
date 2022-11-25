import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  static String sharedPreferencesUserLoggedKey = "ISLOGGEDIN";
  static String sharedPreferencesUserNameKey = 'USERNAMEKEY';
  static String sharedPreferencesUserEmailKey = 'USEREMAILKEY';

  static Future<bool> saveUserLoggedInSharedPreferences(
      bool isUserLoggredIn) async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    return await spref.setBool(sharedPreferencesUserLoggedKey, isUserLoggredIn);
  }

  static Future<bool> saveUserNameSharedPreferences(String userName) async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    return await spref.setString(sharedPreferencesUserNameKey, userName);
  }

  static Future<bool> saveUserEmailSharedPreferences(String email) async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    return await spref.setString(sharedPreferencesUserEmailKey, email);
  }

  static Future<bool?> getUserLoggedInSharedPreferences() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    return await spref.getBool(sharedPreferencesUserLoggedKey);
  }

  static Future<String?> getUserNameSharedPreferences() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    return await spref.getString(sharedPreferencesUserNameKey);
  }

  static Future<String?> getUserEmailSharedPreferences() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    return await spref.getString(sharedPreferencesUserEmailKey);
  }
}
