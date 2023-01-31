


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/shared/cache_helper/cache_helper.dart';


import '../route_helper/route_helper.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return myDrawer(context);

  }
}

Widget myDrawer(context,{fromGetStarted=true}) {
  return Drawer(
    backgroundColor: Colors.white.withAlpha(200),
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          children: [
            //profile
            fromGetStarted?ListTile(
              dense: true,
              title: const Text("Profile"),
              leading: const Icon(Icons.person),
              onTap: () => Get.toNamed(RouteHelper.getAccountPage()),
            ):Container(),
            //Games
            fromGetStarted?ListTile(
              dense: true,
              title: const Text("Games"),
              leading: const Icon(Icons.games),
              onTap: () => Get.toNamed(RouteHelper.getGamesPage()),
            ):Container(),
            //Chat
            ListTile(
              dense: true,
              title: const Text("Chat"),
              leading: const Icon(Icons.whatsapp),
              onTap: () => Get.toNamed(RouteHelper.getChatPage()),
            ),
            //Content
            fromGetStarted?ListTile(
              dense: true,
              title: const Text("Educational Content"),
              leading: const Icon(Icons.menu_book),
              onTap: () => Get.toNamed(RouteHelper.getEducationalContentPage()),
            ):Container(),
            //Initial
            ListTile(
              dense: true,
              title: const Text("Initial Assessment Exam"),
              leading: const Icon(Icons.feed),
              onTap: () => Get.toNamed(RouteHelper.getInitialAssessmentPage()),
            ),
            //Final
            ListTile(
              dense: true,
              title: const Text("Final Assessment Exam"),
              leading: const Icon(Icons.print),
              onTap: () => Get.toNamed(RouteHelper.getFinalAssessmentPage()),
            ),
            //Events
            ListTile(
              dense: true,
              title: const Text("Events"),
              leading: const Icon(Icons.event_available),
              onTap: () => Get.toNamed(RouteHelper.getEventsPage()),
            ),
            //Settings
            ListTile(
              dense: true,
              title: const Text("Settings"),
              leading: const Icon(Icons.settings),
              onTap: () => Get.toNamed(RouteHelper.getSettingsPage()),
            ),
            //About Us
            ListTile(
              dense: true,
              title: const Text("About Us"),
              leading: const Icon(Icons.question_answer),
              onTap: () => Get.toNamed(RouteHelper.getAboutUsPage()),
            ),
            //Feedback
            ListTile(
              dense: true,
              title: const Text("Feedback"),
              leading: const Icon(Icons.feedback_outlined),
              onTap: () => Get.toNamed(RouteHelper.getFeedbackPage()),
            ),

            const Padding(
              padding: EdgeInsets.only(top: 100,bottom: 30),
              child: CircleAvatar(
                radius: 50,
                backgroundImage:  AssetImage(
                  'assets/images/logo.png'
                ),
              ),
            ),
             Text('Smarty',style: Theme.of(context).textTheme.headline4?.copyWith(color: const Color(0xffFEA633)),),
          ],
        ),
      ),
    ),
  );
}
