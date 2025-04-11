import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warehouse_erp/models/hive/materials/material_model.dart';
import 'package:warehouse_erp/repositories/materials_repository.dart' as mm;
import 'package:warehouse_erp/utils/utils.dart';
import '../models/material_details/materials.dart';

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
    return _materialsBox.values.toList();
  }

  Future<void> local() async {
    state = AsyncValue.data(_getMaterialsFromLocal());
  }

  MaterialsModel get(String material) {
    return _getMaterialsFromLocal()
        .firstWhere((element) => element.material == material);
  }

  /// This method is used to get the materials from the API call where
  /// the url value of the fetching API is present at the settings/set_urls.
  /// After fetching the material details from the API, the material values
  /// are stored in the local database.
  /// After opening the application,
  /// the values will be fetched by [MaterialsController] as the state
  /// for this Async Provider is given by the current values in the local storage
  Future<void> fetchMaterials() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      ref
          .read(loadingMessageProvider.notifier)
          .update((state) => LangTextConstants.msg_Fetchingdataforyou.tr);
      final resp = await ref.read(mm.materialsReposProvider).getAll();
      // TODO Lang
      ref.read(loadingMessageProvider.notifier).state = 'Saving data locally';
      await _saveMaterials(resp);
      return _getMaterialsFromLocal();
    });
  }

  /// [_saveMaterials] method is used for saving the materials in the hive local
  /// storage,
  Future<void> _saveMaterials(List<Material> resp) async {
    ref
        .read(loadingMessageProvider.notifier)
        .update((state) => LangTextConstants.msg_Fetchingdataforyou.tr);
    for (final matnr in resp) {
      MaterialsModel mt;
      final exist = _materialsBox.get(matnr.material);
      if (exist != null) {
        mt = exist;
        for (final prpt in matnr.properties) {
          final PropertyModel prp = PropertyModel(
              propertyName: prpt.propertyName,
              propertyValue: prpt.propertyValue,
              section: prpt.section ?? '');
          mt.properties.add(prp);
        }
      } else {
        final colors = UniqueColorGenerator.getDualColors();
        mt = MaterialsModel(
            material: matnr.material,
            properties: [],
            text: colors[0].value.toString(),
            background: colors[1].value.toString());
        for (final prpt in matnr.properties) {
          final PropertyModel prp = PropertyModel(
              propertyName: prpt.propertyName,
              propertyValue: prpt.propertyValue,
              section: prpt.section ?? '');
          mt.properties.add(prp);
        }
      }
      await _materialsBox.put(matnr.material, mt).catchError((err) {
        debugPrint('Error: $err'); // Prints 401.
        throw err;
      });
    }
  }
}
