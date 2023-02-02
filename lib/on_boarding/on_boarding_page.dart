import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/shared/cache_helper/cache_helper.dart';
import 'package:graduation_project/shared/route_helper/route_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

//data model to be listed in the screen
class BoardingModel {
  final String title;
  final String image;
  final String body;

  BoardingModel({required this.title, required this.image, required this.body});
}

bool isLast = false;

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  //to catch the page while navigation
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
        title: 'Our Kindergarten Anniversary',
        image: 'assets/images/on_boarding_1.png',
        body:
            'The perfect class for your child with the best staff and best teachers.'),
    BoardingModel(
        title: 'Drawing and Painting Lessons',
        image: 'assets/images/on_boarding_2.png',
        body: 'we provided sections to improve Our Student Imagination and Creativity'),
    BoardingModel(
        title: 'Determine Student Learning Difficulty',
        image: 'assets/images/on_boarding_3.png',
        body: 'Our Exams Walks Through Scientific laws and standards'),
  ];

  void submit() {
    //to navigate with this key
    CacheHelper.saveData(key: 'onBoarding', value: true)
        .then((value) => Get.offAllNamed(RouteHelper.getSignInPage()));
    print(CacheHelper.sharedPreferences.get('onBoarding'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/spalshLearn.png'),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    submit();
                  },
                  child: const Text('SKIP')),
              Expanded(
                child: PageView.builder(
                  itemBuilder: (context, index) =>
                      buildBoardingItem(boarding[index],context),
                  itemCount: boarding.length,
                  controller: boardController,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (index) {
                    if (index == boarding.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                    //the page controller
                    controller: boardController,
                    count: boarding.length,
                    effect: const ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        dotHeight: 10.0,
                        activeDotColor: Color(0xff090A4A),
                        expansionFactor: 4.0,
                        dotWidth: 10.0,
                        spacing: 5.0),
                  ),
                  //to position the last element in the last space
                  const Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      if (isLast == true) {
                        submit();
                      } else {
                        boardController.nextPage(
                          duration: const Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    child: const Icon(Icons.arrow_forward_ios),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildBoardingItem(BoardingModel model,context) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
            image:  DecorationImage(
                image: AssetImage(
              model.image,
            ),

            ),
          )),
        ),
        Text(
          model.title,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              color: Colors.white70),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          model.body,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
              color: Colors.white70),
        ),
        const SizedBox(
          height: 30.0,
        ),
      ],
    );
