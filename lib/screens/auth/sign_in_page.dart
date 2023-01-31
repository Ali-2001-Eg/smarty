import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/shared/route_helper/route_helper.dart';

import '../../shared/cache_helper/cache_helper.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Material(
        color: Colors.white,
        child: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 32,
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.email),
                            hintText: 'Enter Your Username/Email',
                            labelText: 'Email or Username',
                          ),
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.lock),
                            hintText: 'Enter Your Password',
                            labelText: 'Password',
                          ),
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),

                        TextButton(
                          onPressed: () {
                            Get.toNamed(RouteHelper.getForgottenPassword());
                          },
                          child: const Text(
                            'Forgot Password?',
                          ),
                        ),

                        TextButton.icon(
                          onPressed: (() {
                            CacheHelper.saveData(key: 'token', value: true)
                                .then((value) => Get.offAllNamed(RouteHelper.getInitialPage()));
                            print(CacheHelper.sharedPreferences.get('token'));

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
                        Row(
                          children: [
                            const Text('Don\'t have an account?'),
                            TextButton(
                              onPressed: (() {
                                Get.toNamed(RouteHelper.getSignUpPage());
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}