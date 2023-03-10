import 'package:flutter/material.dart';

import '../../shared/widgets/custom_appBar.dart';

class EducationalContentPage extends StatelessWidget {
  const EducationalContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/spalshLearn.png'),fit: BoxFit.cover),
        ),
        child: Center(
          child: Text('Content'),
        ),
      ),
    );
  }
}
