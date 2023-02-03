import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.all(10),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //image
            const CircleAvatar(
              radius: 30,
              backgroundImage:  AssetImage('assets/images/logo.png'),
            ),
            SizedBox(height: 30,),
            //title
            Text(
              'Your Child grade is 22',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Colors.white70),
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: ()=>Get.back(),
                  label: Text('Remove this notifications'),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.red,
                    size: 30,
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
