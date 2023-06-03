import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,  this.color = const Color(0xff090A4A),
  }) : super(key: key);

  final String text;
  final IconData icon;
  final Color color;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: TextButton(
        style: TextButton.styleFrom(
          // primary: const Color(0xff090A4A),
          padding: EdgeInsets.all(20.w),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: color,
        ),
        onPressed: press,
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 25.h,
            ),
            SizedBox(width: 20.w),
            Expanded(
                child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 15.sp),
            )),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
