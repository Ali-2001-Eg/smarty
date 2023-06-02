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
        backgroundColor: const Color(0xffF7F9F6),
        title: Text(appUpdateProfileEn.tr,
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(onPressed: ()=>Get.back(),icon: Icon(Icons.arrow_back_ios)),
        automaticallyImplyLeading: false,
        actions:  const [
          CircleAvatar(
            radius: 25 ,
            backgroundImage: AssetImage('assets/images/logo.png'),
          )
        ],
      ),
      body: Container(),
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
              borderRadius: BorderRadius.circular(20 ),
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
