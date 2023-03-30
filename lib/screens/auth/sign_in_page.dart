import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controllers/language_controller.dart';
import 'package:graduation_project/shared/constatns/locale_strings.dart';
import 'package:graduation_project/shared/route_helper/route_helper.dart';
import 'package:otp_text_field/otp_text_field.dart';
import '../../controllers/auth_controller.dart';
import '../../shared/cache_helper/cache_helper.dart';
import '../../shared/constatns/app_strings.dart';

class SignInPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final OtpFieldController otpController = OtpFieldController();
    print('build');
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            GetBuilder<AuthController>(builder: (_) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/login.png',
                      height: 300.h,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(appWelcomeEn.tr,
                                textStyle: TextStyle(
                                  color: Colors.red,
                                  fontSize: 30.sp,
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
                          isRepeatingAnimation: false,
                          totalRepeatCount: 0,

                        ),
                        SizedBox(
                          width: 30.w,
                        ),
                        GetBuilder<LanguageController>(
                          builder: (langController) {
                            return Container(
                              width: 160.w,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6.h, vertical: 2.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: const Color(0xffFEA633), width: 2),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  onChanged: (value) {
                                    langController.changeLanguage(value!);
                                    Get.updateLocale(Locale(value));
                                  },
                                  value: langController.locale,
                                  iconSize: 25.h,
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.grey,
                                  ),
                                  items: [
                                    DropdownMenuItem(
                                      value: eng,
                                      child: Text(
                                        englishEn.tr,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.sp,
                                            color: Colors.grey),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: arb,
                                      child: Text(
                                        arabicEn.tr,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.sp,
                                            color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    (Get.find<AuthController>().isStudent)
                        ? Padding(
                            padding: EdgeInsets.only(top: 25.h),
                            child: AnimatedTextKit(
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  appEnterYourClassCodeEn.tr,
                                  textStyle: TextStyle(
                                    color: Colors.red,
                                    fontSize: 30.sp,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'Times New Roman',
                                    fontWeight: FontWeight.w500,
                                  ),
                                  speed: const Duration(
                                    milliseconds: 450,
                                  ),
                                ),
                              ],
                              onTap: () {
                                debugPrint("Welcome back!");
                              },
                              isRepeatingAnimation: true,
                              totalRepeatCount: 2,
                            ),
                          )
                        : Container(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 25.h,
                        horizontal: 32.w,
                      ),
                      child: !(Get.find<AuthController>().isStudent)
                          ? Column(
                              children: [
                                TextFormField(
                                  decoration:  InputDecoration(
                                    icon: const Icon(Icons.email),
                                    hintText: appEmailOrUserNameEn.tr,
                                    labelText: appEmailOrUserNameEn.tr,
                                    border: const OutlineInputBorder(),
                                  ),
                                  onChanged: (value) {},
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                TextFormField(
                                  obscureText: true,
                                  decoration:  InputDecoration(
                                    icon: const Icon(Icons.lock),
                                    hintText: appPasswordEn.tr,
                                    labelText:  appPasswordEn.tr,
                                    border: const OutlineInputBorder(),
                                  ),
                                  onChanged: (value) {},
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.toNamed(
                                        RouteHelper.getForgottenPassword());
                                  },
                                  child:  Text(
                                    appForgotPasswordEn.tr,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                TextButton.icon(
                                  onPressed: (() {
                                    CacheHelper.saveData(
                                            key: 'token', value: true)
                                        .then((value) => Get.offAllNamed(
                                            RouteHelper.getInitialPage()));
                                    // print(CacheHelper.sharedPreferences
                                    //     .get('token'));
                                  }),
                                  icon: Container(),
                                  label: Container(
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
                                      borderRadius: BorderRadius.circular(25.r),
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
                          : Column(
                              children: [
                                SizedBox(
                                  height: 50.h,
                                ),
                                Container(
                                  padding: EdgeInsets.only(bottom: 15.h),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xffFEA633),
                                          width: 2),
                                      borderRadius:
                                          BorderRadius.circular(15.r)),
                                  child: OTPTextField(
                                    keyboardType: TextInputType.phone,
                                    controller: otpController,
                                    length: 5,
                                    width: double.maxFinite,
                                    textFieldAlignment:
                                        MainAxisAlignment.spaceAround,
                                    outlineBorderRadius: 15.r,
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold),
                                    onCompleted: (value) {
                                      print(value);
                                      Get.offNamed(
                                          RouteHelper.getInitialPage());
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 50.h,
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
              );
            }),
            //roles
            GetBuilder<AuthController>(
              builder: (_) {
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
                                      .headline3
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
                                        _.showStudentLoginWidget();
                                        print(Get.find<AuthController>()
                                            .isStudent);
                                        // print(Get.find<AuthController>().isClicked);
                                      },
                                      //student
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20.r),
                                                border: Border.all(
                                                    color: Colors.blue),
                                                color: Colors.white70,
                                                image: const DecorationImage(
                                                    image: AssetImage(
                                                      'assets/images/student_icon.png',
                                                    ),
                                                    fit: BoxFit.cover)),
                                            width: 150.w,
                                            height: 200.h,
                                          ),
                                          Text(
                                            appStudentEn.tr,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3
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
                                        _.showParentLoginWidget();
                                        // print(Get.find<AuthController>().isStudent);
                                        // print(Get.find<AuthController>().isClicked);
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20.r),
                                                border: Border.all(
                                                    color: Colors.blue),
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
                                                .headline3
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
