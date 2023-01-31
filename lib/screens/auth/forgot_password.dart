
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/shared/route_helper/route_helper.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Material(
        color: Colors.white,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/forgot.png',
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 35,
                  width: 30,
                ),
                Center(
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText('Send Reset Link To Email!',
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
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 50,
                    horizontal: 25,
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Enter Your Email',
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                        width: 10,
                      ),
                      TextButton.icon(
                        onPressed: (() {}),
                        icon: const Icon(
                          Icons.read_more,
                          size: 28,
                        ),
                        label: Container(
                          alignment: Alignment.center,
                          width: 150,
                          height: 35,
                          child: const Text(
                            'Send Reset Link',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      TextButton.icon(
                        onPressed: (() {
                          Get.toNamed(RouteHelper.getSignInPage());
                        }),
                        icon: const Icon(
                          Icons.home,
                          size: 28,
                        ),
                        label: Container(
                          alignment: Alignment.center,
                          width: 150,
                          height: 35,
                          child: const Text(
                            'Return Home',
                            style: TextStyle(
                              fontSize: 12,
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
        ),
      ),
    );
  }
}
