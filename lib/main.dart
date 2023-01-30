import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:graduation_project/shared/route_helper/route_helper.dart';

import 'home/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //to remove status bar
  SystemChrome.setEnabledSystemUIOverlays([
    SystemUiOverlay.bottom, //This line is used for showing the bottom bar
  ]);
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Learning Platform for Children with Mental Disabilities',
      // home:  HomePage(),
      initialRoute: RouteHelper.getSplashPage(),
      getPages: RouteHelper.getRoutes(),
    );
  }
}





