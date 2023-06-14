import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/screens/auth/sign_up_page.dart';
import 'package:graduation_project/shared/constatns/locale_strings.dart';
import 'package:graduation_project/shared/route_helper/route_helper.dart';

import '../../shared/constatns/app_strings.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey.shade50,
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15.h),
                  child: Image.asset(
                    'assets/images/Forgot_password.png',
                    width: sizer ? Get.width : Get.width / 6,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 35.h,
                  width: 30.w,
                ),
                Center(
                  child: Text(
                    appSendResetLinkAr,
                    style: TextStyle(
                      color: const Color(0xff090A4A),
                      fontSize: sizer ? 15.sp : 8.sp,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 50.h,
                    horizontal: 25.w,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: sizer ? Get.width : Get.width / 1.5,
                        child: TextFormField(
                          validator: (value) {
                            if (!RegExp(validationEmail).hasMatch(value!)) {
                              return emailInValid;
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: appEmailOrUserNameAr,
                            labelText: appEmailOrUserNameAr,
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                        width: 10.w,
                      ),
                      TextButton.icon(
                        onPressed: (() {
                          if (_formKey.currentState!.validate()) {
                            // Get.toNamed(RouteHelper.getSignInPage());
                          }
                        }),
                        icon: Container(),
                        label: Container(
                          alignment: Alignment.center,
                          width: sizer ? Get.width / 2 : Get.width / 5,
                          height: 35.h,
                          child: const Text(
                            appSendResetLinkToEmailAr,
                            style: TextStyle(
                              // fontSize: 12.sp,
                              color: Colors.white,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xff090A4A),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                        width: 10.w,
                      ),
                      TextButton.icon(
                        onPressed: (() {
                          Get.toNamed(RouteHelper.getSignInPage());
                        }),
                        icon: Container(),
                        label: Container(
                          alignment: Alignment.center,
                          width: sizer ? Get.width / 2 : Get.width / 6,
                          height: 35.h,
                          child: const Text(
                            appReturnHomeAr,
                            style: TextStyle(
                              // fontSize: 12.sp,
                              color: Colors.white,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xff090A4A),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
