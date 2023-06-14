import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/screens/auth/sign_in_page.dart';

import 'package:graduation_project/shared/route_helper/route_helper.dart';
import '../screens/auth/sign_up_page.dart';
import '../screens/home/home_page.dart';
import '../shared/cache_helper/cache_helper.dart';
import '../shared/widgets/custom_clipper.dart';
import '../shared/widgets/my_drawer.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'assets/images/img_1.png',
      'assets/images/img_2.png',
      'assets/images/img_3.png',
      'assets/images/img_4.png',
      'assets/images/img_5.png',
      'assets/images/img_6.png',
      'assets/images/img_7.png',
      'assets/images/img_8.png',
      'assets/images/img_9.png',
    ];
    List<Widget> generateImageTiles(screenSize) {
      return images
          .map(
            (element) => ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                element,
                fit: BoxFit.cover,
              ),
            ),
          )
          .toList();
    }

    var screenSize = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(screenSize);
    final CarouselController _controller = CarouselController();
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    double width = MediaQuery.of(context).size.width;
    print(width);
    return Scaffold(
      key: _scaffoldKey,
      // backgroundColor: Colors.greenAccent,
      endDrawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                //get started
                ClipPath(
                  clipper: WaveHomeClipper(),
                  child: Container(
                    height: 750,
                    padding: const EdgeInsets.only(bottom: 80),
                    // # + code => 0xff + code
                    color: const Color(0xffFEA633),
                    child: Column(
                      children: [
                        //logo and drawer
                        width < 800
                            ? Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 30),
                                    alignment: Alignment.topLeft,
                                    child: const CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                          AssetImage('assets/images/logo.png'),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text('Smarty',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          ?.copyWith(
                                            color: Colors.white,
                                          )),
                                  Expanded(child: Container()),
                                  GestureDetector(
                                      onTap: () => _scaffoldKey.currentState!
                                          .openEndDrawer(),
                                      child: const Icon(Icons.menu, size: 40))
                                ],
                              )
                            : Padding(
                                padding: EdgeInsets.only(top: 15.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: width / 10,
                                    ),
                                    const CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                          AssetImage('assets/images/logo.png'),
                                    ),
                                    SizedBox(
                                      width: width / 10,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        'Home',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 5.sp,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width / 15,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed(
                                            RouteHelper.getAboutUsPage());
                                      },
                                      child: Text(
                                        'About Us',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 5.sp,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width / 15,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        'Programs',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 5.sp,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width / 15,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        'Classes',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 5.sp,
                                        ),
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    Padding(
                                      padding: EdgeInsets.only(right: 20.w),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Get.toNamed(
                                                RouteHelper.getSignInPage());
                                          },
                                          style: ElevatedButton.styleFrom(
                                            // backgroundColor: const Color(0xffFEA633),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w,
                                                vertical: 13.h),
                                            // side: const BorderSide(color: Colors.white,width: 2),
                                            elevation: 0,
                                          ),
                                          child: const Text('Login')),
                                    ),
                                  ],
                                ),
                              ),
                        const SizedBox(
                          height: 100,
                        ),
                        Text(
                          'Right Place For Your Children ?!',
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 40, left: 40, top: 20),
                          child: Text(
                            'Professional ways to discover Dyslexia and Dyscalculia and smart solutions for each treatments ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //background image and starting button
                        Flexible(
                          child: Stack(alignment: Alignment.center, children: [
                            Image.asset(
                              'assets/images/background.png',
                            ),
                            ElevatedButton(
                              onPressed: () {
                                goToWidget();
                              },
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(6.w)),
                              child: Text(
                                'Get Started',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),

                //games
                CarouselSlider(
                  options: CarouselOptions(
                    height:400.h,
                    enlargeCenterPage: true,
                    enableInfiniteScroll:true,
                    // initialPage: 0,
                    reverse: true,
                    autoPlay: true,
                    viewportFraction: 0.6,
                  ),
                  items: images.map((imageUrl) {
                    return InkWell(
                      onTap: () {

                        Get.toNamed(RouteHelper.getGamesPage());
                      },
                      child: Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0.w),
                            decoration: BoxDecoration(
                              // color: Colors.grey,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Image.asset(
                              imageUrl,
                              fit: BoxFit.fill,
                            ),
                          );
                        },
                      ),
                    );
                  }).toList(),
                ),

                //exams
                buildHomeCarousel(
                    context: context,
                    title: 'Initial and Final Exams',
                    items: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            'assets/images/exams.png',
                            fit: BoxFit.cover,
                          )),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            'assets/images/exams.png',
                            fit: BoxFit.cover,
                          )),
                    ])
              ],
            ),
          ],
        ),
      ),
    );
  }

  void goToWidget() {
    // var onBoarding = CacheHelper.getData(key: 'onBoarding');

    bool? role = CacheHelper.getBool('student');
    print('role is $role');
//to determine which widget will start the app

    if (role == null)
    {
      Get.offAllNamed(RouteHelper.getSignInPage());
    } else if (role) {
      Get.offAll(() => const HomeLayoutPage(isStudent: true));
    } else {
      Get.offAll(() => const HomeLayoutPage(isStudent: false));
    }
  }

  Container buildHomeCarousel({
    required BuildContext context,
    required String title,
    required List<Widget> items,
  }) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(bottom: 80),
      // # + code => 0xff + code
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: Colors.black87),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              scrollDirection: Axis.horizontal,
              autoPlay: false,
              height: 300,
              viewportFraction: 0.8,
              reverse: true,
            ),
            items: items,
          ),
        ],
      ),
    );
  }
}
