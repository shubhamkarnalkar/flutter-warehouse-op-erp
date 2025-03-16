import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:warehouse_erp/controllers/settings_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../app.dart';
import 'ar/ar_translations.dart';
import 'en_us/en_us_translations.dart';
import 'german/de_german_trans.dart';
import 'hi/hi_in_translations.dart';
import 'ja_ja_translations.dart/ja_ja_translations.dart';
import 'zhCN/zh_cn_trans.dart';

final currentLangProvider = StateProvider<Language>((ref) {
  final curLoc = ref.watch(settingsControllerProvider).locale;
  return Language.languageList().where((element) => element.id == curLoc).first;
});

class Language {
  final int id;
  final String flag;
  final String name;
  final Locale languageCode;

  Language(this.id, this.flag, this.name, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(0, "🇺🇸", "English", const Locale("en")),
      Language(1, "🇸🇦", "اَلْعَرَبِيَّةُ", const Locale("ar")),
      Language(2, "🇮🇳", "हिंदी", const Locale("hi")),
      Language(3, "🇯🇵", "日本", const Locale("ja")),
      Language(4, "🇨🇳", "中文", const Locale("zh")), // Chinese (Simplified)
      Language(5, "🇩🇪", "Deutsch", const Locale("de")), // German
      // Language(6, "🇫🇷", "Français", const Locale("fr")), // French
      // Language(7, "🇪🇸", "Español", const Locale("es")), // Spanish
      // Language(8, "🇮🇹", "Italiano", const Locale("it")), // Italian
      // Language(9, "🇷🇺", "Русский", const Locale("ru")), // Russian
      // Language(10, "🇰🇷", "한국어", const Locale("ko")), // Korean
      // Language(11, "🇵🇹", "Português", const Locale("pt")), // Portuguese
      // Language(12, "🇷🇴", "Română", const Locale("ro")), // Romanian
      // Language(13, "🇷🇸", "Српски", const Locale("sr")), // Serbian
    ];
  }
}

extension LocalizationExtension on String {
  String get tr => AppLocalization.of().getString(this);
}

// ignore_for_file: must_be_immutable
class AppLocalization {
  AppLocalization(this.locale);

  Locale locale;

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': enUs,
    'ja': ja,
    'ar': arAR,
    'hi': hiIn,
    'zh': zhCN,
    'de': deDE,
  };

  static AppLocalization of() {
    return Localizations.of<AppLocalization>(
        scaffoldMessengerKey.currentContext!, AppLocalization)!;
  }

  static List<String> languages() => _localizedValues.keys.toList();
  String getString(String text) =>
      _localizedValues[locale.languageCode]![text] ?? text;
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppLocalization.languages().contains(locale.languageCode);
//Returning a SynchronousFuture here because an async "load" operation
//cause an async "load" operation
  @override
  Future<AppLocalization> load(Locale locale) {
    return SynchronousFuture<AppLocalization>(AppLocalization(locale));
  }

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;
}
