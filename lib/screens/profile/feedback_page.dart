import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:get/get.dart";

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
          'Feedback',
          style: TextStyle(fontSize: 20.sp),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildFeedbackForm(),
          Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(13),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5E5E5),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.add,
                      color: Color(0xff090A4A),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Upload screenshot (optional)",
                  style: TextStyle(
                    color: Color(0xff090A4A),
                    fontSize: 13.sp
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 26.w,vertical: 12.h),
              backgroundColor: const Color(0xff090A4A)
            ),
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  Widget buildFeedbackForm() {
    return Container(
      margin: EdgeInsets.all(20.w),
      child: const TextField(
        maxLines: 10,
        decoration: InputDecoration(
          hintText: "Please briefly describe the issue",
          hintStyle: TextStyle(
            fontSize: 13.0,
            color: Color(0xff090A4A),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff090A4A),
            ),
          ),
        ),
      ),
    );
  }
}
