// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'material_model.g.dart';

@HiveType(typeId: 2)
class MaterialsModel extends HiveObject with EquatableMixin {
  MaterialsModel(
      {required this.material,
      required this.properties,
      required this.text,
      required this.background});
  @HiveField(0)
  late String material;
  @HiveField(1)
  late List<PropertyModel> properties;
  @HiveField(2)
  late String text;
  @HiveField(3)
  late String background;
  @override
  List<Object?> get props => [];
}

@HiveType(typeId: 5) // Add a unique typeId for PropertyModel.
class PropertyModel {
  @HiveField(0)
  final String propertyName;

  @HiveField(1)
  final String propertyValue;

  @HiveField(2)
  final String section;

  PropertyModel({
    required this.propertyName,
    required this.propertyValue,
    required this.section,
  });
}
