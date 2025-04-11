import 'package:flutter/material.dart';
import 'package:warehouse_erp/models/hive/materials/material_model.dart';

class MaterialTileWidget extends StatelessWidget {
  const MaterialTileWidget({
    super.key,
    required this.title,
    this.subtitle,
    required this.material,
  });
  final String title;
  final String? subtitle;
  final MaterialsModel material;

  @override
  Widget build(BuildContext context) {
    final them = Theme.of(context);
    final String cirAvatr =
        material.properties.first.propertyValue.toUpperCase().characters.first;
    return Card(
      color: them.canvasColor,
      borderOnForeground: true,
      clipBehavior: Clip.hardEdge,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Color(int.parse(material.background)),
              radius: 37,
              child: CircleAvatar(
                radius: 36,
                backgroundColor: Color(int.parse(material.background)),
                child: Text(
                  cirAvatr,
                  style: them.textTheme.headlineMedium!.copyWith(),
                ),
              ),
            ),
          ),
          // const SizedBox(height: 5),
          Expanded(
            child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: them.colorScheme.onPrimary,
                shape: BoxShape.rectangle,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: them.textTheme.bodyMedium?.fontSize,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
