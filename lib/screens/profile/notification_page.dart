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
      backgroundColor: const Color(0xff007EFF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        backgroundColor: const Color(0xff007EFF),
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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/stylings.png')),
        ),
        child: ListView.builder(
          itemBuilder: (context, index) {
            // print(items.length);
            final item = items[index];
            return Dismissible(
                key: UniqueKey(),
                confirmDismiss: (DismissDirection direction) async {
                  return await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: Text(appConfirmEn.tr),
                        content:  Text(
                            appDeleteAlertMessageEn.tr,style: TextStyle(fontSize: 15.sp)),
                        actions: <Widget>[
                          TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: Text(
                                appDeleteEn.tr,
                                style: const TextStyle(color: Colors.red),
                              )),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child:  Text(appCancelEn.tr),
                          ),
                        ],
                      );
                    },
                  );
                },
                direction: DismissDirection.horizontal,
                background: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(right: 20.0.w),
                  color: Colors.redAccent,
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                secondaryBackground: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(right: 20.0.w),
                  color: Colors.redAccent,
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                child: buildListTile(item));
          },
          itemCount: items.length,
          padding:  EdgeInsets.only(top: 15.h, left: 20.w,bottom: 15.h),
          physics: const  BouncingScrollPhysics(),
        ),
      ),
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
          radius: 28.r,
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
