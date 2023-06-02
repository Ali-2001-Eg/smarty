
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/shared/constatns/locale_strings.dart';
import 'package:graduation_project/shared/route_helper/route_helper.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,        backgroundColor: Colors.grey.shade50,

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
               SizedBox(
                height: 35.h,
                width: 30.w,
              ),
              Center(
                child: Text(appSendResetLinkToEmailEn.tr,
                        style:  TextStyle(
                          color: Colors.red,
                          fontSize: 20.sp,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Times New Roman',
                          fontWeight: FontWeight.w500,
                        ),

                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 50.h,
                  horizontal: 25.w,
                ),
                child: Column(
                  children: [
                    TextFormField(
                      decoration:  InputDecoration(
                        hintText: appEmailOrUserNameEn.tr,
                        labelText: appEmailOrUserNameEn.tr,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                     SizedBox(
                      height: 40.h,
                      width: 10.w,
                    ),
                    TextButton.icon(
                      onPressed: (() {}),
                      icon: Container(),
                      label: Container(
                        alignment: Alignment.center,
                        width: 150.w,
                        height: 35.h,
                        child:  Text(
                          appSendResetLinkEn.tr,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(25 ),
                        ),
                      ),
                    ),
                     SizedBox(
                      height: 10.h,
                      width: 10.w,
                    ),
                    TextButton.icon(
                      onPressed: (() {
                        Get.toNamed(RouteHelper.getSignInPage());
                      }),
                      icon:Container(),
                      label: Container(
                        alignment: Alignment.center,
                        width: 150.w,
                        height: 35.h,
                        child:  Text(
                          appReturnHomeEn.tr,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
