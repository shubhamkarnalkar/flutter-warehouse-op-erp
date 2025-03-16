import 'package:flutter/material.dart';
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
      mobile: Scaffold(
        appBar: CustomAppBar(
          title: LangTextConstants.lbl_materials.tr,
        ),
        body: ref.watch(settingsControllerProvider).materialsUrl.isEmpty
            ? ErrorPage(
                obj: LangTextConstants.lbl_materials.tr +
                    LangTextConstants.msg_url_not_set.tr)
            : switch (matProv) {
                AsyncData(value: final matList) => matList.isEmpty
                    ? ErrorPage(obj: LangTextConstants.msg_Nodatafound.tr)
                    : Grids(matList: matList),
                AsyncError(:final error) => ErrorPage(
                    obj: error,
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
      ),
    );
  }
}

class Grids extends HookConsumerWidget {
  const Grids({
    super.key,
    required this.matList,
    this.gridItemCount = 3,
  });

  final List<MaterialsModel> matList;
  final int? gridItemCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridItemCount ?? 3,
        childAspectRatio: 0.85,
      ),
      children: [
        for (final mat in matList)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialTileWidget(
              material: mat.material,
              title: mat.material,
              subtitle: '',
            ),
          ),
      ],
    );
  }
}
