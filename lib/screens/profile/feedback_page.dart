import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:get/get.dart";
import 'package:graduation_project/shared/constatns/locale_strings.dart';

class FeedBackPage extends StatelessWidget {
  const FeedBackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color(0xff090A4A),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        title: Text(
          appFeedbackEn.tr,
          style: TextStyle(fontSize: 20.sp),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildFeedbackForm(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 26.w,vertical: 12.h),
              backgroundColor: const Color(0xff090A4A)
            ),
            child: Text(appSubmitEn.tr),
          ),
        ],
      ),
    );
  }

  Widget buildFeedbackForm() {
    return Container(
      margin: EdgeInsets.all(20.w),
      child:  TextField(
        maxLines: 10,
        decoration: InputDecoration(
          hintText: briefFeedbackEn.tr,
          hintStyle: const TextStyle(
            fontSize: 13.0,
            color: Color(0xff090A4A),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff090A4A),
            ),
          ),
        ),
      ),
    );
  }
}
