import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/models/notification_model.dart';
import 'package:graduation_project/shared/widgets/notification_item.dart';

import '../../shared/widgets/notification_dialog.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

bool isMessageDeleted = false;

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    List<NotificationsItem> items = List.of(allNotifications);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white70,
            )),
        backgroundColor: const Color(0xff090A4A),
        title: Text('Notifications',
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.white70)),
        centerTitle: true,
        bottomOpacity: 0,
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
              image: AssetImage('assets/images/spalshLearn.png')),
        ),
        child: ListView.builder(
          itemBuilder: (context, index) {
            print(items.length);
            final item = items[index];
            return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.horizontal,
                onDismissed: (direction) {
                  items.removeAt(index);
                  Get.snackbar(
                    'Message',
                    'is deleted',
                    backgroundColor: Color(0xff090A4A),
                    snackStyle: SnackStyle.FLOATING,
                    isDismissible: true,
                    barBlur: 10,
                    colorText: Colors.red,
                  );
                },
                background: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(right: 20.0),
                  color: Colors.redAccent,
                  child: Icon(Icons.delete, color: Colors.white),
                ),
                secondaryBackground: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(right: 20.0),
                  color: Colors.redAccent,
                  child: Icon(Icons.delete, color: Colors.white),
                ),
                child: buildListTile(item));
          },
          itemCount: items.length,
          padding: const EdgeInsets.only(top: 15, left: 20),
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
      margin: const EdgeInsets.only(top: 20, bottom: 20, right: 20),
      padding: const EdgeInsets.only(left: 20),
      child: ListTile(
        leading: CircleAvatar(
          radius: 28,
          backgroundImage: AssetImage(item.imagePath),
        ),
        title: Text(
          item.title,
          style: TextStyle(color: Colors.white70, fontSize: 20),
        ),
        subtitle: Text(
          item.date,
          style: TextStyle(color: Colors.grey, fontSize: 15),
        ),
      ),
    );
  }

  showAlertDialog(
    BuildContext context,
  ) {
    // Init
    AlertDialog dialog = AlertDialog(
      actionsPadding: EdgeInsets.all(15),
      titlePadding: EdgeInsets.all(15),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      title: Text("Your Child grade is 22"),
      actions: [
        IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
              size: 35,
            ),
            onPressed: () {
              setState(() {
                isMessageDeleted = true;
              });
              print('first' + isMessageDeleted.toString());
              Navigator.pop(context);
              // setState(() {
              //   isMessageDeleted=false;
              // });
              // print('second'+isMessageDeleted.toString());
            }),
        TextButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.pop(context);
            }),
      ],
    );

    // Show the dialog (showDialog() => showGeneralDialog())
    showGeneralDialog(
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Wrap();
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return Transform(
          transform: Matrix4.translationValues(
            0.0,
            (1.0 - Curves.easeInOut.transform(anim1.value)) * 400,
            0.0,
          ),
          child: dialog,
        );
      },
      transitionDuration: Duration(milliseconds: 400),
    );
  }
}
