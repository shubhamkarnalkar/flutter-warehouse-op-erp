// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'scanned_barcode_model.g.dart';

@HiveType(typeId: 0)
class ScannedBarcodesModel extends HiveObject with EquatableMixin {
  @HiveField(0)
  late String docNum;
  @HiveField(1)
  late List<String> scannedBarcodes;
  ScannedBarcodesModel({
    required this.docNum,
    required this.scannedBarcodes,
  });
  @override
  List<Object?> get props => [];
}
