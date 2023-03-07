import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          Material(
            color: Colors.white,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/login.png',
                      fit: BoxFit.cover,
                    ),
                    AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText('Welcome!',
                            textStyle: const TextStyle(
                              color: Colors.red,
                              fontSize: 30,
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
                                  textStyle: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 30,
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
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 32,
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
                                const SizedBox(
                                  height: 20,
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
                                  height: 20,
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
                                  height: 20,
                                ),
                                TextButton.icon(
                                  onPressed: (() {
                                    CacheHelper.saveData(
                                            key: 'token', value: true)
                                        .then((value) => Get.offAllNamed(
                                            RouteHelper.getInitialPage()));
                                    print(CacheHelper.sharedPreferences
                                        .get('token'));
                                  }),
                                  icon: const Icon(Icons.login),
                                  label: Container(
                                    alignment: Alignment.center,
                                    width: 150,
                                    height: 35,
                                    child: const Text(
                                      'Sign In',
                                      style: TextStyle(
                                        fontSize: 18,
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
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    const Text('Don\'t have an account?'),
                                    TextButton(
                                      onPressed: (() {
                                        Get.toNamed(
                                            RouteHelper.getSignUpPage());
                                      }),
                                      child: const Text(
                                        'Sign Up',
                                        style: TextStyle(
                                          fontSize: 15,
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
                                  child: const Text('Have Class Code ?'),
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
                                  outlineBorderRadius: 15,
                                  style: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  onCompleted: (value) {
                                    print(value);
                                    Get.offNamed(RouteHelper.getInitialPage());
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextButton(
                                    onPressed: () => setState(() {
                                          isStudent = false;
                                        }),
                                    child:
                                        const Text('Have username or Email ?'))
                              ],
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //roles
          // (!isClicked)
          //     ? Positioned.fill(
          //         child: BackdropFilter(
          //             filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          //             child: Column(
          //               children: [
          //                 const SizedBox(height: 50,),
          //                 Text(
          //                   'Login as',
          //                   style: Theme.of(context)
          //                       .textTheme
          //                       .headline3
          //                       ?.copyWith(color: const Color(0xffFEA633)),
          //                 ),
          //                 const SizedBox(
          //                   height: 30,
          //                 ),
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: [
          //                     //student
          //                     GestureDetector(
          //                       onTap: () {
          //                         setState(() {
          //                           isClicked = true;
          //                           isStudent = true;
          //                         });
          //                       },
          //                       //student
          //                       child: Column(
          //                         children: [
          //                           Container(
          //                             decoration: BoxDecoration(
          //                                 borderRadius:
          //                                     BorderRadius.circular(20),
          //                                 border:
          //                                     Border.all(color: Colors.blue),
          //                                 color: Colors.white70,
          //                                 image: const DecorationImage(
          //                                     image: AssetImage(
          //                                       'assets/images/student_icon.png',
          //                                     ),
          //                                     fit: BoxFit.cover)),
          //                             width: 200,
          //                             height: 300,
          //                           ),
          //                           Text(
          //                             'Student',
          //                             style: Theme.of(context)
          //                                 .textTheme
          //                                 .headline3
          //                                 ?.copyWith(color: const Color(0xffFEA633)),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                     SizedBox(width: 40,),
          //                     //parent
          //                     GestureDetector(
          //                       onTap: () {
          //                         setState(() {
          //                           isClicked = true;
          //                         });
          //                       },
          //                       child: Column(
          //                         children: [
          //                           Container(
          //                             decoration: BoxDecoration(
          //                                 borderRadius:
          //                                     BorderRadius.circular(20),
          //                                 border:
          //                                     Border.all(color: Colors.blue),
          //                                 color: Colors.white70,
          //                                 image: const DecorationImage(
          //                                   image: AssetImage(
          //                                     'assets/images/parent_icon.png',
          //                                   ),
          //                                 )),
          //                             width: 200,
          //                             height: 300,
          //                           ),
          //                           Text(
          //                             'Parent',
          //                             style: Theme.of(context)
          //                                 .textTheme
          //                                 .headline3
          //                                 ?.copyWith(color: const Color(0xffFEA633)),
          //                           ),
          //                         ],
          //                       ),
          //                     )
          //                   ],
          //                 ),
          //               ],
          //             )))
          //     : Container(),
        ],
      ),
    );
  }
}
