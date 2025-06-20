// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'material_model.g.dart';

@HiveType(typeId: 2)
class MaterialsModel extends HiveObject with EquatableMixin {
  @HiveField(0)
  late String material;
  @HiveField(1)
  late String property;
  @HiveField(2)
  late String value;
  MaterialsModel({
    required this.material,
    required this.property,
    required this.value,
  });
  @override
  List<Object?> get props => [];
}
