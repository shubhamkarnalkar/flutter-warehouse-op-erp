import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LocalSettingsModel extends Equatable {
  final ThemeMode themeMode = ThemeMode.system;
  final double textScaleFactor = 1.0;
  final Locale locale = const Locale('en');
  @override
  List<Object?> get props => [];
}
