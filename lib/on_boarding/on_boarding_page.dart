import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        title: 'ساعد أطفالك',
        image: 'assets/images/on_boarding_3.png',
        body:
            'المكان المميز لجعل أطفالك يمرحون مع التعلم.'),
    BoardingModel(
        title: 'تعلم بجد!',
        image: 'assets/images/on_boarding_2.png',
        body: 'ساعد أطفالك في إطلاق سراح خيالهم ليتغلبوا على صعوبات التعلم.'),
    BoardingModel(
        title: 'مهارة التدريس',
        image: 'assets/images/on_boarding_1.png',
        body: 'اختبر أطفالك لتتأكد من سبب تأخرهم عن زمائلهم في الدراسة'),
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
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(.0),
                child: TextButton(
                    onPressed: () {
                      submit();
                    },

                    child: const Text('تخطي',style: TextStyle(color: Color(0xff4EB783),fontSize: 15,decoration: TextDecoration.none),)),
              ),
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
                        activeDotColor:  Color(0xff4EB783),
                        expansionFactor: 4.0,
                        dotWidth: 10.0,
                        spacing: 5.0),
                  ),
                  //to position the last element in the last space
                  const Spacer(),
                  FloatingActionButton(
                    backgroundColor: const Color(0xff4EB783),
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
                    child: const Icon(Icons.arrow_forward_ios,color: Colors.white,),
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
  mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.height/2,
            decoration: BoxDecoration(
          image:  DecorationImage(
            fit: BoxFit.fill,
              image: AssetImage(
            model.image,
          ),

          ),
        )),
        Text(
          model.title,
          style:  TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0.sp,
              color: Colors. black),
        ),

        Text(
          model.body,
          style:  TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12.0.sp,
              color: Colors.black),
        ),

      ],
    );
