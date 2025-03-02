import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warehouse_erp/controllers/settings_controller.dart';
import 'package:warehouse_erp/models/loading_state.dart';
import '../flavors.dart';

final dioProvider = Provider((ref) {
  return Dio(
    BaseOptions(
      baseUrl: ref.watch(settingsControllerProvider).baseUrl.isEmpty
          ? F.baseUrl
          : ref.watch(settingsControllerProvider).baseUrl,
      connectTimeout: const Duration(seconds: 30),
      // headers: apiHeaders,
    ),
  );
});

final loadingStateProvider = StateProvider.autoDispose<LoadingState>((ref) {
  return LoadingState(isLoading: false);
});
