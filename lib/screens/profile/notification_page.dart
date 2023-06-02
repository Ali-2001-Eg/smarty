import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controllers/notifications_controller.dart';
import 'package:graduation_project/models/notification_model.dart';
import 'package:graduation_project/shared/constatns/locale_strings.dart';
import 'package:graduation_project/shared/widgets/notification_item.dart';

bool isMessageDeleted = false;

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<NotificationsItem> items = List.of(allNotifications);
    final NotificationsController controller =
        Get.put(NotificationsController());
    return Scaffold(
      backgroundColor: const Color(0xffF7F9F6),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        backgroundColor: const Color(0xffF7F9F6),
        title: Text(appNotificationsEn.tr,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.white)),
        centerTitle: true,
        bottomOpacity: 0,
        elevation: 0,
        actions: const [
          // IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/images/logo.png'),
          ),
        ],
      ),
      body: Container(),
    );
  }

  Widget buildListTile(NotificationsItem item) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xff1A3993).withAlpha(100),
      ),
      margin:  EdgeInsets.only(top: 10.h, bottom: 10.h, right: 20.w),
      padding: EdgeInsets.only(left: 20.w, bottom: 10.h, top: 10.h),
      child: ListTile(
        leading: CircleAvatar(
          radius: 28 ,
          backgroundImage: AssetImage(item.imagePath),
        ),
        title: Text(
          item.title,
          style: TextStyle(color: Colors.white, fontSize: 20.sp),
        ),
        subtitle: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
          child: Text(
            item.date,
            style: TextStyle(color: Colors.grey, fontSize: 15.sp),
          ),
        ),
      ),
    );
  }
}
