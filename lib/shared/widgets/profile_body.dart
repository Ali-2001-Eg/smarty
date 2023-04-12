import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/shared/constatns/locale_strings.dart';
import 'package:graduation_project/shared/route_helper/route_helper.dart';
import 'package:graduation_project/shared/widgets/profile_menu.dart';
import 'package:graduation_project/shared/widgets/profile_picture.dart';

import '../cache_helper/cache_helper.dart';


class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        children: [
          const ProfilePic(),
          SizedBox(height: 20.h),
          ProfileMenu(
            text: appProfileEn.tr,
            icon: Icons.person,
            press: () => {
            Get.toNamed(RouteHelper.getAccountPage())
          },
          ),
          ProfileMenu(
            text: appNotificationsEn.tr,
            icon: Icons.notifications_none,
            press: () {
              Get.toNamed(RouteHelper.getNotificationsPage());
            },
          ),
          ProfileMenu(
            text: appSettingsEn.tr,
            icon: Icons.settings,
            press: () {
              Get.toNamed(RouteHelper.getSettingsPage());
            },
          ),
          ProfileMenu(
            text: appFeedbackEn.tr,
            icon: Icons.question_mark,
            press: () {
              Get.toNamed(RouteHelper.getFeedbackPage());
            },
          ),
          ProfileMenu(
            text: appLogoutEn.tr,
            icon: Icons.logout,
            press: () {
              CacheHelper.remove(key: 'token');
              CacheHelper.remove(key: 'onBoarding');
              CacheHelper.remove(key: 'getStarted');
              Get.offAllNamed(RouteHelper.getSignInPage());
            },
          ),
        ],
      ),
    );
  }
}