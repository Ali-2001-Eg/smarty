import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/shared/constatns/locale_strings.dart';

import 'package:graduation_project/shared/route_helper/route_helper.dart';
import '../shared/cache_helper/cache_helper.dart';
import '../shared/widgets/bottom_wave_clipper.dart';
import '../shared/widgets/custom_clipper.dart';
import '../shared/widgets/my_drawer.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const MyDrawer(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            //get started
            ClipPath(
              clipper: WaveHomeClipper(),
              child: Container(
                padding: EdgeInsets.only(bottom: 80.h),
                decoration: const BoxDecoration(
                color:  Color(0xffFEA633),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/stylings.png',
                    )
                  )
                ),
                child: Column(
                  children: [
                    //logo and drawer
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 20.h, left: 20.w),
                          alignment: Alignment.topLeft,
                          child: CircleAvatar(
                            radius: 30.r,
                            backgroundImage:
                                const AssetImage('assets/images/logo.png'),
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Text('Smarty',
                            style:
                                Theme.of(context).textTheme.headline5?.copyWith(
                                      color: Colors.white,
                                    )),
                        Expanded(child: Container()),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      appGetStartedFirstEn.tr,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: Colors.white70),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: 40.w, left: 40.w, top: 20.h, bottom: 30.h),
                      child: Text(
                        appGetStartedSecondEn.tr,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: Colors.white70),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    //background image and starting button
                    Stack(alignment: Alignment.center, children: [
                      Image.asset(
                        'assets/images/background.png',
                        fit: BoxFit.fitWidth,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: ElevatedButton(
                          onPressed: () {
                            CacheHelper.saveData(key: 'getStarted', value: true)
                                .then((value) => Get.offAllNamed(
                                    RouteHelper.getHomeLayout()));
                            // print(CacheHelper.sharedPreferences.get('getStarted'));
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10.h),
                          ),
                          child: Text(
                            appGetStartedButtonEn.tr,
                            style:
                                Theme.of(context).textTheme.subtitle1?.copyWith(
                                      color: Colors.white70,
                                    ),
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
            //games
            Container(
              alignment: Alignment.center,
              height: 400.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      appGamesEn.tr,
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                  Container(
                    height: 250.h,
                    margin: EdgeInsets.only(right: 25.w, left: 25.w),
                    child: CarouselSlider.builder(
                      itemCount: 4,
                      itemBuilder: (context, index, realIndex) =>
                          GestureDetector(
                        onTap: () => null,
                        child: Container(
                          margin: EdgeInsets.only(right: 20.r, top: 15.h),
                          height: 220.h,
                          width: width - 20,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/images/games.png',
                              ),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(30.r),
                            color:
                                index.isEven ? Colors.lightBlue : Colors.purple,
                          ),
                        ),
                      ),
                      options: CarouselOptions(
                        viewportFraction: 1,
                        autoPlay: true,
                        reverse: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //chat
            Container(
              alignment: Alignment.center,
              height: 400.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      appChatEn.tr,
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                  Container(
                    height: 250.h,
                    margin: EdgeInsets.only(right: 25.w, left: 25.w),
                    child: CarouselSlider.builder(
                      itemCount: 4,
                      itemBuilder: (context, index, realIndex) =>
                          GestureDetector(
                            onTap: () => null,
                            child: Container(
                              margin: EdgeInsets.only(right: 20.r, top: 15.h),
                              height: 220.h,
                              width: width - 20,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage(
                                    'assets/images/chat.png',
                                  ),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(30.r),
                                color:
                                index.isEven ? Colors.lightBlue : Colors.purple,
                              ),
                            ),
                          ),
                      options: CarouselOptions(
                        viewportFraction: 1,
                        autoPlay: true,
                        reverse: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //content
            Container(
              alignment: Alignment.center,
              height: 400.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      appContentEn.tr,
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                  Container(
                    height: 250.h,
                    margin: EdgeInsets.only(right: 25.w, left: 25.w),
                    child: CarouselSlider.builder(
                      itemCount: 2,
                      itemBuilder: (context, index, realIndex) =>
                          GestureDetector(
                            onTap: () => null,
                            child: Container(
                              margin: EdgeInsets.only(right: 20.r, top: 15.h),
                              height: 220.h,
                              width: width - 20,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage(
                                    'assets/images/content.png',
                                  ),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(30.r),
                                color:
                                index.isEven ? Colors.lightBlue : Colors.purple,
                              ),
                            ),
                          ),
                      options: CarouselOptions(
                        viewportFraction: 1,
                        autoPlay: true,
                        reverse: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),


            //exams
            Container(
              alignment: Alignment.center,
              height: 400.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      appExamEn.tr,
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                  Container(
                    height: 250.h,
                    margin: EdgeInsets.only(right: 25.w, left: 25.w),
                    child: CarouselSlider.builder(
                      itemCount: 2,
                      itemBuilder: (context, index, realIndex) =>
                          GestureDetector(
                            onTap: () => null,
                            child: Container(
                              margin: EdgeInsets.only(right: 20.r, top: 15.h),
                              height: 220.h,
                              width: width - 20,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage(
                                    'assets/images/exams.png',
                                  ),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(30.r),
                                color:
                                index.isEven ? Colors.lightBlue : Colors.purple,
                              ),
                            ),
                          ),
                      options: CarouselOptions(
                        viewportFraction: 1,
                        autoPlay: true,
                        reverse: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
