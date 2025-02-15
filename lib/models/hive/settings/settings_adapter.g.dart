// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingsModelAdapter extends TypeAdapter<SettingsModel> {
  @override
  final int typeId = 1;

  @override
  SettingsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SettingsModel(
      isDark: fields[0] == null ? true : fields[0] as bool,
      textScaleFactor: fields[1] == null ? 1.0 : fields[1] as double,
      locale: fields[2] == null ? 0 : fields[2] as int,
      seedColorId: fields[3] == null ? 7 : fields[3] as int,
      baseUrl: fields[4] as String,
      inventoryUrl: fields[6] as String,
      materialsUrl: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SettingsModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.isDark)
      ..writeByte(1)
      ..write(obj.textScaleFactor)
      ..writeByte(2)
      ..write(obj.locale)
      ..writeByte(3)
      ..write(obj.seedColorId)
      ..writeByte(4)
      ..write(obj.baseUrl)
      ..writeByte(5)
      ..write(obj.materialsUrl)
      ..writeByte(6)
      ..write(obj.inventoryUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
