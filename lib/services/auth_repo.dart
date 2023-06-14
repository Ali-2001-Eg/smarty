import 'package:get/get.dart';
import 'package:graduation_project/shared/constatns/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/parent_model.dart';
import 'api_client.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> registration(ParentModel parentModel) async {
    //to post to the server our auth data in json format
    return await apiClient.postData(
        registerPath, parentModel.toJson());
  }

  Future<Response> login( String password, String email) async {
    //to post to the server our auth data in json format
    return await apiClient.postData(loginPath,
        {'password': password, 'email': email});
  }

  //user will get a token in registration and will be saved in local storage
  //to ensure authentication method and when logging in server will use that token
  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(token, token);
  }

  Future<void> saveUserEmailAndPassword(String email, String password) async {
    try {
      await sharedPreferences.setString('password', password);
      await sharedPreferences.setString('email', email);
    } catch (e) {
      throw e;
    }
  }

  String getUserToken() {
    return sharedPreferences.getString(token) ?? 'none';
  }

  bool userLoggedIn() {
    return sharedPreferences.containsKey(token);
  }

  bool removeSharedData(){
    sharedPreferences.remove(token);
    sharedPreferences.remove('password');
    apiClient.token='';
    apiClient.updateHeader('');
    return true;
  }
}
