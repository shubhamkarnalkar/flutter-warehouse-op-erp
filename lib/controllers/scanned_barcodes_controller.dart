import 'package:warehouse_erp/models/hive/scanned/scanned_barcode_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:warehouse_erp/utils/utils.dart';

final scannedBarcodesBoxProvider = Provider((ref) {
  return Hive.box<ScannedBarcodesModel>(HiveConstants.docBarcodesBox);
});

final scannedBarcodesControllerProvider =
    StateNotifierProvider.autoDispose<ScannedBarcodesController, bool>((ref) {
  return ScannedBarcodesController(
    ref: ref,
    box: ref.read(scannedBarcodesBoxProvider),
  );
});

class ScannedBarcodesController extends StateNotifier<bool> {
  final Box<ScannedBarcodesModel> _box;
  // ignore: unused_field
  final Ref _ref;
  ScannedBarcodesController({
    required Box<ScannedBarcodesModel> box,
    required Ref ref,
  })  : _box = box,
        _ref = ref,
        super(
          false,
        ) {
    state = false;
  }

  // ignore: unused_element
  List<ScannedBarcodesModel> _getValues() {
    return _box.values.toList().isNotEmpty ? _box.values.toList() : [];
  }

  void save(String? docNum, List<String> barcodes) async {
    final String doc = docNum ?? DateTime.now().toString();
    final ScannedBarcodesModel scannedBarcodesModel =
        ScannedBarcodesModel(docNum: doc, scannedBarcodes: barcodes);
    await _box.put(doc, scannedBarcodesModel);
  }

  void clearBox() {
    _box.clear();
  }
}
