import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controllers/notifications_controller.dart';
import 'package:graduation_project/models/notification_model.dart';
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
                confirmDismiss:(DismissDirection direction) async {
                return await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    title: const Text("Confirm"),
                    content: const Text("Are you sure you wish to delete this message?"),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text("DELETE",style: TextStyle(color: Colors.red),)
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text("CANCEL"),
                      ),
                    ],
                  );
                },
              );
            },
                direction: DismissDirection.horizontal,
                onDismissed: (direction) {

                  if (controller.isDeleted.value) {
                    items.removeAt(index);
                    Get.snackbar('Message', 'is deleted',
                        backgroundColor: Color(0xff090A4A),
                        snackStyle: SnackStyle.FLOATING,
                        isDismissible: true,
                        barBlur: 10,
                        colorText: Colors.red,
                        dismissDirection: DismissDirection.horizontal);
                  }
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
}
