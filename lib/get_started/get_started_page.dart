import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:graduation_project/shared/route_helper/route_helper.dart';
import '../shared/cache_helper/cache_helper.dart';
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
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/spalshLearn.png'),
            fit: BoxFit.cover,
          )),
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
                          Row(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.only(top: 20, left: 30),
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
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          Text(
                            'Right Place For Your Children ?!',
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(color: Colors.white70),
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
                                  ?.copyWith(color: Colors.white70),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          //background image and starting button
                          Stack(alignment: Alignment.center, children: [
                            Image.asset(
                              'assets/images/background.png',
                            ),
                            ElevatedButton(
                              onPressed: () {
                                CacheHelper.saveData(
                                      key: 'getStarted', value: true)
                                  .then((value) => Get.offAllNamed(
                                      RouteHelper.getHomeLayout()));
                                print(CacheHelper.sharedPreferences.get('getStarted'));

                              },

                              child: Text(
                                'Get Started',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(
                                      color: Colors.white70,
                                    ),
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                  //games
                  ClipPath(
                    clipper: WaveHomeClipper(),
                    child: Container(
                      alignment: Alignment.center,
                      height: 400,
                      padding: const EdgeInsets.only(bottom: 80),
                      // # + code => 0xff + code
                      color: Colors.white70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '      Games',
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(color: Colors.black87),
                          ),
                          Container(
                            height: 250,
                            margin: const EdgeInsets.only(right: 25, left: 25),
                            child: PageView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemCount: 4,
                              controller:
                                  PageController(viewportFraction: 0.88),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () =>
                                      Get.toNamed(RouteHelper.getGamesPage()),
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        right: 20, top: 15),
                                    height: 220,
                                    width: width - 20,
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(
                                        image: AssetImage(
                                          'assets/images/splashLearn2.png',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                      color: index.isEven
                                          ? Colors.lightBlue
                                          : Colors.purple,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                  //chat
                  ClipPath(
                    clipper: WaveHomeClipper(),
                    child: Container(
                      alignment: Alignment.center,
                      height: 400,
                      padding: const EdgeInsets.only(bottom: 80),
                      // # + code => 0xff + code
                      color: Colors.white70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '      Chat',
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(color: Colors.black87),
                          ),
                          Container(
                            height: 250,
                            margin: const EdgeInsets.only(right: 25, left: 25),
                            child: PageView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemCount: 4,
                              controller:
                                  PageController(viewportFraction: 0.88),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () =>
                                      Get.toNamed(RouteHelper.getChatPage()),
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        right: 20, top: 15),
                                    height: 220,
                                    width: width - 20,
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(
                                        image: AssetImage(
                                          'assets/images/chat.png',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                      color: index.isEven
                                          ? Colors.lightBlue
                                          : Colors.purple,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                  //content
                  ClipPath(
                    clipper: WaveHomeClipper(),
                    child: Container(
                      alignment: Alignment.center,
                      height: 400,
                      padding: const EdgeInsets.only(bottom: 80),
                      // # + code => 0xff + code
                      color: Colors.white70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '      Content',
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(color: Colors.black87),
                          ),
                          Container(
                            height: 250,
                            margin: const EdgeInsets.only(right: 25, left: 25),
                            child: PageView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemCount: 4,
                              controller:
                                  PageController(viewportFraction: 0.88),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () => Get.toNamed(
                                      RouteHelper.getEducationalContentPage()),
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        right: 20, top: 15),
                                    height: 220,
                                    width: width - 20,
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(
                                        image: AssetImage(
                                          'assets/images/content.png',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                      color: index.isEven
                                          ? Colors.lightBlue
                                          : Colors.purple,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                  //exams
                  ClipPath(
                    clipper: WaveHomeClipper(),
                    child: Container(
                      alignment: Alignment.center,
                      height: 400,
                      padding: const EdgeInsets.only(bottom: 80),
                      // # + code => 0xff + code
                      color: Colors.white70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '      Exams',
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(color: Colors.black87),
                          ),
                          Container(
                            height: 250,
                            margin: const EdgeInsets.only(right: 25, left: 25),
                            child: PageView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemCount: 2,
                              controller:
                                  PageController(viewportFraction: 0.88),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    index == 0
                                        ? Get.toNamed(RouteHelper
                                            .getInitialAssessmentPage())
                                        : Get.toNamed(RouteHelper
                                            .getFinalAssessmentPage());
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        right: 20, top: 15),
                                    height: 220,
                                    width: width - 20,
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(
                                        image: AssetImage(
                                          'assets/images/exams.png',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                      color: index.isEven
                                          ? Colors.lightBlue
                                          : Colors.purple,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
