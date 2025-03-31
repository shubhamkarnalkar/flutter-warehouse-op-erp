import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warehouse_erp/controllers/auth/auth_controller.dart';
import 'package:warehouse_erp/controllers/settings_controller.dart';
import 'package:warehouse_erp/utils/utils.dart';

import '../models/material_details/materials.dart';

final materialsReposProvider = Provider.autoDispose((ref) {
  return MaterialsRepository(dio: ref.watch(dioProvider), auth: ref);
});

class MaterialsRepository {
  final Dio _dio;
  final Ref _auth;
  MaterialsRepository({required final Dio dio, required final Ref auth})
      : _dio = dio,
        _auth = auth;

  Future<List<Material>> getAll() async {
    try {
      final urls = _auth.read(settingsControllerProvider);
      String matUrl = '';
      if (urls.materialsUrl.contains('http') && urls.baseUrl.isNotEmpty) {
        matUrl = urls.materialsUrl.split(urls.baseUrl.toString())[1];
      } else {
        matUrl = urls.materialsUrl;
      }
      final jsonResp = await _dio.get(
        matUrl,
        options: Options(
            headers: _auth.read(authControllerProvider.notifier).getHeader()),
      );

      if (jsonResp.statusCode == 201 || jsonResp.statusCode == 200) {
        final mats = jsonResp.data['Materials'];
        final matList = (mats as List);
        // matList.removeRange(5, 40);
        List<Material> materials = [];
        try {
          materials = matList
              .map((matnr) => Material.fromJson(matnr as Map<String, dynamic>))
              .toList();
        } catch (e) {
          // debugPrint();
          rethrow;
        }

        // final Materials materials = Materials.fromJson(val['Materials']);
        return materials;
      } else if (jsonResp.statusCode == 401) {
        await _auth
            .read(settingsControllerProvider.notifier)
            .setLoggedIn(false);
        throw jsonResp.statusMessage.toString();
      } else {
        throw jsonResp.statusMessage.toString();
      }
    } catch (e) {
      rethrow;
    }
  }
}
