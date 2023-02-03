import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/shared/widgets/web_view_screen.dart';

import '../../models/games_model.dart';
import '../../models/notification_model.dart';
import '../../shared/widgets/game_item.dart';
import '../../shared/widgets/notification_item.dart';

class GamesPage extends StatelessWidget {
  const GamesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //loading model
    List<GameItems> items = List.of(allGames);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/spalshLearn.png')),
        ),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            var item = items[index];
            return buildGameItemTile(item, context,);
          },
          itemCount: items.length,
          padding: const EdgeInsets.only(top: 15, left: 20),
        ),
      ),
    );
  }

  Widget buildGameItemTile(GameItems item, context,) {
    return InkWell(
      onTap: (){
        Get.to(WebViewScreen(url: item.url));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xff1A3993).withAlpha(100),
        ),
        margin: const EdgeInsets.only(top: 20, bottom: 20, right: 20),
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 20, right: 15),
              padding: const EdgeInsets.only(
                left: 15,
              ),
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xff1A3993).withAlpha(100),
              ),
              child: Column(
                children: [
                  Text(
                    item.title,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(color: Colors.white70),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20, top: 15),
                    height: 220,
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          item.imagePath,
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
