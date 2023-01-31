import 'package:flutter/material.dart';
import 'package:graduation_project/shared/widgets/bottom_wave_clipper.dart';

import '../../main.dart';
import 'custom_nav_items.dart';

class CustomBottomNavigationBar extends StatefulWidget {
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
    return SizedBox(
      height: 110,
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: <Widget>[
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
            Positioned(
              bottom: 45,
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
            Positioned(
              bottom: 10,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Text(
                    'Content',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.white70),
                  ),
                  Container(),
                  const Text(
                    'Games',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.white70),
                  ),
                  Container(),
                  const Text(
                    'Profile',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.white70),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
