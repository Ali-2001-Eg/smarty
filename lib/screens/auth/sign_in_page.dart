import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/screens/auth/sign_up_page.dart';
import 'package:graduation_project/shared/route_helper/route_helper.dart';
import 'package:otp_text_field/otp_text_field.dart';

import '../../shared/cache_helper/cache_helper.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late bool isStudent;
  late bool isClicked;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isStudent = false;
    isClicked = false;
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    final OtpFieldController controller = OtpFieldController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          SingleChildScrollView(
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
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Welcome!',
                        textStyle:  TextStyle(
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
                  isRepeatingAnimation: true,
                  totalRepeatCount: 2,
                ),
                (isStudent)
                    ? AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText('Enter Your Class Code !',
                              textStyle:  TextStyle(
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
                        isRepeatingAnimation: true,
                        totalRepeatCount: 2,
                      )
                    : Container(),
                Padding(
                  padding:  EdgeInsets.symmetric(
                    vertical: 6.h,
                    horizontal: 32.w,
                  ),
                  child: (!isStudent)
                      ? Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                icon: Icon(Icons.email),
                                hintText: 'Enter Your Username/Email',
                                labelText: 'Email or Username',
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) {
                                setState(() {});
                              },
                            ),
                             SizedBox(
                              height: 10.h,
                            ),
                            TextFormField(
                              obscureText: true,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.lock),
                                hintText: 'Enter Your Password',
                                labelText: 'Password',
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) {
                                setState(() {});
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
                              child: const Text(
                                'Forgot Password?',
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
                                print(CacheHelper.sharedPreferences
                                    .get('token'));
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(),));
                              }),
                              icon: Container(),
                              label: Container(
                                alignment: Alignment.center,
                                width: 150.w,
                                height: 35.h,
                                child:  Text(
                                  'Sign In',
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
                                const Text('Don\'t have an account?'),
                                TextButton(
                                  onPressed: (() {
                                    Get.toNamed(
                                        RouteHelper.getSignUpPage());
                                  }),
                                  child:  Text(
                                    'Sign Up',
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
                              onPressed: () => setState(() {
                                isStudent = true;
                              }),
                              child:  Text('Have Class Code ?',style: TextStyle(
                                fontSize: 15.sp
                              ),),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            OTPTextField(
                              keyboardType: TextInputType.phone,
                              controller: controller,
                              length: 5,
                              width: double.maxFinite,
                              textFieldAlignment:
                                  MainAxisAlignment.spaceAround,
                              outlineBorderRadius: 15.r,
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              onCompleted: (value) {
                                print(value);
                                Get.offNamed(RouteHelper.getInitialPage());
                              },
                            ),
                             SizedBox(
                              height: 20.h,
                            ),
                            TextButton(
                                onPressed: () => setState(() {
                                      isStudent = false;
                                    }),
                                child:
                                     Text('Have username or Email ?',style: TextStyle(fontSize: 15.sp),))
                          ],
                        ),
                ),
              ],
            ),
          ),
          //roles
          (!isClicked)
              ? Positioned.fill(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             SizedBox(height: 50.h,),
                            Text(
                              'Login as',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  ?.copyWith(color: const Color(0xffFEA633)),
                            ),
                            SizedBox(height: 30.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //student
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isClicked = true;
                                      isStudent = true;
                                    });
                                  },
                                  //student
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                            border:
                                                Border.all(color: Colors.blue),
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
                                        'Student',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3
                                            ?.copyWith(color: const Color(0xffFEA633)),
                                      ),
                                    ],
                                  ),
                                ),
                                //parent
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isClicked = true;
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                            border:
                                                Border.all(color: Colors.blue),
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
                                        'Parent',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3
                                            ?.copyWith(color: const Color(0xffFEA633)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )))
              : Container(),
        ],
      ),
    );
  }
}
