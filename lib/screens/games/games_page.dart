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

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xffF7F9F6),
        appBar: AppBar(
          bottom: TabBar(tabs: [
            Tab(
              child: Text('Math Games'),
              icon: Icon(Icons.add),
            ),
            Tab(
              child: Text('Language Games'),
              icon: Icon(Icons.menu_book),
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit)
          ],
        ),
      ),
    );
  }

  Widget buildGameItemTile(
    GameItems item,
    BuildContext context,
  ) {
    return InkWell(
      onTap: () {
        Get.to(() => WebViewScreen(url: item.gameUrl!));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xff1A3993).withAlpha(100),
        ),
        margin: EdgeInsets.only(top: 20.h, bottom: 20.h, right: 20.w),
        padding: EdgeInsets.only(left: 20.h),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20.h, right: 15.w),
              padding: EdgeInsets.only(left: 15.w, top: 20.h, bottom: 5.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(
                    item.title!,
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
                          item.imagePath!,
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

  Widget _listTile(String label, BuildContext context, IconData icon) => Stack(
        children: [
          const Positioned.fill(child: SizedBox(height: 250)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 200.h,
              width: 250.w,
              decoration: BoxDecoration(
                color: const Color(0xff6CCDCA).withOpacity(.85),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 5,
            child: Container(
              height: 60.h,
              width: 240.w,
              margin: EdgeInsets.only(bottom: 5.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  label,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                ),
              ),
            ),
          ),
          Positioned(
              top: 40,
              right: MediaQuery.of(context).size.width / 4,
              child: Icon(
                icon,
                color: Colors.grey[800],
                size: 60.h,
              )),
        ],
      );
}
