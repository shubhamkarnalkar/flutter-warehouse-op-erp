
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
      if (urls.materialsUrl.contains('http')) {
        matUrl = urls.materialsUrl.split(urls.baseUrl.toString())[1];
      } else {
        matUrl = urls.materialsUrl;
      }
      final jsonResp = await _dio.get(
        matUrl,
        // options: Options(headers: _auth.read(authHeaderControllerProvider)),
      );

      if (jsonResp.statusCode == 201 || jsonResp.statusCode == 200) {
        final mats = jsonResp.data['Materials'];
        List<Material> materials = (mats as List)
            .map((matnr) => Material.fromJson(matnr as Map<String, dynamic>))
            .toList();
        // final Materials materials = Materials.fromJson(val['Materials']);
        return materials;
      } else {
        throw jsonResp.statusMessage.toString();
      }
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          throw 'Connection time out';
        case DioExceptionType.connectionError:
          throw 'Something went wrong';
        default:
          throw e.message.toString();
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
