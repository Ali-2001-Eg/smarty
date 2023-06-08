import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/screens/home/home_page.dart';
import 'package:graduation_project/shared/route_helper/route_helper.dart';
import '../../shared/cache_helper/cache_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 850))
      ..forward(); //make instance first and forward it
    animation =
        CurvedAnimation(curve: Curves.easeInToLinear, parent: controller);
    //after animation go to a next page directly
    Timer(const Duration(milliseconds: 2000), () => goToWidget());
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1A3993),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ScaleTransition(
            scale: animation,
            child: const Center(
                child: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/images/logo.png'),
            )),
          ),
          Center(
            child: Text(
              'Smarty',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  //to dispose viewing some pages more than once
  void goToWidget() {
    // var onBoarding = CacheHelper.getData(key: 'onBoarding');

    bool? role = CacheHelper.getBool('student');
    print('role is $role');
//to determine which widget will start the app

    if (role == null) {
      Get.offAllNamed(RouteHelper.getOnBoardingPage());
    } else if (role) {
      Get.offAll(() => const HomeLayoutPage(isStudent: true));
    } else {
      Get.offAll(() => const HomeLayoutPage(isStudent: false));
    }
  }
}
