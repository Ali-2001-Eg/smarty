import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/shared/widgets/my_drawer.dart';
import 'package:graduation_project/shared/widgets/profile_body.dart';

import '../../shared/widgets/custom_appBar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: EdgeInsets.only(top: 10.h),
        decoration: const BoxDecoration(
          color: Color(0xff007EFF),
          image: DecorationImage(
              image: AssetImage('assets/images/stylings.png'),fit: BoxFit.cover),
        ),
        child: const SingleChildScrollView(
          child: ProfileBody(),
        ),
      );
  }
}
