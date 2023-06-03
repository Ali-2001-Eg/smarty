import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/shared/constatns/locale_strings.dart';

import '../route_helper/route_helper.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => myDrawer(context);
}

Widget myDrawer(context, {bool forStudent = true}) => Drawer(
      backgroundColor: const Color(0xff17203a),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100.h,
          ),
          //profile
          const ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white24,
              child: Icon(
                CupertinoIcons.person,
                color: Colors.white,
              ),
            ),
            title: Text(
              'Ali Mazen',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'alimazen@gmail.com',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 30.h,),

          !forStudent
              ? ListTile(
                  dense: true,
                  title: Text(
                    appProfileEn.tr,
                    style: TextStyle(fontSize: 15.sp, color: Colors.white),
                  ),
                  leading: const Icon(CupertinoIcons.profile_circled,
                      color: Colors.white),
                  onTap: () => Get.toNamed(RouteHelper.getAccountPage()),
                )
              : Container(),

          //Initial
          forStudent
              ? ListTile(
                  dense: true,
                  title: Text(
                    appInitialAssessmentEn.tr,
                    style: TextStyle(fontSize: 15.sp, color: Colors.white),
                  ),
                  leading: const Icon(
                    CupertinoIcons.question_square_fill,
                    color: Colors.white,
                  ),
                  onTap: () =>
                      Get.toNamed(RouteHelper.getInitialAssessmentPage()),
                )
              : Container(),
          //Final
          forStudent
              ? ListTile(
                  dense: true,
                  title: Text(
                    appFinalAssessmentEn.tr,
                    style: TextStyle(fontSize: 15.sp, color: Colors.white),
                  ),
                  leading: const Icon(
                    CupertinoIcons.printer_fill,
                    color: Colors.white,
                  ),
                  onTap: () =>
                      Get.toNamed(RouteHelper.getFinalAssessmentPage()),
                )
              : Container(),
          //About Us
          ListTile(
            dense: true,
            title: Text(
              appAboutUsEn.tr,
              style: TextStyle(fontSize: 15.sp, color: Colors.white),
            ),
            leading: const Icon(
              Icons.question_answer,
              color: Colors.white,
            ),
            onTap: () => Get.toNamed(RouteHelper.getAboutUsPage()),
          ),
          //Feedback
          !forStudent
              ? ListTile(
                  dense: true,
                  title: Text(
                    appFeedbackEn.tr,
                    style: TextStyle(fontSize: 15.sp, color: Colors.white),
                  ),
                  leading: const Icon(
                    Icons.feedback_outlined,
                    color: Colors.white,
                  ),
                  onTap: () => Get.toNamed(RouteHelper.getFeedbackPage()),
                )
              : Container(),
        ],
      ),
    );
