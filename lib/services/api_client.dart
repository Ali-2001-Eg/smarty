import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient extends GetConnect implements GetxService{
   String token = '';
  final String appBaseUrl;
  final SharedPreferences sharedPreferences;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl,required this.sharedPreferences}){
  token =sharedPreferences.getString(token)??"";
  timeout =const Duration(
    seconds: 30,
  );
  baseUrl = appBaseUrl;
  _mainHeaders = {
    'Content-type': 'application/json; charset=utf-8',
    'Authorization': 'Bearer $token',
  };
  }

  //get method
  Future<Response> getData(String url, {Map<String, String>? headers}) async {
    try {
      //to save the data in a response type to be called
      //headers might be null
      //headers will be used in retrieving user info
      Response response = await get(
        url,
        headers: headers ?? _mainHeaders,
      );
      return response;
    } catch (e) {
      return Response(statusText: e.toString(), statusCode: 1);
    }
  }


  //post method
  Future<Response> postData(String uri, dynamic body) async {
    // print(body.toString());
    try {
      Response response = await post(uri, body, headers: _mainHeaders);
      // print(response.body.toString());
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  //to update null token to real token
  void updateHeader(String token) {
    _mainHeaders = {
      'Content-type': 'application/json; charset=utf-8',
      'Authorization': 'Bearer $token',
    };
  }

}