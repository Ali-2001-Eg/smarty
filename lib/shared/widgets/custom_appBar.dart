import 'package:flutter/material.dart';
import 'package:graduation_project/shared/widgets/my_drawer.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double _preferredHeight = 50;

  const CustomAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      drawer: myDrawer(context),
      body: Container(
        height: 50,
        alignment: Alignment.bottomCenter,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.tealAccent,
              Colors.redAccent,
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Smarty'),
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                  'assets/images/logo.png'
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_preferredHeight);
}