import 'package:get/get.dart';

class AuthController extends GetxController{
  var isStudent = false;
  var isClicked = false;



   void changeLoginRoles() {
     isStudent=!isStudent;
     update();
  }
   void showStudentLoginWidget() {
     isStudent = true;
     isClicked= true ;
     update();
  }
  void showParentLoginWidget(){
     isClicked = true;
     isStudent = false;
     update();
  }
}