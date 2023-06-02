import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/screens/auth/sign_in_page.dart';
import 'package:graduation_project/shared/constatns/locale_strings.dart';
import 'package:graduation_project/shared/route_helper/route_helper.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.w),
              child: Padding(
                padding: EdgeInsets.all(25.0.w),
                child: Image.asset(
                  'assets/images/register.png',
                  fit: BoxFit.cover,
                ),
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
                fontSize: 30.sp,
                fontStyle: FontStyle.italic,
                fontFamily: 'Times New Roman',
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.h,
                horizontal: 32.w,
              ),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: appFullNameEn.tr,
                      labelText: appFullNameEn.tr,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                    width: 10.w,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: const Icon(Icons.email),
                      hintText: appHaveUserNameOrEmailEn.tr,
                      labelText: appHaveUserNameOrEmailEn.tr,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                    width: 10.w,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.lock),
                      hintText: appPasswordEn.tr,
                      labelText: appPasswordEn.tr,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                    width: 10.w,
                  ),
                  TextButton.icon(
                    onPressed: (() {
                      //sign up
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInPage(),));
                      Get.toNamed(RouteHelper.getSignInPage());
                    }),
                    icon: Container(),
                    label: Container(
                      alignment: Alignment.center,
                      width: 150.w,
                      height: 35.h,
                      child: Text(
                        appSignupEn.tr,
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xff090A4A),
                        borderRadius: BorderRadius.circular(25.w),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(appAlreadyHaveAnAccountEn.tr),
                      TextButton(
                        onPressed: (() {
                          Get.toNamed(RouteHelper.getSignInPage());
                        }),
                        child: Text(
                          appSignInEn.tr,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  Text(
                    appSignUpFooterEn.tr,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
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
