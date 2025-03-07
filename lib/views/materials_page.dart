import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warehouse_erp/controllers/settings_controller.dart';
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
          hasBackButton: true,
          title: LangTextConstants.lbl_materials.tr,
        ),
        body: ref.watch(settingsControllerProvider).materialsUrl.isEmpty

            /// TODO
            ? const ErrorPage(errorMessage: "Material's URL is not set")
            : switch (matProv) {
                AsyncData(value: final matList) => matList.isEmpty

                    /// TODO
                    ? const ErrorPage(errorMessage: "No data found")
                    : ListView(
                        children: [
                          for (final mat in matList) Text(mat.material),
                        ],
                      ),
                AsyncError(:final error) => ErrorPage(
                    errorMessage: error.toString(),
                  ),
                _ => const Center(
                    child: Loader(),
                  ),
              },
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              ref.read(materialsControllerProvider.notifier).fetchMaterials(),
          child: const Icon(Icons.sync_outlined),
        ),
      ),
    );
  }
}
