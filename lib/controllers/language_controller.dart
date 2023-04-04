import 'package:get/get.dart';
import 'package:graduation_project/shared/cache_helper/cache_helper.dart';
import '../shared/constatns/app_strings.dart';

class LanguageController extends GetxController {
  var locale = eng;

  // to get locale as soon as the application launch
  @override
  void onInit() async {
    locale = await getLanguage;
    super.onInit();
  }

  Future<String> get getLanguage async {
    return await CacheHelper.getData(key: 'lang');
  }

  Future<void> saveLanguage(String lang) async {
    await CacheHelper.saveData(key: 'lang', value: lang);
  }

  void changeLanguage(String lang) {
    //if lang is already english return null
    if (locale == lang) {
      return;
    } else if (lang == arb) {
      locale = arb;
      saveLanguage(arb);
    } else {
      locale = eng;
      saveLanguage(eng);
    }
    update();
  }
}
