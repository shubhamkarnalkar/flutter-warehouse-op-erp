import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LocalSettingsModel extends Equatable {
  final ThemeMode themeMode = ThemeMode.system;
  final double textScaleFactor = 1.0;
  final Locale locale = const Locale('en');
  @override
  List<Object?> get props => [];
}

enum UrlsApp { base, materials, inventory }

class UrlsAppModel {
  final int id;
  final UrlsApp url;
  final String name;
  final String responseValue;

  UrlsAppModel(this.id, this.url, this.name, this.responseValue);

  static List<UrlsAppModel> urlTypes() {
    return <UrlsAppModel>[
      UrlsAppModel(0, UrlsApp.base, 'Base URL', ''),
      UrlsAppModel(1, UrlsApp.inventory, 'Inventory', ''),
      UrlsAppModel(2, UrlsApp.materials, 'Materials', ''),
      // UrlsAppModel(3, ),
    ];
  }
}
