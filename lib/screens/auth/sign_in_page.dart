import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/screens/auth/sign_up_page.dart';
import 'package:graduation_project/screens/home/home_page.dart';
import 'package:graduation_project/shared/constatns/locale_strings.dart';
import 'package:graduation_project/shared/route_helper/route_helper.dart';
import '../../controllers/auth_controller.dart';
import '../../shared/cache_helper/cache_helper.dart';
import '../../shared/constatns/app_strings.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../shared/widgets/custom_snackbar.dart';

class SignInPage extends StatelessWidget {

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade50,
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            GetBuilder<AuthController>(builder: (_controller) {
              print(_controller.isStudent);
              return Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 15.h),
                          child: Image.asset(
                            'assets/images/login.png',
                            width: sizer ? Get.width : Get.width / 6,
                            fit: BoxFit.cover,
                          ),
                        ),
                        (!Get.find<AuthController>().isStudent)
                            ? Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.w, vertical: 10.h),
                                child: Text(
                                  appWelcomeAr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: const Color(0xff090A4A),
                                    fontSize: Get.width < 992 ? 15.sp : 8.sp,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'Times New Roman',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            : Container(),
                        (Get.find<AuthController>().isStudent)
                            ? Padding(
                                padding: EdgeInsets.only(top: 25.h),
                                child: Text(
                                  'أدخل رقم الفصل',
                                  style: TextStyle(
                                    color: const Color(0xff090A4A),
                                    fontSize: Get.width < 800 ? 15.sp : 8.sp,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'Times New Roman',
                                    fontWeight: FontWeight.bold,
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
                                    SizedBox(
                                      width:
                                          sizer ? Get.width : Get.width / 1.5,
                                      child: TextFormField(
                                        controller: emailController,
                                        validator: (value) {
                                          if (!RegExp(validationEmail)
                                              .hasMatch(value!)) {
                                            return emailInValid;
                                          } else {
                                            return null;
                                          }
                                        },
                                        decoration: const InputDecoration(
                                          icon: Icon(Icons.email),
                                          hintText: appEmailOrUserNameAr,
                                          labelText: appEmailOrUserNameAr,
                                          border: OutlineInputBorder(),
                                        ),
                                        onChanged: (value) {},
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    SizedBox(
                                      width:
                                          sizer ? Get.width : Get.width / 1.5,
                                      child: TextFormField(
                                        controller: passwordController,
                                        obscureText: true,
                                        validator: (value) {
                                          if (value!.length < 6) {
                                            return passInValid;
                                          } else {
                                            return null;
                                          }
                                        },
                                        decoration: const InputDecoration(
                                          icon: Icon(Icons.lock),
                                          hintText: appPasswordAr,
                                          labelText: appPasswordAr,
                                          border: OutlineInputBorder(),
                                        ),
                                        onChanged: (value) {
                                          // print(value);
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Get.toNamed(
                                            RouteHelper.getForgottenPassword());
                                      },
                                      child: const Text(
                                        appForgotPasswordAr,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    TextButton(
                                      onPressed: (() {
                                        if (_formKey.currentState!.validate()) {
                                       _signIn(_controller,_controller.isStudent);
                                       //  Get.offAll(()=>HomeLayoutPage(isStudent: false))?.then((value) => CacheHelper.setBool('student', false));
                                        }
                                      }),
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w, vertical: 12.h),
                                          elevation: 0,
                                          shape: const StadiumBorder(),
                                          backgroundColor:
                                              const Color(0xff090A4A)),
                                      child: const Text(
                                        appSignInAr,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Row(
                                      children: [
                                        const Text(appNoAccountAr),
                                        TextButton(
                                          onPressed: (() {
                                            Get.toNamed(
                                                RouteHelper.getSignUpPage());
                                          }),
                                          child: const Text(
                                            appSignupAr,
                                            style: TextStyle(
                                              // fontSize: Get.width < 800
                                              //     ? 15.sp
                                              //     : 8.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Get.find<AuthController>()
                                            .changeLoginRoles();
                                      },
                                      child: const Text(
                                        appEnterYourClassCodeAr,
                                        style: TextStyle(
                                            ),
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

                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: PinCodeTextField(
                                        length: 5,
                                        obscureText: false,
                                        animationType: AnimationType.scale,
                                        pinTheme: PinTheme(
                                          shape: PinCodeFieldShape.box,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          fieldHeight: 50,
                                          fieldWidth: 40,
                                          activeFillColor: Colors.white,
                                          inactiveFillColor: Colors.white,
                                          borderWidth: 1,
                                          activeColor: Colors.black,
                                          inactiveColor: const Color(0xff090A4A),
                                          selectedColor: const Color(0xff090A4A),
                                          selectedFillColor: Colors.white,
                                        ),
                                        animationDuration:
                                            const Duration(milliseconds: 300),
                                        backgroundColor: Colors.white,
                                        onCompleted: (submittedcode) {
                                          CacheHelper.setBool('student', false)
                                              .then((value) => Get.offAll(
                                                  HomeLayoutPage(
                                                      isStudent: _controller.isStudent)));
                                        },
                                        onChanged: (value) {
                                          print(value);
                                        },
                                        enablePinAutofill: false,
                                        enableActiveFill: true,
                                        appContext: context,
                                        autoFocus: true,
                                        cursorColor: Colors.blue,
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    TextButton(
                                        onPressed: () =>
                                            Get.find<AuthController>()
                                                .changeLoginRoles(),
                                        child: Center(
                                          child: Text(
                                            appHaveUserNameOrEmailAr,
                                            style: TextStyle(
                                                fontSize: Get.width < 800
                                                    ? 15.sp
                                                    : 8.sp),
                                          ),
                                        ))
                                  ],
                                ),
                        ),
                      ],
                    ),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 50.h,
                              ),
                              Text(
                                appLoginAsAr,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(color: const Color(0xffFEA633)),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  //student

                                  InkWell(
                                    onTap: () {
                                      controller.showStudentLoginWidget();
                                    },
                                    //student
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: const Color(0xffFEA633)
                                                      .withOpacity(0.5)),
                                              color: Colors.white70,
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                    'assets/images/student_icon.png',
                                                  ),
                                                  fit: BoxFit.contain)),
                                          width: 150.w,
                                          height: 150.h,
                                        ),
                                        Text(
                                          appStudentAr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall
                                              ?.copyWith(
                                                  color:
                                                      const Color(0xffFEA633)),
                                        ),
                                      ],
                                    ),
                                  ),

                                  //parent

                                  InkWell(
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
                                                  color: const Color(0xffFEA633)
                                                      .withOpacity(0.5)),
                                              color: Colors.white70,
                                              image: const DecorationImage(
                                                image: AssetImage(
                                                  'assets/images/parent_icon.png',
                                                ),
                                              )),
                                          width: 150.w,
                                          height: 150.h,
                                        ),
                                        Text(
                                          appParentAr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall
                                              ?.copyWith(
                                                  color:
                                                      const Color(0xffFEA633)),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container();
              },
            )
          ],
        ));
  }
  void _signIn(AuthController authController,bool role) {
    String password = passwordController.text.trim();
    String email = emailController.text.trim();
    // String name = nameController.text.trim();
    authController.login(email,  password).then((status) {
      if (status.isSuccess) {
        showCustomSnackBar('Success Login',
            title: 'Perfect', isError: false);
        print('success registration');
        CacheHelper.setBool('student', false)
            .then((value) => Get.offAll(
            HomeLayoutPage(
                isStudent: role)));
      } else {
        showCustomSnackBar(status.message);
      }
    });

  }
}
