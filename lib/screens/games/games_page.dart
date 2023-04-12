import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff007EFF),
        image: DecorationImage(
            image: AssetImage(
              'assets/images/stylings.png',
            ),
            fit: BoxFit.cover),
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
        padding: EdgeInsets.only(left: 20.w),
      ),
    );
  }

  Widget buildGameItemTile(
    GameItems item,
    context,
  ) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20 ),
          color: const Color(0xff1A3993).withAlpha(100),
        ),
        margin: EdgeInsets.only(top: 20.h, bottom: 20.h, right: 20.w),
        padding: EdgeInsets.only(left: 20.h),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only( bottom: 20.h, right: 15.w),
              padding: EdgeInsets.only(
                left: 15.w,top: 20.h,bottom: 5.h
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20 ),
              ),
              child: Column(
                children: [
                  Text(
                    item.title,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: Colors.white),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20.w, top: 15.h),
                    height: 220.h,
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          item.imagePath,
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(30 ),
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
