import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountIcon extends StatelessWidget {
  const AccountIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      // height: 150.h,
      // width: 150.w,
      child: CircleAvatar(
        radius:  80,
        backgroundImage: AssetImage("assets/images/student_icon.png"),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
