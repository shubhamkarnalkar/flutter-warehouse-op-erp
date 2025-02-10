import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warehouse_erp/controllers/settings_controller.dart';
import 'utils/utils.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  Widget build(BuildContext context) {
    final settingsValues = ref.watch(settingsControllerProvider);
    final ThemeMode themeMode =
        settingsValues.isDark == true ? ThemeMode.dark : ThemeMode.light;
    final lng = ref.watch(currentLangProvider).languageCode;
    return MaterialApp.router(
      theme: ref.watch(lightThemeProvider),
      darkTheme: ref.watch(darkThemeProvider),
      routerConfig: router,
      themeMode: themeMode,
      scaffoldMessengerKey: scaffoldMessengerKey,
      locale: lng,
      localizationsDelegates: const [
        AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales:
          Language.languageList().map((e) => e.languageCode).toList(),
    );
  }
}
