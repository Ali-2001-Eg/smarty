import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountIcon extends StatelessWidget {
  const AccountIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      width: 150.w,
      child: const CircleAvatar(
        backgroundImage: AssetImage("assets/images/student_icon.png"),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
