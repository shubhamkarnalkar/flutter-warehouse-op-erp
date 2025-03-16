import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:warehouse_erp/models/hive/settings/settings_adapter.dart';
import 'package:warehouse_erp/utils/utils.dart';

import '../models/app_model.dart';

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

  String getURL(int indx) {
    switch (indx) {
      case 0:
        return state.baseUrl;
      case 1:
        return state.inventoryUrl;
      case 2:
        return state.materialsUrl;
      case 3:
        return state.signInUrl;
      default:
        return '';
    }
  }

  Future<void> setUrl(UrlsApp url, String value) async {
    switch (url) {
      case UrlsApp.base:
        await _settingsBox.put(1, state.copyWith(baseUrl: value));
        state = state.copyWith(baseUrl: value);
        break;
      case UrlsApp.inventory:
        await _settingsBox.put(1, state.copyWith(inventoryUrl: value));
        state = state.copyWith(inventoryUrl: value);
        break;
      case UrlsApp.materials:
        await _settingsBox.put(1, state.copyWith(materialsUrl: value));
        state = state.copyWith(materialsUrl: value);
        break;
      case UrlsApp.signIn:
        await _settingsBox.put(1, state.copyWith(signInUrl: value));
        state = state.copyWith(signInUrl: value);
        break;

      default:
    }
  }

  Future<void> setAuth(String usrname, String pwd, String accTok) async {
    await _settingsBox.put(1,
        state.copyWith(username: usrname, password: pwd, accessToken: accTok));
    state =
        state.copyWith(password: pwd, username: usrname, accessToken: accTok);
  }
}
