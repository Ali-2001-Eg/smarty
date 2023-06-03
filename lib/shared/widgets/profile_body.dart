import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/shared/constatns/locale_strings.dart';
import 'package:graduation_project/shared/route_helper/route_helper.dart';
import 'package:graduation_project/shared/widgets/profile_menu.dart';
import 'package:graduation_project/shared/widgets/account_icon.dart';

import '../../controllers/language_controller.dart';
import '../cache_helper/cache_helper.dart';
import '../constatns/app_strings.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // SizedBox(height: 20.h),
        ProfileMenu(
          text: appProfileEn.tr,
          icon: Icons.person,
          press: () => {Get.toNamed(RouteHelper.getAccountPage())},
        ),
        ProfileMenu(
          text: appFeedbackEn.tr,
          icon: Icons.question_mark,
          press: () {
            Get.toNamed(RouteHelper.getFeedbackPage());
          },
          color: const Color(0xff090A4A),
        ),
        ProfileMenu(
          text: appLogoutEn.tr,
          icon: Icons.logout,
          color: const Color(0xFFee7b64),
          press: () {
            CacheHelper.remove(key: 'token');
            CacheHelper.remove(key: 'onBoarding');
            Get.offAllNamed(RouteHelper.getSignInPage());
          },
        ),
        GetBuilder<LanguageController>(
          builder: (langController) {
            return Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.language,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(appLangEn.tr,
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp)),
                    ],
                  ),
                  Container(
                    width: 200.w,
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.h, vertical: 2.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color(0xffFEA633), width: 2),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        onChanged: (value) {
                          langController.changeLanguage(value!);
                          Get.updateLocale(Locale(value));
                        },
                        value: langController.locale,
                        iconSize: 25.h,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.grey,
                        ),
                        items: [
                          DropdownMenuItem(
                            value: eng,
                            child: Text(
                              englishEn.tr,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp,
                                  color: Colors.grey),
                            ),
                          ),
                          DropdownMenuItem(
                            value: arb,
                            child: Text(
                              arabicEn.tr,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp,
                                  color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
