import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/shared/constatns/locale_strings.dart';
import '../../models/games_model.dart';
import '../../shared/widgets/game_item.dart';

import '../../shared/widgets/web_view_screen.dart';
class GamesPage extends StatelessWidget {
  const GamesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //loading model
    List<GameItems> mathItems = List.of(mathGames);
    List<GameItems> langItems = List.of(langGames);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        extendBody: true,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: MediaQuery.of(context).size.height / 120,
          backgroundColor: Colors.grey.shade50,
          bottom: TabBar(indicatorColor: const Color(0xff090A4A), tabs: [
            Tab(
              child: Text(
                mathGamesEn.tr,
                style: TextStyle(
                    color: const Color(0xff090A4A),
                    letterSpacing: 0,
                    fontSize: 15.sp),
              ),
              icon: const Icon(Icons.add, color: Color(0xff090A4A)),
            ),
            Tab(
              child: Text(
                langGamesEn.tr,
                style: TextStyle(
                    color: const Color(0xff090A4A),
                    letterSpacing: 0,
                    fontSize: 15.sp),
              ),
              icon: const Icon(Icons.menu_book, color: Color(0xff090A4A)),
            ),
          ]),
        ),
        body: MediaQuery.removePadding(
          context: context,
          removeBottom: true,
          child: TabBarView(
            physics: const BouncingScrollPhysics(),
            children: [

              ListView.builder(
                padding: EdgeInsets.only(bottom: 50.h),
                itemCount: mathItems.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return buildGameItemTile(mathItems[index], context);
                },
              ),
              ListView.builder(
                padding: EdgeInsets.only(bottom: 50.h),
                itemCount: langItems.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return buildGameItemTile(langItems[index], context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGameItemTile(
    GameItems item,
    BuildContext context,
  ) {
    return InkWell(
        onTap: () async {
          // Get.to(() => WebViewScreen(url: item.gameUrl!));

        },
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15.w, top: 20.h, bottom: 5.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(
                    item.title!,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: const Color(0xff090A4A),
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20.w, top: 10.h),
                    height: 200.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          item.imagePath!,
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      // color: Colors.purple,
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }


}
