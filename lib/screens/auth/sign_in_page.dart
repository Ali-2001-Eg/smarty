import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/screens/home/home_page.dart';
import 'package:graduation_project/shared/constatns/locale_strings.dart';
import 'package:graduation_project/shared/route_helper/route_helper.dart';
import 'package:otp_text_field/otp_text_field.dart';
import '../../controllers/auth_controller.dart';
import '../../shared/cache_helper/cache_helper.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OtpFieldController otpController = OtpFieldController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
        backgroundColor: Colors.grey.shade50,
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            GetBuilder<AuthController>(builder: (_) {
              return Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 30.h),
                        child: Text(
                          appWelcomeEn.tr,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20.sp,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Times New Roman',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      (Get.find<AuthController>().isStudent)
                          ? Padding(
                              padding: EdgeInsets.only(top: 25.h),
                              child: Text(
                                appEnterYourClassCodeEn
                                    .substring(
                                        0, appEnterYourClassCodeEn.indexOf('?'))
                                    .tr,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 30.sp,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'Times New Roman',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          : Container(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 28.h,
                          horizontal: 20.w,
                        ),
                        child: !(Get.find<AuthController>().isStudent)
                            ? Column(
                                children: [
                                  TextFormField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      icon: const Icon(Icons.email),
                                      hintText: appEmailOrUserNameEn.tr,
                                      labelText: appEmailOrUserNameEn.tr,
                                      border: const OutlineInputBorder(),
                                    ),
                                    onChanged: (value) {},
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  TextFormField(
                                    controller: passwordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      icon: const Icon(Icons.lock),
                                      hintText: appPasswordEn.tr,
                                      labelText: appPasswordEn.tr,
                                      border: const OutlineInputBorder(),
                                    ),
                                    onChanged: (value) {
                                      // print(value);
                                    },
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.toNamed(
                                          RouteHelper.getForgottenPassword());
                                    },
                                    child: Text(
                                      appForgotPasswordEn.tr,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  TextButton(
                                    onPressed: (() {
                                      CacheHelper.saveData(
                                              key: 'token', value: true)
                                          .then((value) => Get.off(() =>
                                              const HomeLayoutPage(
                                                  isStudent: false)));
                                    }),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 150.w,
                                      height: 35.h,
                                      child: Text(
                                        appSignInEn.tr,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    children: [
                                      Text(appNoAccountEn.tr),
                                      TextButton(
                                        onPressed: (() {
                                          Get.toNamed(
                                              RouteHelper.getSignUpPage());
                                        }),
                                        child: Text(
                                          appSignupEn.tr,
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.center,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.find<AuthController>()
                                          .changeLoginRoles();
                                    },
                                    child: Text(
                                      appEnterYourClassCodeEn.tr,
                                      style: TextStyle(fontSize: 15.sp),
                                    ),
                                  )
                                ],
                              )
                            //student enter class code
                            : Column(
                                children: [
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 15.h),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xffFEA633),
                                            width: 2),
                                        borderRadius: BorderRadius.circular(15)),
                                    child: OTPTextField(
                                      keyboardType: TextInputType.phone,
                                      controller: otpController,
                                      length: 5,
                                      width: double.maxFinite,
                                      textFieldAlignment:
                                          MainAxisAlignment.spaceAround,
                                      outlineBorderRadius: 15,
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold),
                                      onCompleted: (value) {
                                        Get.off(() => const HomeLayoutPage(
                                            isStudent: true));
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  TextButton(
                                      onPressed: () => Get.find<AuthController>()
                                          .changeLoginRoles(),
                                      child: Text(
                                        appHaveUserNameOrEmailEn.tr,
                                        style: TextStyle(fontSize: 15.sp),
                                      ))
                                ],
                              ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            //roles
            GetBuilder<AuthController>(
              builder: (controller) {
                return !(Get.find<AuthController>().isClicked)
                    ? Positioned.fill(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 50.h,
                                ),
                                Text(
                                  appLoginAsEn.tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                          color: const Color(0xffFEA633)),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    //student

                                    GestureDetector(
                                      onTap: () {
                                        controller.showStudentLoginWidget();
                                        // print(Get.find<AuthController>()
                                        //     .isStudent);
                                        // print(Get.find<AuthController>().isClicked);
                                      },
                                      //student
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                    color:
                                                        const Color(0xffFEA633)
                                                            .withOpacity(0.5)),
                                                color: Colors.white70,
                                                image: const DecorationImage(
                                                    image: AssetImage(
                                                      'assets/images/student_icon.png',
                                                    ),
                                                    fit: BoxFit.contain)),
                                            width: 150.w,
                                            height: 200.h,
                                          ),
                                          Text(
                                            appStudentEn.tr,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall
                                                ?.copyWith(
                                                    color: const Color(
                                                        0xffFEA633)),
                                          ),
                                        ],
                                      ),
                                    ),

                                    //parent

                                    GestureDetector(
                                      onTap: () {
                                        controller.showParentLoginWidget();
                                        // print(Get.find<AuthController>().isStudent);
                                        // print(Get.find<AuthController>().isClicked);
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                    color:
                                                        const Color(0xffFEA633)
                                                            .withOpacity(0.5)),
                                                color: Colors.white70,
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                    'assets/images/parent_icon.png',
                                                  ),
                                                )),
                                            width: 150.w,
                                            height: 200.h,
                                          ),
                                          Text(
                                            appParentEn.tr,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall
                                                ?.copyWith(
                                                    color: const Color(
                                                        0xffFEA633)),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Container();
              },
            )
          ],
        ));
  }
}
