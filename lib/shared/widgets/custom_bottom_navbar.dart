import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/shared/constatns/locale_strings.dart';
import 'package:graduation_project/shared/widgets/bottom_wave_clipper.dart';

import 'custom_nav_items.dart';

PageController pageController = PageController(initialPage: 0);
int currentIndex = 0;

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  setPage() {
    setState(() {
      pageController.jumpToPage(currentIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //clip path
        Positioned(
          bottom: 0,
          child: ClipPath(
            clipper: WaveBottomClipper(),
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).primaryColor.withAlpha(150),
                    Theme.of(context).primaryColor,
                  ],
                ),
              ),
            ),
          ),
        ),
        //icons
        Positioned(
          bottom: 29.h,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CustomNavItem(setPage: setPage, icon: Icons.menu_book, id: 0),
              Container(),
              CustomNavItem(setPage: setPage, icon: Icons.games, id: 1),
              Container(),
              CustomNavItem(setPage: setPage, icon: Icons.person, id: 2),
            ],
          ),
        ),
        //text
        Positioned(
          bottom: 10.h,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                appContentEn.tr,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white70),
              ),
              Container(),
              Text(
                appGamesEn.tr,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white70),
              ),
              Container(),
              Text(
                profileEn.tr,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white70),
              ),
            ],
          ),
        )
      ],
    );
  }
}
