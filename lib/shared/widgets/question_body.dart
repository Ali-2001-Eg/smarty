import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controllers/initial_exam_controller.dart';

import 'answer_card.dart';

class QuestionBody extends GetView<InitialExamController> {
  final String question;
  final List<Map<String, dynamic>> answer;
  const QuestionBody({Key? key, required this.question, required this.answer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter,children: [
      Padding(
        padding:  EdgeInsets.only(top: Get.height/5),
        child: Column(
          children: [
            Text(
              question,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 25.h),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: answer.length,
                separatorBuilder: (context, index) => SizedBox(
                  height: 10.h,
                ),
                itemBuilder: (context, index) {
                  final answers = answer[index];
                  return AnswerCard(
                    answer: '${answers['identifier']}. ${answers['answer']}',
                    onTap: () {
                      controller.selectedAnswers(answers['identifier']);
                    },
                    isSelected: false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      ColoredBox(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Row(
            children: [
              Visibility(
                visible: true,
                child: Container(
                  width: 55.w,
                  height: 55.w,
                  decoration: BoxDecoration(
                    color: const Color(0xff090A4A),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              Expanded(
                child: Visibility(
                  visible: true,
                  child: SizedBox(
                    height: 55.h,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xff090A4A),
                        ),
                        width: double.infinity,
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Center(
                            child: Text(
                              'Next',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
