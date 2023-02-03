import 'package:get/get.dart';

class NotificationsController extends GetxController{
  var isDeleted = false.obs;
  void deleteNotification(){
    isDeleted.value=true;
    update();
    isDeleted.value=false;
    update();
  }
}