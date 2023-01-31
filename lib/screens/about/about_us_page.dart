import 'package:flutter/material.dart';

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
      drawer: myDrawer(context, fromGetStarted: false),
      appBar: AppBar(
        backgroundColor: const Color(0xff1A3993),
        centerTitle: true,
        title: Text(
          'Smarty',
          style: Theme.of(context)
              .textTheme
              .headline3
              ?.copyWith(color: const Color(0xffFEA633)),
        ),
        actions: const [
          // IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/images/logo.png'),
          )
        ],
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/spalshLearn.png'),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 30),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Play as you learn',
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        ?.copyWith(color: Colors.white70),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Our philosophy is learning through play as we offer a stimulating environment for children.',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: const Color(0xffFEA633)),
                  ),
                  _customRotationWithAnimation(
                      'assets/images/about_1.png', 'Online Access'),
                  _customRotationWithAnimation(
                      'assets/images/about_2.png', 'Full Day Sessions'),
                  _customRotationWithAnimation(
                      'assets/images/about_3.png', 'Friendly Place'),
                  _customRotationWithAnimation(
                      'assets/images/about_4.png', 'Varied Games'),
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      'Our Core values',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(color: const Color(0xffFEA633), fontSize: 30),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  _coreValue('assets/images/about_5.png', 'Learning & Fun',
                      'Prissy expectant involuntarily limpet until cobra less dear so overabundant contagio'),
                  const SizedBox(
                    height: 20,
                  ),
                  _coreValue(
                      'assets/images/about_6.png',
                      'Direct Communications',
                      'Prissy expectant involuntarily limpet until cobra less dear so overabundant contagio'),
                  const SizedBox(
                    height: 20,
                  ),
                  _coreValue(
                      'assets/images/about_7.png',
                      'Efficiency and Effectiveness',
                      'Prissy expectant involuntarily limpet until cobra less dear so overabundant contagio'),
                  const SizedBox(
                    height: 20,
                  ),
                  _coreValue('assets/images/about_8.png', 'Cute Environment',
                      'Prissy expectant involuntarily limpet until cobra less dear so overabundant contagio'),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      'Certifications',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(color: const Color(0xffFEA633), fontSize: 30),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //certifications
                  Container(
                    height: 250,
                    width: width-20,
                    margin: const EdgeInsets.only(right: 25, ),
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 4,
                      controller: PageController(viewportFraction: 0.88),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 20, top: 15),
                          height: 220,
                          width: width - 20,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/images/certification.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(30),
                            color:
                                index.isEven ? Colors.lightBlue : Colors.purple,
                          ),
                        );
                      },
                    ),
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
        color: const Color(0xff1A3993).withAlpha(100),
      ),
      margin: const EdgeInsets.only(top: 20, bottom: 20, right: 20),
      padding: const EdgeInsets.only(left: 20),
      height: 200,
      child: Row(
        children: [
          RotationTransition(
            turns: _animation,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(path),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(color: Colors.white70, fontSize: 26),
          ),
        ],
      ),
    );
  }

  Widget _coreValue(String imgPath, String headText, String subHeadText) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xff1A3993).withAlpha(100),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 20, top: 15),
            height: 150,
            width: width - 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  imgPath,
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(30),
              color: Colors.purple,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  headText,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(color: Colors.white70, fontSize: 22),
                ),
                const Divider(
                  color: Color(0xffFEA633),
                  endIndent: 120,
                  thickness: 2.5,
                ),
                Text(subHeadText,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(color: Colors.white70)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
