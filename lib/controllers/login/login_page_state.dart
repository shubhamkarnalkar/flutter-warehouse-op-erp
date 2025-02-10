import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Represents the state of LoginPage in the application.

// ignore_for_file: must_be_immutable
class LoginPageState extends Equatable {
  LoginPageState({
    this.comIDTextController,
    this.loginPagePasswordController,
    required this.isPwdVisible,
  });

  TextEditingController? comIDTextController;
  TextEditingController? loginPagePasswordController;
  bool isPwdVisible;

  @override
  List<Object?> get props =>
      [comIDTextController, loginPagePasswordController, isPwdVisible];
  LoginPageState copyWith({
    TextEditingController? comIDTextController,
    TextEditingController? loginPagePasswordController,
    bool? isPwdVisible,
  }) {
    return LoginPageState(
      comIDTextController: comIDTextController ?? this.comIDTextController,
      loginPagePasswordController:
          loginPagePasswordController ?? this.loginPagePasswordController,
      isPwdVisible: isPwdVisible ?? this.isPwdVisible,
    );
  }
}
