// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'materials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialImpl _$$MaterialImplFromJson(Map<String, dynamic> json) =>
    _$MaterialImpl(
      material: json['Material'] as String,
      properties: (json['Properties'] as List<dynamic>)
          .map((e) => Property.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MaterialImplToJson(_$MaterialImpl instance) =>
    <String, dynamic>{
      'Material': instance.material,
      'Properties': instance.properties,
    };

_$PropertyImpl _$$PropertyImplFromJson(Map<String, dynamic> json) =>
    _$PropertyImpl(
      propertyName: json['PropertyName'] as String,
      propertyValue: json['PropertyValue'] as String,
    );

Map<String, dynamic> _$$PropertyImplToJson(_$PropertyImpl instance) =>
    <String, dynamic>{
      'PropertyName': instance.propertyName,
      'PropertyValue': instance.propertyValue,
    };

_$MaterialsImpl _$$MaterialsImplFromJson(Map<String, dynamic> json) =>
    _$MaterialsImpl(
      materials: (json['materials'] as List<dynamic>)
          .map((e) => Material.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MaterialsImplToJson(_$MaterialsImpl instance) =>
    <String, dynamic>{
      'materials': instance.materials,
    };
