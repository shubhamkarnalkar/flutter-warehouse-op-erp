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
    state = _getSetting();
  }

  Future<void> handleColorSelect(int value) async {
    await _settingsBox.put(
      1,
      state.copyWith(
        seedColorId: value,
      ),
    );
    state = _getSetting();
  }

  Future<void> setLanguage(int lang) async {
    try {
      final l = Language.languageList().firstWhere((i) => i.id == lang).id;
      await _settingsBox.put(1, state.copyWith(locale: l));
      state = _getSetting();
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
        state = _getSetting();
        break;
      case UrlsApp.inventory:
        await _settingsBox.put(1, state.copyWith(inventoryUrl: value));
        state = _getSetting();
        break;
      case UrlsApp.materials:
        await _settingsBox.put(1, state.copyWith(materialsUrl: value));
        state = _getSetting();
        break;
      case UrlsApp.signIn:
        await _settingsBox.put(1, state.copyWith(signInUrl: value));
        state = _getSetting();
        break;

      default:
    }
  }

  Future<void> setAuth(
      String usrname, String pwd, String accTok, bool isLoggedin) async {
    await _settingsBox.put(
      1,
      state.copyWith(
          username: usrname,
          password: pwd,
          accessToken: accTok,
          isLoggedIn: isLoggedin),
    );
    state = _getSetting();
  }

  Future<void> setLoggedIn(bool isLog) async {
    await _settingsBox.put(
      1,
      state.copyWith(isLoggedIn: isLog),
    );
    state = _getSetting();
  }

  /// [addRecentMatarial] is used to store the values which are opened
  /// by user recently, if reverse value is used when needed
  /// if the material value is present in the list then first remove that value
  /// and then add it again, so the latest used value of the material will be
  /// appended at the last element of the list
  Future<void> addRecentMatarial(String mat) async {
    List<String> matList = [];
    if (state.recentMaterials != null) {
      if (!state.recentMaterials!.contains(mat)) {
        matList = [...?state.recentMaterials, mat];
        matList.toSet().toList();
        await _settingsBox.put(
          1,
          state.copyWith(recentMaterials: matList),
        );
        state = _getSetting();
      } else {
        state.recentMaterials!.removeWhere((element) => element == mat);
        matList = [...?state.recentMaterials, mat];
        matList.toSet().toList();
        await _settingsBox.put(
          1,
          state.copyWith(recentMaterials: matList),
        );
        state = _getSetting();
      }
    } else {
      matList = [mat];
      matList.toSet().toList();
      await _settingsBox.put(
        1,
        state.copyWith(recentMaterials: matList),
      );
      state = _getSetting();
    }
  }
}
