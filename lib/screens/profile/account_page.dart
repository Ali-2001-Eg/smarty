import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controllers/user_controller.dart';
import 'package:graduation_project/shared/constatns/locale_strings.dart';

class AccountPage extends StatelessWidget {
  AccountPage({Key? key}) : super(key: key);

  final UserController _controller = Get.put(UserController());
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color(0xff007EFF),
        title: Text(appUpdateProfileEn.tr,
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
        actions:  [
          CircleAvatar(
            radius: 25.r,
            backgroundImage: const AssetImage('assets/images/logo.png'),
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
            color: Color(0xff007EFF),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/stylings.png'),
            )
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //username
              _immutableProfileWidget(
                  context, Icons.person, 'Ali_Eg', appEmailOrUserNameEn.tr),
              //email
              _immutableProfileWidget(context, Icons.email,
                  'alimazenali@outlook.com', appEmailOrUserNameEn.tr),
              //confirm current password
              Container(
                margin:  EdgeInsets.only(
                    top: 30.h, left: 15.w, right: 15.w, bottom: 0),
                padding: EdgeInsets.only(left: 25.w),
                child: Text(
                  appCurrentPasswordEn.tr,
                  style: const TextStyle(
                    color: Color(0xffFEA633),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Container(
                margin:  EdgeInsets.only(top: 5.h, left: 15.w, right: 15.w),
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20.r)),
                child: Obx(
                  () => TextFormField(
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'required';
                      }
                      return null;
                    },
                    key: _key,
                    enabled: !_controller.isDisabled.value,
                    controller: _currentPasswordController,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(color: Colors.white),
                    obscureText: (_controller.isPasswordShown.value),
                    decoration: InputDecoration(
                      hintText: appCurrentPasswordEn.tr,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _controller.suffix,
                          size: 20.h,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          print('tapped');
                          _controller.changeSuffixIcon();
                        },
                      ),
                      prefixIcon: IconButton(
                        icon: Icon(
                          Icons.lock,
                          size: 20.h,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                      hintStyle:
                          Theme.of(context).textTheme.bodyText1?.copyWith(
                                color: Colors.white,
                              ),
                    ),
                  ),
                ),
              ),
               SizedBox(
                height: 30.h,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  padding: EdgeInsets.all(5.w),
                  child: TextButton(
                    onPressed: () {
                      // print('ali');
                      _controller.disableTextField();
                      _controller.verifyCurrentPassword();
                    },
                    child:  Text(
                      appSubmitEn.tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  //new password
                ),
              ),
              //new password
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: 20.h, left: 15.w, right: 15.w, bottom: 0),
                    padding: const EdgeInsets.only(left: 25),
                    child:  Text(
                      appCurrentPasswordEn.tr,
                      style: const TextStyle(
                        color: Color(0xffFEA633),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Container(
                    margin:  EdgeInsets.only(top: 5.h, left: 15.w, right: 15.w),
                    padding:  EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Obx(
                      () => TextField(
                        enabled: _controller.isVerified.value,
                        controller: _newPasswordController,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(color: Colors.white),
                        obscureText: (_controller.isPasswordShown.value),
                        decoration: InputDecoration(
                          hintText: appNewPasswordEn.tr,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _controller.suffix,
                              size: 20.h,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              print('tapped');
                              _controller.changeSuffixIcon();
                            },
                          ),
                          prefixIcon: IconButton(
                            icon:  Icon(
                              Icons.lock,
                              size: 20.h,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          hintStyle:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),color: Colors.blue,
                      ),
                      margin: EdgeInsets.only(top: 20.h),

                      child: TextButton(
                        onPressed: () {
                          _controller.verifyCurrentPassword();
                        },
                        child:  Text(
                          appSavePasswordEn.tr,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      //new password
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _immutableProfileWidget(
    BuildContext context,
    IconData icon,
    String text,
    String label,
  ) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin:
                 EdgeInsets.only(top: 30.h, left: 15.w, right: 15.w, bottom: 5.h),
            padding:  EdgeInsets.only(left: 25.w),
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xffFEA633),
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(20.r),
            ),
            margin: EdgeInsets.only(top: 0, left: 15.w, right: 15.w),
            padding:  EdgeInsets.all(10.w),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 20.h,
                ),
                 SizedBox(
                  width: 20.w,
                ),
                Expanded(
                    child: Text(
                  text,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(color: Colors.white),
                )),
              ],
            ),
          ),
        ],
      );
}
