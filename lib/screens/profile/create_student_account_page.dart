import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/shared/constatns/locale_strings.dart';

class CreateStudentAccountPage extends StatelessWidget {
  const CreateStudentAccountPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final GlobalKey<FormState> _key = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: const Color(0xff090A4A),
        title: Text(appProfileEn.tr,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios)),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                createDescriptionEn.tr,
                style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color:  Colors.grey[600]),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 30.h,
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  icon: const Icon(Icons.email),
                  hintText: appEmailOrUserNameEn.tr,
                  labelText: appEmailOrUserNameEn.tr,
                  border: const OutlineInputBorder(),
                ),
                onChanged: (value) {},
              ),
              SizedBox(
                height: 30.h,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  icon: const Icon(Icons.lock),
                  hintText: appPasswordEn.tr,
                  labelText: appPasswordEn.tr,
                  border: const OutlineInputBorder(),
                ),
                onChanged: (value) {
                  // print(value);
                },
              ),
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: TextButton(
                  onPressed: (() {}),
                  child: Container(
                    alignment: Alignment.center,
                    width: 150.w,
                    height: 35.h,
                    child: Text(
                      appSignupEn.tr,
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xff090A4A),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
