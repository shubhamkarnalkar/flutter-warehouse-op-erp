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
      text: fields[2] as String,
      background: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MaterialsModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.material)
      ..writeByte(1)
      ..write(obj.properties)
      ..writeByte(2)
      ..write(obj.text)
      ..writeByte(3)
      ..write(obj.background);
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

class PropertyModelAdapter extends TypeAdapter<PropertyModel> {
  @override
  final int typeId = 5;

  @override
  PropertyModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PropertyModel(
      propertyName: fields[0] as String,
      propertyValue: fields[1] as String,
      section: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PropertyModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.propertyName)
      ..writeByte(1)
      ..write(obj.propertyValue)
      ..writeByte(2)
      ..write(obj.section);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PropertyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
