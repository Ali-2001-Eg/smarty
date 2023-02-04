import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController{

  //to change obscure and suffix state
  var isPasswordShown = true.obs;
  IconData suffix = Icons.remove_red_eye_outlined;
  void changeSuffixIcon(){
    isPasswordShown.value=(!isPasswordShown.value);
    update();
    suffix= (isPasswordShown.value)
        ? Icons.remove_red_eye_outlined
        : Icons.visibility_off_rounded;
    update();
  }
  //to verify current password
  var isVerified=false.obs;
  void verifyCurrentPassword(){
    isVerified.value=true;
    update();
  }
  //after confirming current => disable this text field
  var isDisabled=false.obs;
  void disableTextField(){
    isDisabled.value=true;
    update();
  }

}