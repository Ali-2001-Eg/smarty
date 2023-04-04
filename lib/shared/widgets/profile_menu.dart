import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: const Color(0xff090A4A),
          padding: EdgeInsets.all(20.w),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
          backgroundColor:
              Theme.of(context).primaryColor.withAlpha(150),
        ),
        onPressed: press,
        child: Row(
          children: [
            Icon(icon,color: Colors.white,),
            SizedBox(width: 20.w),
            Expanded(child: Text(text,style: const TextStyle(color: Colors.white),)),
            const Icon(Icons.arrow_forward_ios,color: Colors.white,),
          ],
        ),
      ),
    );
  }
}