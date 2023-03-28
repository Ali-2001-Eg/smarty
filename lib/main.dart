import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/get_started/get_started_page.dart';
import 'package:graduation_project/screens/auth/sign_in_page.dart';
import 'package:graduation_project/screens/auth/sign_up_page.dart';
import 'package:graduation_project/shared/cache_helper/cache_helper.dart';
import 'package:graduation_project/shared/route_helper/route_helper.dart';

import 'on_boarding/on_boarding_page.dart';

PageController pageController = PageController(initialPage: 0);
int currentIndex = 0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  //to remove local storage
  CacheHelper.clearData(key: 'token');
  CacheHelper.clearData(key: 'onBoarding');
  CacheHelper.clearData(key: 'getStarted');
  //to remove status bar
  SystemChrome.setEnabledSystemUIOverlays([
    SystemUiOverlay.bottom,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smarty',
      // home: const SignInPage(),
      theme: ThemeData(),
      initialRoute: RouteHelper.getSplashPage(),
      getPages: RouteHelper.getRoutes(),
    ),);
  }
}
