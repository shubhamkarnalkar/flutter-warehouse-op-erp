import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:warehouse_erp/models/hive/settings/settings_adapter.dart';
import 'package:warehouse_erp/utils/utils.dart';

final settingsBoxProvider = Provider((ref) {
  return Hive.box<SettingsModel>(HiveConstants.settingsBox);
});

final settingsControllerProvider =
    StateNotifierProvider<SettingsController, SettingsModel>((ref) {
  return SettingsController(
    ref: ref,
    settingsBox: ref.read(settingsBoxProvider),
  );
});

class SettingsController extends StateNotifier<SettingsModel> {
  final Box<SettingsModel> _settingsBox;
  // ignore: unused_field
  final Ref _ref;
  SettingsController({
    required Box<SettingsModel> settingsBox,
    required Ref ref,
  })  : _settingsBox = settingsBox,
        _ref = ref,
        super(
          SettingsModel(),
        ) {
    state = _getSetting();
  }

  SettingsModel _getSetting() {
    return _settingsBox.values.toList().isNotEmpty
        ? _settingsBox.values.toList().first
        : SettingsModel();
  }

  Future<void> increaseGlobalTextSize() async {
    double oldFact = state.textScaleFactor * 10;
    double newfactor = (oldFact += 1).roundToDouble() / 10;
    if (newfactor < 2.0) {
      await _settingsBox.put(1, state.copyWith(textScaleFactor: newfactor));
      state = _getSetting();
    }
  }

  Future<void> decreaseGlobalTextSize() async {
    double oldFact2 = state.textScaleFactor * 10;
    double newfactor2 = (oldFact2 -= 1).roundToDouble() / 10;
    if (newfactor2 >= 1.0) {
      try {
        await _settingsBox.put(1, state.copyWith(textScaleFactor: newfactor2));
      } catch (e) {
        debugPrint(e.toString());
      }

      state = _getSetting();
    }
  }

  Future<void> switchThemeMode() async {
    await _settingsBox.put(1, state.copyWith(isDark: !state.isDark));
    state = state.copyWith(isDark: !state.isDark);
  }

  Future<void> handleColorSelect(int value) async {
    await _settingsBox.put(
      1,
      state.copyWith(
        seedColorId: value,
      ),
    );
    state = state.copyWith(
      seedColorId: value,
    );
  }

  Future<void> setLanguage(int lang) async {
    try {
      final l = Language.languageList().firstWhere((i) => i.id == lang).id;
      await _settingsBox.put(1, state.copyWith(locale: l));
      state = state.copyWith(locale: l);
    } catch (e) {
      //TODO show dialogue to let the user know that the int passed is not valid
    }
  }
}
