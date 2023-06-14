import 'package:get/get.dart';
import 'package:graduation_project/controllers/auth_controller.dart';
import 'package:graduation_project/services/api_client.dart';
import 'package:graduation_project/services/auth_repo.dart';
import 'package:graduation_project/shared/constatns/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBinding extends Bindings{


  @override
  Future<void> dependencies() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    Get.lazyPut(() => sharedPreferences);
    Get.lazyPut(() => AuthController(authRepo: Get.find()));
    Get.lazyPut(() => ApiClient(appBaseUrl: appBaseUrl,sharedPreferences: Get.find()));
    Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: sharedPreferences));
  }
}