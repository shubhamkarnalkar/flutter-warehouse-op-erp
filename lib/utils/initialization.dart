import 'package:warehouse_erp/utils/utils.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/hive/scanned/scanned_barcode_model.dart';
import '../models/hive/settings/settings_adapter.dart';

Future<void> initialize() async {
  await Hive.initFlutter(HiveConstants.hhtDirectory);
  Hive.registerAdapter(SettingsModelAdapter());
  Hive.registerAdapter(ScannedBarcodesModelAdapter());

  await Hive.openBox<SettingsModel>(HiveConstants.settingsBox);
  await Hive.openBox<ScannedBarcodesModel>(HiveConstants.docBarcodesBox);
}
