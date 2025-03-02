import 'package:hooks_riverpod/hooks_riverpod.dart';

final authHeaderControllerProvider =
    StateNotifierProvider<AuthHeaderControllerNotifier, Map<String, String>>(
        (ref) {
  return AuthHeaderControllerNotifier(ref: ref);
});

class AuthHeaderControllerNotifier extends StateNotifier<Map<String, String>> {
  AuthHeaderControllerNotifier({required Ref ref})
      : _ref = ref,
        super(
          {},
        ) {
    state = _getHeader();
  }
  // ignore: unused_field
  final Ref _ref;

  Map<String, String> _getHeader() {
    final Map<String, String> header = {'Authorization': ''};
    return header;
  }
}
