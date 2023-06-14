import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/shared/constatns/locale_strings.dart';
import 'package:graduation_project/shared/route_helper/route_helper.dart';

import '../../controllers/auth_controller.dart';
import '../../models/parent_model.dart';
import '../../shared/constatns/app_strings.dart';
import '../../shared/widgets/custom_snackbar.dart';

class SignUpPage extends StatelessWidget {

    final TextEditingController nameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),

        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: Image.asset(
                  'assets/images/register.png',
                  width: sizer?Get.width:Get.width/6,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 20.h,
                width: 20.w,
              ),
              Text(
                appCreateAccountAr.tr,
                style: TextStyle(
                  color: const Color(0xff090A4A),
                  fontSize: sizer?15.sp:8.sp,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Times New Roman',
                  fontWeight: FontWeight.bold,
                ),
              ),
             GetBuilder<AuthController>(builder: (_controller) =>  Padding(
               padding: EdgeInsets.symmetric(
                 vertical: 6.h,
                 horizontal: 32.w,
               ),
               child: Column(
                 children: [
                   SizedBox(
                     width:sizer
                         ? Get.width
                         : Get.width / 1.8,
                     child: TextFormField(
                       validator: (value) {
                         if (value!.length <= 2 ||
                             !RegExp(validationName).hasMatch(value)) {
                           return nameInValid;
                         } else {
                           return null;
                         }
                       },
                       decoration: const InputDecoration(
                         icon: Icon(Icons.person),
                         hintText: appFullNameAr,
                         labelText: appFullNameAr,
                       ),
                     ),
                   ),
                   SizedBox(
                     height: 10.h,
                     width: 10.w,
                   ),
                   SizedBox(
                     width:sizer
                         ? Get.width
                         : Get.width / 1.8,
                     child: TextFormField(
                       validator: (value) {
                         if (!RegExp(validationEmail).hasMatch(value!)) {
                           return emailInValid;
                         } else {
                           return null;
                         }
                       },
                       decoration: const InputDecoration(
                         icon: Icon(Icons.email),
                         hintText: appHaveUserNameOrEmailAr,
                         labelText: appHaveUserNameOrEmailAr,
                       ),
                     ),
                   ),
                   SizedBox(
                     height: 10.h,
                     width: 10.w,
                   ),
                   SizedBox(
                     width:sizer
                         ? Get.width
                         : Get.width / 1.8,
                     child: TextFormField(
                       validator: (value) {
                         if(value!.length<6){
                           return passInValid;
                         }else {
                           return null;
                         }
                       },
                       obscureText: true,
                       decoration: const InputDecoration(
                         icon: Icon(Icons.lock),
                         hintText: appPasswordAr,
                         labelText: appPasswordAr,
                       ),
                     ),
                   ),
                   SizedBox(
                     height: 10.h,
                     width: 10.w,
                   ),
                   Padding(
                     padding: EdgeInsets.only(top: 15.h),
                     child: TextButton.icon(
                       onPressed: (() {
                         if(_formKey.currentState!.validate()) {
                           _register(_controller);
                         }
                       }),
                       icon: Container(),
                       style: TextButton.styleFrom(
                           padding: EdgeInsets.symmetric(
                               horizontal: 20.w, vertical: 12.h),
                           elevation: 0,
                           shape: const StadiumBorder(),
                           backgroundColor: const Color(0xff090A4A)),
                       label: const Text(
                         appSignupAr,
                         style: TextStyle(
                           // fontSize: 18.sp,
                           color: Colors.white,
                         ),
                       ),
                     ),
                   ),
                   Row(
                     children: [
                       const Text(appAlreadyHaveAnAccountAr),
                       TextButton(
                         onPressed: (() {
                           Get.toNamed(RouteHelper.getSignInPage());
                         }),
                         child: const Text(
                           appSignInAr,
                           style: TextStyle(
                             // fontSize: 15.sp,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                       ),
                     ],
                     mainAxisAlignment: MainAxisAlignment.center,
                   ),
                   const Text(
                     appSignUpFooterAr,
                     textAlign: TextAlign.center,
                     style:
                     TextStyle( fontWeight: FontWeight.bold),
                   ),
                 ],
               ),
             ),),
            ],
          ),
        ),
      ),
    );
  }
  _register(AuthController authController){
    String name = nameController.text.trim();
    String password = passwordController.text.trim();
    String email = emailController.text.trim();
    ParentModel parentModel = ParentModel(
        name: name,
        password: password,
        email: email);
    authController.registration(parentModel).then((value) {
      if(value.isSuccess){
        showCustomSnackBar('Success Registration', title: 'Perfect',isError: false);
        Get.toNamed(RouteHelper.getSignInPage());
      }else{
        showCustomSnackBar(value.message);
      }
    });
  }
}
bool get sizer{
  return Get.width<992;
}
