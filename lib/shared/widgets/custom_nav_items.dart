import 'package:flutter/material.dart';

import '../../main.dart';

class CustomNavItem extends StatelessWidget {
  final IconData icon;
  final int id;
  final Function setPage;

  const CustomNavItem(
      {required this.setPage, required this.icon, required this.id});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        currentIndex = id;
        setPage();
      },
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Theme.of(context).primaryColor,
        child: CircleAvatar(
          radius: 25,
          backgroundColor: currentIndex == id
              ? Colors.white.withOpacity(0.9)
              : Colors.transparent,
          child: Icon(
            icon,
            color: currentIndex == id
                ? Colors.black
                : Colors.white.withOpacity(0.9),
          ),
        ),
      ),
    );
  }
}
