import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warehouse_erp/models/hive/materials/material_model.dart';
import 'package:warehouse_erp/models/material_details/materials.dart';
import 'package:warehouse_erp/repositories/materials_repository.dart';
import 'package:warehouse_erp/utils/utils.dart';

final materialsBoxProvider = Provider((ref) {
  return Hive.box<MaterialsModel>(HiveConstants.materialDirectory);
});

final materialsControllerProvider =
    AsyncNotifierProvider<MaterialsController, List<MaterialsModel>>(() {
  return MaterialsController();
});

class MaterialsController extends AsyncNotifier<List<MaterialsModel>> {
  late Box<MaterialsModel> _materialsBox;
  @override
  Future<List<MaterialsModel>> build() async {
    // Load initial todo list from the remote repository
    _materialsBox = ref.watch(materialsBoxProvider);
    return _getMaterialsFromLocal();
  }

  List<MaterialsModel> _getMaterialsFromLocal() {
    return _materialsBox.values.toList().isNotEmpty
        ? _materialsBox.values.toList()
        : [];
  }

  Future<void> fetchMaterials() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      //TODO: lang
      ref
          .read(loadingMessageProvider.notifier)
          .update((state) => 'Fetching data for you');
      final resp = await ref.read(materialsReposProvider).getAll();
      await _saveMaterials(resp);
      return _getMaterialsFromLocal();
    });
  }

  Future<void> _saveMaterials(List<Material> resp) async {
    //TODO: lang
    ref.read(loadingMessageProvider.notifier).update((state) => 'Saving data');
    for (final matnr in resp) {
      final material = matnr.material;
      for (final prp in matnr.properties) {
        await _materialsBox.add(
          MaterialsModel(
              material: material,
              property: prp.propertyName,
              value: prp.propertyValue),
        );
      }
    }
  }
}
