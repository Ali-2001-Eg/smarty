import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/shared/route_helper/route_helper.dart';

import '../../shared/constatns/locale_strings.dart';
import '../../shared/widgets/my_drawer.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff090A4A),

          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        bottomOpacity: 0,
        title: Text(
          'Smarty',
          style: Theme.of(context)
              .textTheme
              .headline3
              ?.copyWith(color: const Color(0xff090A4A)),
        ),
        actions: const [
          // IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/logo.png'),
          )
        ],
      ),
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.only(
              top: 0.h,
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appPlayAsYouWantEn.tr,
                    // textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    appAboutUsSubTitleEn.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: const Color(0xff090A4A),
                        fontWeight: FontWeight.w500),
                  ),
                  _customRotationWithAnimation(
                      'assets/images/about_1.png', appOnlineAccessEn.tr),
                  _customRotationWithAnimation(
                      'assets/images/about_2.png', appFullDaySessionsEn.tr),
                  _customRotationWithAnimation(
                      'assets/images/about_3.png', appFriendlyPlaceEn.tr),
                  _customRotationWithAnimation(
                      'assets/images/about_4.png', appVariedGamesEn.tr),
                  Text(
                    appOurCoreValuesEn.tr,
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: const Color(0xffFEA633),
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  _coreValue(
                    'assets/images/about_5.png',
                    appLearningAndFunEn.tr,
                    appCoreSubTitleEn.tr,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  _coreValue(
                    'assets/images/about_6.png',
                    appDirectCommunicationsEn.tr,
                    appCoreSubTitleEn.tr,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  _coreValue(
                    'assets/images/about_7.png',
                    appEfficiencyEn.tr,
                    appCoreSubTitleEn.tr,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  _coreValue(
                    'assets/images/about_8.png',
                    appCuteEnvironmentEn.tr,
                    appCoreSubTitleEn.tr,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Widget _customRotationWithAnimation(String path, String text) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xff1A3993),
      ),
      margin: EdgeInsets.all(20.w),
      padding:
          EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 20.h),
      height: 150.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RotationTransition(
            turns: _animation,
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(path),
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(color: Colors.white, fontSize: 20.sp),
          ),
        ],
      ),
    );
  }

  Widget _coreValue(String imgPath, String headText, String subHeadText) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(5.w),
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xff1A3993),
      ),
      child: Row(
        children: [
          Container(
            height: 150.h,
            width: 120.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  imgPath,
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
              color: Colors.purple,
            ),
          ),
          const VerticalDivider(
            color: Colors.blue,
            thickness: 5,
          ),
          Expanded(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  headText,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      // decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationColor: const Color(0xffFEA633)),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(subHeadText,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
