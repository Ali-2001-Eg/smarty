import 'package:flutter/material.dart';
import 'package:graduation_project/screens/profile/profile_page.dart';
import 'package:graduation_project/screens/content/content_page.dart';
import 'package:graduation_project/screens/games/games_page.dart';
import 'package:graduation_project/shared/widgets/my_drawer.dart';
import '../../main.dart';
import '../../shared/widgets/custom_appBar.dart';
import '../../shared/widgets/custom_bottom_navbar.dart';

class HomeLayoutPage extends StatelessWidget {
  const HomeLayoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      drawer: myDrawer(context,fromGetStarted: false),
      appBar: AppBar(
        backgroundColor: const Color(0xff1A3993),
        centerTitle: true,
        title: Text('Smarty',style: Theme.of(context).textTheme.headline3?.copyWith(color: Color(0xffFEA633)),),
        actions: const [
          // IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
          CircleAvatar(
            radius: 25,
            backgroundImage:  AssetImage(
              'assets/images/logo.png'
            ),
          )
        ],
      ),
      body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children:const <Widget>[
            EducationalContentPage(),
            GamesPage(),
            ProfilePage(),
          ],
        ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
