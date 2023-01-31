import 'package:flutter/material.dart';
import 'package:graduation_project/shared/widgets/my_drawer.dart';

import '../../shared/widgets/custom_appBar.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(



      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/spalshLearn.png'),fit: BoxFit.cover),
        ),
        child: Center(
          child: Text('account'),
        ),
      ),

    );
  }
}
