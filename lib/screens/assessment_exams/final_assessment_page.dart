import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:graduation_project/shared/constatns/locale_strings.dart';

import '../../shared/widgets/question_body.dart';

class FinalAssessmentPage extends StatelessWidget {
  const FinalAssessmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: const Color(0xff090A4A),
        centerTitle: true,
        title: Text(
          appFinalAssessmentEn.tr,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios)),
        automaticallyImplyLeading: false,
      ),
      body: const QuestionBody(question: '3+3', answer: [
        {
          'identifier': 'A',
          'answer': '4',
        },
        {
          'identifier': 'B',
          'answer': '0',
        },
        {
          'identifier': 'C',
          'answer': '8',
        },
        {
          'identifier': 'D',
          'answer': '9',
        },

      ]),
    );
  }
}
