import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

//putting the key of mode status in the cash memory
  static Future<bool> putBoolean(
      {required String key, required dynamic value}) async {
    WidgetsFlutterBinding.ensureInitialized();
    return await sharedPreferences.setBool(key, value);
  }

//get the key of mode status on the main method
  static  getData({required String key}) {
    //dynamic because we don't know the type returned
    return sharedPreferences.get(key);
  }

  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);
    return await sharedPreferences.setDouble(key, value);
  }

  static Future<bool> remove({
    required String key,
  }) async {
    return await sharedPreferences.remove(key);
  }
  static Future<bool> clear() async {
    return await sharedPreferences.clear();
  }
}