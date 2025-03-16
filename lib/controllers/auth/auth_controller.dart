import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warehouse_erp/controllers/settings_controller.dart';
import 'package:warehouse_erp/utils/utils.dart';

final authControllerProvider =
    AsyncNotifierProvider<AuthController, AuthState>(() {
  return AuthController();
});

enum AuthState { authenticated, authFailure }

class AuthController extends AsyncNotifier<AuthState> {
  @override
  AuthState build() {
    return AuthState.authFailure;
  }

  Future<void> login(String usr, String pwd) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        if (usr.isEmpty || pwd.isEmpty) {
          throw 'Username or Password is empty';
        }
        String auth = 'Basic ${base64Encode(utf8.encode('$usr:$pwd'))}';
        final Map<String, String> header = {'Authorization': auth};

        final resp = await ref.read(dioProvider).post(
              ref.read(settingsControllerProvider).signInUrl,
              options: Options(headers: header),
            );
        if (resp.statusCode == 200 || resp.statusCode == 201) {
          final String accTok = resp.data['access_token'];
          await ref
              .watch(settingsControllerProvider.notifier)
              .setAuth(usr, pwd, accTok);
          return AuthState.authenticated;
        } else {
          return AuthState.authFailure;
        }
      } catch (e) {
        rethrow;
      }
    });
  }

  Map<String, String> getHeader() {
    final Map<String, String> header = {
      'Authorization':
          'Bearer ${ref.watch(settingsControllerProvider).accessToken}'
    };
    return header;
  }
}
