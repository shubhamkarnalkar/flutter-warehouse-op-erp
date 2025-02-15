import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warehouse_erp/controllers/settings_controller.dart';
import 'package:warehouse_erp/models/hive/settings/settings_adapter.dart';
import 'package:warehouse_erp/utils/localization/app_localization.dart';
import 'package:warehouse_erp/utils/localization/lang_text_constants.dart';
import 'package:warehouse_erp/utils/router/router_imports.dart';
import 'package:warehouse_erp/widgets/custom_widgets.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsControllerProvider);
    final settingsController = ref.watch(settingsControllerProvider.notifier);
    return SafeArea(
      top: true,
      child: MediaQuery(
        data: const MediaQueryData().copyWith(
          textScaler: TextScaler.linear(
            ref.watch(settingsControllerProvider).textScaleFactor,
          ),
        ),
        child: Scaffold(
          appBar: CustomAppBar(
            title: LangTextConstants.lbl_settings.tr,
            hasBackButton: false,
          ),
          body: Column(
            children: [
              SwitchListTile(
                value: settings.isDark,
                onChanged: (value) => settingsController.switchThemeMode(),
                title: Text(LangTextConstants.lbl_dark_theme.tr),
              ),
              const TileForTextScale(),
              ColorSelectorWidget(
                  settingsController: settingsController, settings: settings),
              LanguageSelectorWidget(
                settings: settings,
                settingsController: settingsController,
              ),
              const TileForUrlSelect(),
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageSelectorWidget extends ConsumerWidget {
  const LanguageSelectorWidget({
    super.key,
    required this.settingsController,
    required this.settings,
  });

  final SettingsController settingsController;
  final SettingsModel settings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final langNow = ref.watch(currentLangProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            LangTextConstants.lbl_language.tr,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Row(
            children: [
              Text('${langNow.flag} ${langNow.name}'),
              LanguageChangeButton(
                handleLanguageSelect: settingsController.setLanguage,
                localeSelected: langNow.languageCode,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ColorSelectorWidget extends ConsumerWidget {
  const ColorSelectorWidget({
    super.key,
    required this.settingsController,
    required this.settings,
  });

  final SettingsController settingsController;
  final SettingsModel settings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            LangTextConstants.lbl_color.tr,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          ColorSeedButton(
            handleColorSelect: settingsController.handleColorSelect,
            colorSelected: ref.watch(colorProvider),
          ),
        ],
      ),
    );
  }
}

class TileForTextScale extends ConsumerWidget {
  const TileForTextScale({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsControllerProvider);
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            LangTextConstants.lbl_text_scale.tr,
            style: theme.textTheme.bodyLarge,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () async => ref
                    .read(settingsControllerProvider.notifier)
                    .decreaseGlobalTextSize(),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20.0), // Adjust the radius as needed
                    ),
                  ),
                ),
                child: Text(
                  '-',
                  style: theme.textTheme.headlineSmall,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Text(settings.textScaleFactor.toString().substring(0, 3)),
              ),
              ElevatedButton(
                onPressed: () async => ref
                    .read(settingsControllerProvider.notifier)
                    .increaseGlobalTextSize(),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20.0), // Adjust the radius as needed
                    ),
                  ),
                ),
                child: Text(
                  '+',
                  style: theme.textTheme.headlineSmall,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TileForUrlSelect extends ConsumerWidget {
  const TileForUrlSelect({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => context.goNamed(RouteConstants.setUrlsPage),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 17),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              LangTextConstants.lbl_set_urls.tr,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_right_rounded),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
