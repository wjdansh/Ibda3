import 'dart:ui';
import 'package:get/get.dart';
import '../lang/ar_SY.dart';
import '../lang/en_US.dart';

class LocalizationService extends Translations {
  static final locale = Locale('en', 'US');
  static final fallbackLocale = Locale('ar', 'SY');

  final langs = ['Arabic', 'English'];

  final locales = [
    Locale('ar', 'SY'),
    Locale('en', 'US'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'ar_SY': arSY,
        'en_US': enUS,
      };

  void change(String lang) {
    final locale = _getLocale(lang);
    Get.updateLocale(locale);
  }

  Locale _getLocale(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }
}
