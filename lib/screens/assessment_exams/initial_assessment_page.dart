import 'package:flutter/material.dart';import"package:get/get.dart";

class InitialAssessmentPage extends StatelessWidget {
  const InitialAssessmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(      appBar: AppBar(
      leading: IconButton(onPressed: ()=>Get.back(),icon: Icon(Icons.arrow_back_ios)),
      automaticallyImplyLeading: false,
    ),

      body: Center(child: Text('Ali')),

    );
  }
}
