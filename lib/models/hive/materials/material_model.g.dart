// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MaterialsModelAdapter extends TypeAdapter<MaterialsModel> {
  @override
  final int typeId = 2;

  @override
  MaterialsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MaterialsModel(
      material: fields[0] as String,
      properties: (fields[1] as List).cast<PropertyModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, MaterialsModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.material)
      ..writeByte(1)
      ..write(obj.properties);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MaterialsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
