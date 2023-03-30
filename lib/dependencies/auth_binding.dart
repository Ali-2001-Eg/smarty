import 'package:get/get.dart';
import 'package:graduation_project/controllers/auth_controller.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}