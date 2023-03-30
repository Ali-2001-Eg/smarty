
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/shared/constatns/locale_strings.dart';
import 'package:graduation_project/shared/route_helper/route_helper.dart';

class ForgotPassword extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/images/forgot.png',
              fit: BoxFit.cover,
            ),
             SizedBox(
              height: 35.h,
              width: 30.w,
            ),
            Center(
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(appSendResetLinkToEmailEn.tr,
                      textStyle:  TextStyle(
                        color: Colors.red,
                        fontSize: 20.sp,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Times New Roman',
                        fontWeight: FontWeight.w500,
                      ),
                      speed: const Duration(
                        milliseconds: 450,
                      )),
                ],
                onTap: () {
                  debugPrint("Welcome back!");
                },
                isRepeatingAnimation: true,
                totalRepeatCount: 2,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 50.h,
                horizontal: 25.w,
              ),
              child: Column(
                children: [
                  TextFormField(
                    decoration:  InputDecoration(
                      hintText: appEmailOrUserNameEn.tr,
                      labelText: appEmailOrUserNameEn.tr,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                   SizedBox(
                    height: 40.h,
                    width: 10.w,
                  ),
                  TextButton.icon(
                    onPressed: (() {}),
                    icon: Container(),
                    label: Container(
                      alignment: Alignment.center,
                      width: 150.w,
                      height: 35.h,
                      child:  Text(
                        appSendResetLinkEn.tr,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.white,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(25.r),
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
                    icon:Container(),
                    label: Container(
                      alignment: Alignment.center,
                      width: 150.w,
                      height: 35.h,
                      child:  Text(
                        appReturnHomeEn.tr,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.white,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
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
    );
  }
}
