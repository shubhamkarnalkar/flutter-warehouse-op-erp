// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scanned_barcode_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScannedBarcodesModelAdapter extends TypeAdapter<ScannedBarcodesModel> {
  @override
  final int typeId = 0;

  @override
  ScannedBarcodesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScannedBarcodesModel(
      docNum: fields[0] as String,
      scannedBarcodes: (fields[1] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, ScannedBarcodesModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.docNum)
      ..writeByte(1)
      ..write(obj.scannedBarcodes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScannedBarcodesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
