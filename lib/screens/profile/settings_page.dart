import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/shared/constatns/locale_strings.dart';

import '../../controllers/language_controller.dart';
import '../../shared/constatns/app_strings.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<LanguageController>(LanguageController());
    return Scaffold(
      appBar: AppBar(
        title: Text(appSettingsEn.tr),
        centerTitle: true,
        leading: IconButton(onPressed: ()=>Get.back(),icon: Icon(Icons.arrow_back_ios)),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetBuilder<LanguageController>(
            builder: (langController) {
              return Center(
                child: Container(
                  width: 200.w,
                  padding: EdgeInsets.symmetric(
                      horizontal: 6.h, vertical: 2.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color(0xffFEA633), width: 2),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      onChanged: (value) {
                        langController.changeLanguage(value!);
                        Get.updateLocale(Locale(value));
                      },
                      value: langController.locale,
                      iconSize: 25.h,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey,
                      ),
                      items: [
                        DropdownMenuItem(
                          value: eng,
                          child: Text(
                            englishEn.tr,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
                                color: Colors.grey),
                          ),
                        ),
                        DropdownMenuItem(
                          value: arb,
                          child: Text(
                            arabicEn.tr,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
                                color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

        ],
      ),
    );
  }
}
