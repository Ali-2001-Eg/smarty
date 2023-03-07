import 'package:flutter/material.dart';
import 'package:graduation_project/shared/widgets/my_drawer.dart';
import 'package:graduation_project/shared/widgets/profile_body.dart';

import '../../shared/widgets/custom_appBar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/spalshLearn.png'),fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Text('Profile',style: Theme.of(context).textTheme.headline4?.copyWith(color: Color(0xffFEA633)),),
              ),
              ProfileBody(),
            ],
          ),
        ),
      ),

    );
  }
}
