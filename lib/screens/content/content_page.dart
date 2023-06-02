import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class EducationalContentPage extends StatelessWidget {
  const EducationalContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xffF7F9F6),
      body: Container(),
    );
  }

  Widget _buildSubjectItem(String title, String imgPath, Widget contentWidget) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 10.w),
      child: Row(
        children: [
          InkWell(
            onTap: () => Get.to(() => contentWidget),
            child: Container(
              height: 150.h,
              width: 150.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    imgPath,
                  ),
                  fit: BoxFit.fill
                )
              ),
            ),
          ),
          SizedBox(
            width: 30.w,
          ),
          Text(title,
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white))
        ],
      ),
    );
  }
}
