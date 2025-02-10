import 'package:flutter/material.dart';
import 'package:warehouse_erp/utils/localization/app_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LanguageChangeButton extends ConsumerWidget {
  const LanguageChangeButton({
    super.key,
    required this.handleLanguageSelect,
    required this.localeSelected,
  });

  final void Function(int) handleLanguageSelect;
  final Locale localeSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final langs = Language.languageList();
    return PopupMenuButton(
      icon: const Icon(
        Icons.language,
      ),
      tooltip: 'Select a language',
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      itemBuilder: (context) {
        return List.generate(langs.length, (index) {
          final currentLang = langs[index];

          return PopupMenuItem(
            value: index,
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(currentLang.flag),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(currentLang.name),
                ),
              ],
            ),
          );
        });
      },
      onSelected: handleLanguageSelect,
    );
  }
}
