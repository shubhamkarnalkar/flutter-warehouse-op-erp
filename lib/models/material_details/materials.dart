import 'package:freezed_annotation/freezed_annotation.dart';

part 'materials.freezed.dart';
part 'materials.g.dart';

// Define the Material model
@freezed
class Material with _$Material {
  const factory Material({
    required String material,
    required List<Property> properties,
  }) = _Material;

  factory Material.fromJson(Map<String, dynamic> json) =>
      _$MaterialFromJson(json);
}

// Define the Property model
@freezed
class Property with _$Property {
  const factory Property({
    @JsonKey(name: 'PropertyName') required String propertyName,
    @JsonKey(name: 'PropertyValue') required String propertyValue,
  }) = _Property;

  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);
}

// Define the Materials wrapper to hold a list of Material objects
@freezed
class Materials with _$Materials {
  const factory Materials({
    required List<Material> materials,
  }) = _Materials;

  factory Materials.fromJson(Map<String, dynamic> json) =>
      _$MaterialsFromJson(json);
}
