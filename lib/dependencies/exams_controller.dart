import 'package:get/get.dart';
import 'package:graduation_project/controllers/final_exam_controller.dart';
import 'package:graduation_project/controllers/initial_exam_controller.dart';

class ExamsBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => FinalExamController());
    Get.lazyPut(() => InitialExamController());
  }
}