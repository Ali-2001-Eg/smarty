import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/shared/widgets/profile_body.dart';

import '../../shared/widgets/account_icon.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const AccountIcon(),
          Padding(
            padding: EdgeInsets.only(bottom: 50.h),
            child: const ProfileBody(),
          ),
        ],
      );
  }
}
