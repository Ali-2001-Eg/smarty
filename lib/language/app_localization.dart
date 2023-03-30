import 'package:get/get.dart';
import 'package:graduation_project/language/en.dart';

import '../shared/constatns/app_strings.dart';
import 'ar.dart';

class AppLocalization extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    eng:en,
    arb:ar,
  };

}