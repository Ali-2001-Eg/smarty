import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/shared/widgets/web_view_screen.dart';
import '../../models/games_model.dart';
import '../../shared/widgets/game_item.dart';

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
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            var item = items[index];
            return buildGameItemTile(
              item,
              context,
            );
          },
          itemCount: items.length,
          padding: const EdgeInsets.only(top: 15, left: 20),
        ),
      ),
    );
  }

  Widget buildGameItemTile(
    GameItems item,
    context,
  ) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            // return object of type Dialog
            return Center(
              child: AlertDialog(
                backgroundColor: Colors.grey,
                title: const Text("Choose Game Level"),
                content: Container(
                  height: 350,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                              onTap: ()  {

                                Get.to(() =>
                                    WebViewScreen(url: item.levelsUrl[0]));

                              },
                              child: _buildLevelDialog(
                                context,
                                '1',
                              )),
                          InkWell(
                              onTap: () {
                                Get.to(() =>
                                    WebViewScreen(url: item.levelsUrl[1]));
                              },
                              child: _buildLevelDialog(
                                context,
                                '2',
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                              onTap: () {
                                print(item.levelsUrl[2]);

                                Get.to(() =>
                                    WebViewScreen(url: item.levelsUrl[2]));
                              },
                              child: _buildLevelDialog(
                                context,
                                '3',
                              )),
                          InkWell(
                              onTap: () {
                                Get.to(() =>
                                    WebViewScreen(url: item.levelsUrl[3]));
                              },
                              child: _buildLevelDialog(
                                context,
                                '4',
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                              onTap: () {
                                Get.to(() =>
                                    WebViewScreen(url: item.levelsUrl[4]));
                              },
                              child: _buildLevelDialog(
                                context,
                                '5',
                              )),
                          InkWell(
                              onTap: () {
                                Get.to(() =>
                                    WebViewScreen(url: item.levelsUrl[5]));
                              },
                              child: _buildLevelDialog(
                                context,
                                '6',
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  // usually buttons at the bottom of the dialog
                  TextButton(
                    child: const Text(
                      "Close",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
      //game first page
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

  Widget _buildLevelDialog(
    BuildContext context,
    String level,
  ) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: const Color(0xff090A4A)),
          color: const Color(0xff09ABB3)),
      padding: const EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 20),
      margin: const EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 15),
      child: Text(
        level,
        style: Theme.of(context).textTheme.headline3?.copyWith(
              color: const Color(0xffFEA633),
            ),
      ),
    );
  }
}
