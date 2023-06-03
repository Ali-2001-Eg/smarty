import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/screens/profile/profile_page.dart';
import 'package:graduation_project/screens/content/content_page.dart';
import 'package:graduation_project/screens/games/games_page.dart';
import 'package:graduation_project/shared/widgets/my_drawer.dart';
import '../../shared/widgets/custom_bottom_navbar.dart';

class HomeLayoutPage extends StatelessWidget {
  final bool isStudent;
  const HomeLayoutPage({Key? key, required this.isStudent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(isStudent);
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey.shade50,
      drawer: myDrawer(context, forStudent: isStudent),
      appBar: AppBar(
        backgroundColor: const Color(0xffF7F9F6),
        centerTitle: true,
        elevation: 0,
        bottomOpacity: 0,
        iconTheme: IconThemeData(color:const Color(0xff090A4A),size: 20.h),
        // toolbarHeight: 200,
        title: Text(
          'Smarty',
          style: Theme.of(context)
              .textTheme
              .displaySmall
              ?.copyWith(color:const Color(0xff090A4A)),
        ),
        actions: const [
          // IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/logo.png'),
          )
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const <Widget>[
          EducationalContentPage(),
          GamesPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
