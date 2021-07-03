import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions{
  static String sharedPreferenceUserLoggedInKey="ISLOGGEDIN";
  static String sharedPreferenceUserNameKey="USERNAMEKEY";
  static String sharedPreferenceUserEmailKey="USEREMAILKEY";

  static Future<bool> saveUserLoggedInSharedPreferene(bool isUserLoggedIn)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(sharedPreferenceUserLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserNameSharedPreferene(String userName)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPreferenceUserNameKey, userName);
  }

  static Future<bool> saveUserEmailSharedPreferene(String userEmail)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPreferenceUserEmailKey, userEmail);
  }


  //getting data from shared preference

  static Future<bool> getUserLoggedInSharedPreferene()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool(sharedPreferenceUserLoggedInKey);
  }

  static Future<bool> getUserNameSharedPreferene()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool(sharedPreferenceUserNameKey);
  }

  static Future<bool> getUserEmailSharedPreferene()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool(sharedPreferenceUserEmailKey);
  }

}