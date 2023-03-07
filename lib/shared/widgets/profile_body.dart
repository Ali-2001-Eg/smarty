import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/shared/route_helper/route_helper.dart';
import 'package:graduation_project/shared/widgets/profile_menu.dart';
import 'package:graduation_project/shared/widgets/profile_picture.dart';

import '../cache_helper/cache_helper.dart';


class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 50),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: Icons.person,
            press: () => {
            Get.toNamed(RouteHelper.getAccountPage())
          },
          ),
          ProfileMenu(
            text: "Notifications",
            icon: Icons.notifications_none,
            press: () {
              Get.toNamed(RouteHelper.getNotificationsPage());

            },
          ),
          ProfileMenu(
            text: "Settings",
            icon: Icons.settings,
            press: () {
              Get.toNamed(RouteHelper.getSettingsPage());

            },
          ),
          ProfileMenu(
            text: "Help Center",
            icon: Icons.question_mark,
            press: () {
              Get.toNamed(RouteHelper.getFeedbackPage());
            },
          ),
          ProfileMenu(
            text: "Log Out",
            icon: Icons.logout,
            press: () {
              CacheHelper.clearData(key: 'token');
              CacheHelper.clearData(key: 'onBoarding');
              CacheHelper.clearData(key: 'getStarted');
              Get.offAllNamed(RouteHelper.getSignInPage());
            },
          ),
        ],
      ),
    );
  }
}