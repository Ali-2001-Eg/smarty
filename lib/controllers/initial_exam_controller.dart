import 'package:get/get.dart';

class InitialExamController extends GetxController{
  String? selectedAnswer;
  void selectedAnswers(String? answer) {
   selectedAnswer = answer;
    update();
  }
}