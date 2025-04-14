import 'package:flutter/material.dart';
import 'package:warehouse_erp/models/hive/materials/material_model.dart';

class MaterialTileWidget extends StatelessWidget {
  const MaterialTileWidget({
    super.key,
    required this.material,
  });

  final MaterialsModel material;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = Color(int.parse(material.background));
    final textColor = Color(int.parse(material.text));

    return Card(
      color: backgroundColor,
      borderOnForeground: true,
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.corporate_fare_sharp,
                color: textColor,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                material.material,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleLarge!.copyWith(
                  color: textColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
