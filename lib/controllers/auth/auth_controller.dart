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

  AuthState reset() {
    return AuthState.authFailure;
  }

  Future<void> login(String usr, String pwd) async {
    state = const AsyncValue.loading();
    try {
      if (usr.isEmpty || pwd.isEmpty) {
        throw 'Username or Password is empty';
      }
      String auth = 'Basic ${base64Encode(utf8.encode('$usr:$pwd'))}';
      final Map<String, String> header = {'Authorization': auth};
      final Response resp;

      resp = await ref.read(dioProvider).post(
            ref.read(settingsControllerProvider).signInUrl,
            options: Options(headers: header),
          );
      if (resp.statusCode == 200 || resp.statusCode == 201) {
        final String accTok = resp.data['access_token'];
        await ref
            .watch(settingsControllerProvider.notifier)
            .setAuth(usr, pwd, accTok, true);
        state = const AsyncValue.data(AuthState.authenticated);
      } else {
        await ref.read(settingsControllerProvider.notifier).setLoggedIn(false);
        state = const AsyncValue.data(AuthState.authFailure);
      }
    } catch (e) {
      await ref.read(settingsControllerProvider.notifier).setLoggedIn(false);
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Map<String, String> getHeader() {
    final Map<String, String> headerDetails = {
      'Authorization':
          'Bearer ${ref.watch(settingsControllerProvider).accessToken}'
    };
    return headerDetails;
  }
}
