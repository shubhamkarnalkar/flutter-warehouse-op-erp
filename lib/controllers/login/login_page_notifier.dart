import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:warehouse_erp/utils/utils.dart';
import '../../repositories/login_repository.dart';
import 'login_page_state.dart';

final loginPageNotifier =
    StateNotifierProvider<LoginPageNotifier, LoginPageState>(
  (ref) => LoginPageNotifier(
    loginRepository: ref.watch(loginReposProvider),
    LoginPageState(
      comIDTextController: TextEditingController(),
      loginPagePasswordController: TextEditingController(),
      isPwdVisible: false,
    ),
  ),
);

/// A notifier that manages the state of a LoginPage according to the event that is dispatched to it.
class LoginPageNotifier extends StateNotifier<LoginPageState> {
  final LoginRepository loginRepository;
  LoginPageNotifier(super.state, {required this.loginRepository});
  void login(BuildContext ctx) async {
    if (state.comIDTextController!.text.isEmpty ||
        state.loginPagePasswordController!.text.isEmpty) {
      showSnackBarMessage(context: ctx, error: 'ID or password is empty');
    } else {
      final String username = state.comIDTextController!.text.trim();
      final String password = state.loginPagePasswordController!.text.trim();
      // ignore: prefer_interpolation_to_compose_strings
      String auth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
      final resp = await loginRepository.login(auth);
      resp.fold((l) => showSnackBarMessage(context: ctx, error: '$l'), (r) {
        showSnackBarMessage(context: ctx, message: 'Login Successfull!');
        ctx.goNamed(RouteConstants.pickingEnterDelivery);
      });
    }
  }

  void changeVisibility() {
    //   if (state.isPwdVisible) {
    //     state = state.copyWith(
    //       isPwdVisible: !state.isPwdVisible,
    //     );
    //   } else {

    //   }
    state = state.copyWith(
      isPwdVisible: !state.isPwdVisible,
    );
  }
}
