import 'package:flutter/material.dart';
class NotificationsItem extends StatelessWidget {
  final String imagePath;
  final String date;
  final String title;
  const NotificationsItem({Key? key,required this.imagePath,required this.date,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15,bottom: 20,right: 15),
      padding: const EdgeInsets.only(left: 15,),
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xff1A3993).withAlpha(100),
      ),
      child: Row(
        children: [
          //notifications image waiting from api
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly  ,
            children: [
              //notifications title
              Text(title,style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.white70),),
              //date
              Text(date,style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.grey))
            ],
          ),

        ],
      ),
    );
  }
}
