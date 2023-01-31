import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/shared/route_helper/route_helper.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                    'assets/images/register.png',
                    fit: BoxFit.cover,
                    height: 300,
                    width: 350,
                  ),
                  const SizedBox(
                    height: 20,
                    width: 20,
                  ),
              AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText('Create Account',
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
                            icon: Icon(Icons.person),
                            hintText: 'Enter Your Full Name',
                            labelText: 'Full Name',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.email),
                            hintText: 'Enter Your Email/Username',
                            labelText: 'Email or Username',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.lock),
                            hintText: 'Enter Your Password',
                            labelText: 'Password',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        TextButton.icon(
                          onPressed: (() {
                            //sign up
                          }),
                          icon: const Icon(Icons.create),
                          label: Container(
                            alignment: Alignment.center,
                            width: 150,
                            height: 35,
                            child: const Text(
                              'Sign Up',
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
                            const Text('Already have an account?'),
                            TextButton(
                              onPressed: (() {
                                Get.toNamed(RouteHelper.getSignInPage());
                              }),
                              child: const Text(
                                'Sign In',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),

                        const Text(
                          'By signing up you agree to our terms, conditions and privacy Policy.',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold
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
      ),
    );
  }
}