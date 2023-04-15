import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/screens/content/islamic_content.dart';
import 'package:graduation_project/shared/constatns/locale_strings.dart';
import '../../shared/widgets/custom_appBar.dart';
import 'arabic_content.dart';
import 'english_content.dart';
import 'math_content.dart';

class EducationalContentPage extends StatelessWidget {
  const EducationalContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xff007EFF),
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/stylings.png'),
          )),
          child: GridView(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 0.8,
                mainAxisSpacing: 0,
                crossAxisSpacing: 6,
                maxCrossAxisExtent: 250,
                // mainAxisExtent: 300,
              ),
              children: [
                _buildSubjectItem(
                    'اللغه العربية',
                    'https://www.exam-eg.com/wp-content/uploads/2023/04/%D8%B3%D9%84%D8%A7%D8%AD-%D8%A7%D9%84%D8%AA%D9%84%D9%85%D9%8A%D8%B0.png',
                    const ArabicContent()),
                _buildSubjectItem(
                  'اللغه الإنجليزية',
                  'https://www.exam-eg.com/wp-content/uploads/2023/04/%D8%B3%D9%84%D8%A7%D8%AD-%D8%A7%D9%84%D8%AA%D9%84%D9%85%D9%8A%D8%B0.png',
                  const EnglishContent(),
                ),
                _buildSubjectItem(
                  'الرياضيات',
                  'https://www.exam-eg.com/wp-content/uploads/2023/04/%D8%B3%D9%84%D8%A7%D8%AD-%D8%A7%D9%84%D8%AA%D9%84%D9%85%D9%8A%D8%B0.png',
                  const MathContent(),
                ),
                _buildSubjectItem(
                  'التربية الدينية',
                  'https://www.exam-eg.com/wp-content/uploads/2023/04/%D8%B3%D9%84%D8%A7%D8%AD-%D8%A7%D9%84%D8%AA%D9%84%D9%85%D9%8A%D8%B0.png',
                  const IslamicContent(),
                ),
              ])),
    );
  }

  Widget _buildSubjectItem(String title, String imgPath, Widget contentWidget) {
    return Column(
      children: [
        Text(title,
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        InkWell(
          onTap: () => Get.to(() => contentWidget),
          child: Container(
            width: 150.w,
            height: 150.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: NetworkImage(imgPath), fit: BoxFit.fill)),
          ),
        )
      ],
    );
  }
}
