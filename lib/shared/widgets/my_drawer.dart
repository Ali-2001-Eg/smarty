


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

Widget myDrawer(context,{fromGetStarted=true}) => Drawer(
    backgroundColor: const Color(0xff17203a),
    child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 50.h,),
          //profile
          const ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white24,
            child: Icon(CupertinoIcons.person,color: Colors.white,),
          ),
            title: Text('Ali Mazen',style: TextStyle(color: Colors.white),),
            subtitle: Text('alimazen@gmail.com',style: TextStyle(color: Colors.white),),

          ),
          fromGetStarted?ListTile(
            dense: true,
            title:  Text(appProfileEn.tr,style: TextStyle(fontSize: 15.sp),),
            leading: const Icon(CupertinoIcons.profile_circled),
            onTap: () => Get.toNamed(RouteHelper.getAccountPage()),
          ):Container(),
          //Games
          fromGetStarted?ListTile(
            dense: true,
            title:  Text(appGamesEn.tr,style: TextStyle(fontSize: 15.sp,color: Colors.white),),

            leading: const Icon(Icons.games),
            onTap: () => Get.toNamed(RouteHelper.getGamesPage()),
          ):Container(),
          //Chat
          ListTile(
            dense: true,
            title:  Text(appChatEn.tr,style: TextStyle(fontSize: 15.sp,color: Colors.white),),
            leading: const Icon(CupertinoIcons.chat_bubble_2,color: Colors.white,),
            onTap: () => Get.toNamed(RouteHelper.getChatPage()),
          ),
          //Content
          fromGetStarted?ListTile(
            dense: true,
            title:  Text(appContentEn.tr,style: TextStyle(fontSize: 15.sp,color: Colors.white),),
            leading: const Icon(Icons.menu_book,color: Colors.white,),
            onTap: () => Get.toNamed(RouteHelper.getEducationalContentPage()),
          ):Container(),
          //Initial
          ListTile(
            dense: true,
            title:  Text(appInitialAssessmentEn.tr,style: TextStyle(fontSize: 15.sp,color: Colors.white),),
            leading: const Icon(CupertinoIcons.question_square_fill,color: Colors.white,),
            onTap: () => Get.toNamed(RouteHelper.getInitialAssessmentPage()),
          ),
          //Final
          ListTile(
            dense: true,
            title:  Text(appFinalAssessmentEn.tr,style: TextStyle(fontSize: 15.sp,color: Colors.white),),
            leading: const Icon(CupertinoIcons.printer_fill,color: Colors.white,),
            onTap: () => Get.toNamed(RouteHelper.getFinalAssessmentPage()),
          ),
          //Events
          ListTile(
            dense: true,
            title:  Text(appEventEn.tr,style: TextStyle(fontSize: 15.sp,color: Colors.white),),
            leading: const Icon(Icons.event_available,color: Colors.white,),
            onTap: () => Get.toNamed(RouteHelper.getEventsPage()),
          ),
          //Settings
          ListTile(
            dense: true,
            title:  Text(appSettingsEn.tr,style: TextStyle(fontSize: 15.sp,color: Colors.white),),
            leading: const Icon(Icons.settings,color: Colors.white,),
            onTap: () => Get.toNamed(RouteHelper.getSettingsPage()),
          ),
          //About Us
          ListTile(
            dense: true,
            title:  Text(appAboutUsEn.tr,style: TextStyle(fontSize: 15.sp,color: Colors.white),),
            leading: const Icon(Icons.question_answer,color: Colors.white,),
            onTap: () => Get.toNamed(RouteHelper.getAboutUsPage()),
          ),
          //Feedback
          ListTile(
            dense: true,
            title:  Text(appFeedbackEn.tr,style: TextStyle(fontSize: 15.sp,color: Colors.white),),
            leading: const Icon(Icons.feedback_outlined,color: Colors.white,),
            onTap: () => Get.toNamed(RouteHelper.getFeedbackPage()),
          ),
        ],
      ),
    ),
  );
