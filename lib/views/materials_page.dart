import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warehouse_erp/controllers/settings_controller.dart';
import 'package:warehouse_erp/models/hive/materials/material_model.dart';
import 'package:warehouse_erp/utils/utils.dart';
import 'package:warehouse_erp/widgets/custom_widgets.dart';
import '../controllers/materials_controller.dart';

class MaterialsPage extends StatefulHookConsumerWidget {
  const MaterialsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MaterialsPageState();
}

class _MaterialsPageState extends ConsumerState<MaterialsPage> {
  @override
  Widget build(BuildContext context) {
    final matProv = ref.watch(materialsControllerProvider);
    return Responsive(
      mobile: _MaterialMobile(ref: ref, matProv: matProv),
    );
  }
}

class _MaterialMobile extends StatelessWidget {
  const _MaterialMobile({
    required this.ref,
    required this.matProv,
  });

  final WidgetRef ref;
  final AsyncValue<List<MaterialsModel>> matProv;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LangTextConstants.lbl_materials.tr,
        hasBackButton: false,
      ),
      body: ref.watch(settingsControllerProvider).materialsUrl.isEmpty
          ? ErrorPage(
              obj: LangTextConstants.lbl_materials.tr +
                  LangTextConstants.msg_url_not_set.tr)
          : switch (matProv) {
              AsyncData(value: final matList) => matList.isEmpty
                  ? ErrorPage(obj: LangTextConstants.msg_Nodatafound.tr)
                  : Grids(matList: matList),
              AsyncError(:final error) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      child: ErrorPage(
                        obj: error,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        ref.read(materialsControllerProvider.notifier).local();
                      },
                      child: const Text('Fetch from local'),
                    )
                  ],
                ),
              _ => const Center(
                  child: Loader(),
                ),
            },
      floatingActionButton: FloatingActionButton(
        enableFeedback: true,
        onPressed: () => matProv.isLoading
            ? null
            : ref.read(materialsControllerProvider.notifier).fetchMaterials(),
        child: const Icon(Icons.sync_outlined),
      ),
    );
  }
}

class Grids extends StatelessWidget {
  const Grids({
    super.key,
    required this.matList,
    this.gridItemCount = 3,
  });

  final List<MaterialsModel> matList;
  final int? gridItemCount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TODO: lang
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Recent',
                style: theme.textTheme.titleLarge,
              ),
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: ColoredMaterialCards(matList: matList, theme: theme),
          ),
        ),

        // TODO: lang
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'All',
            style: theme.textTheme.titleLarge,
          ),
        ),

        Flexible(
          flex: 4,
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridItemCount ?? 3,
              childAspectRatio: 0.85,
            ),
            children: [
              for (final mat in matList)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () => context.goNamed(
                      RouteConstants.matPropertiesPage,
                      pathParameters: <String, String>{'id': mat.material},
                    ),
                    child: MaterialTileWidget(
                      material: mat.properties.first.propertyName,
                      title: mat.material,
                      subtitle: mat.properties.first.propertyName,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class ColoredMaterialCards extends StatelessWidget {
  const ColoredMaterialCards({
    super.key,
    required this.matList,
    required this.theme,
  });

  final List<MaterialsModel> matList;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: matList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final randm = Random().nextInt(Pallete.colorCombi.length);
        final key = Pallete.colorCombi.entries.toList()[randm].key;
        final Color textColor =
            Pallete.colorCombi[key]?['text'] ?? Colors.black;
        final Color backgroundColor =
            Pallete.colorCombi[key]?['background'] ?? Colors.orangeAccent;
        return SizedBox(
          height: 200,
          width: 120,
          child: InkWell(
            onTap: () => context.goNamed(
              RouteConstants.matPropertiesPage,
              pathParameters: <String, String>{'id': matList[index].material},
            ),
            child: Card(
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
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        matList[index]
                            .properties
                            .firstWhere(
                              (element) =>
                                  element.propertyName.contains('name') ||
                                  element.propertyName.contains('descr'),
                              orElse: () => PropertyModel(
                                  propertyName: '',
                                  propertyValue: '',
                                  section: ''),
                            )
                            .propertyValue,
                        maxLines: 1,
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: textColor,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        matList[index].material,
                        style: theme.textTheme.titleLarge!
                            .copyWith(color: textColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
