import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
      tablet: _MaterialTablet(ref: ref, matProv: matProv),
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
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150,
            backgroundColor: Colors.black,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.all(15),
              background: Image.asset(
                ImageConstant.shipImg,
                fit: BoxFit.cover,
              ),
              title: Text(
                LangTextConstants.lbl_materials.tr,
                style: theme.textTheme.headlineSmall!
                    .copyWith(color: Colors.white),
              ),
              centerTitle: true,
            ),
          ),
          SliverFillRemaining(
            child: ref.watch(settingsControllerProvider).materialsUrl.isEmpty
                ? ErrorPage(
                    obj: LangTextConstants.lbl_materials.tr +
                        LangTextConstants.msg_url_not_set.tr)
                : switch (matProv) {
                    AsyncData(value: final matList) => matList.isEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ErrorPage(
                                  obj: LangTextConstants.msg_Nodatafound.tr),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                  onPressed: () => ref
                                      .read(
                                          materialsControllerProvider.notifier)
                                      .fetchMaterials(),
                                  icon: const Icon(Icons.sync_outlined),
                                ),
                              ),
                            ],
                          )
                        : LayoutBuilder(
                            builder: (context, constraints) => _GridsMobile(
                              matList: matList,
                              childAspectRatio: 0.9,
                            ),
                          ),
                    AsyncError(:final error) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 250,
                            child: Expanded(
                              child: ErrorPage(
                                obj: error,
                              ),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              ref
                                  .read(materialsControllerProvider.notifier)
                                  .local();
                            },
                            child: const Text('Fetch from local'),
                          ),
                        ],
                      ),
                    _ => const Center(
                        child: Loader(),
                      ),
                  },
          )
        ],
      ),
    );
  }
}

class _MaterialTablet extends StatelessWidget {
  const _MaterialTablet({
    required this.ref,
    required this.matProv,
  });

  final WidgetRef ref;
  final AsyncValue<List<MaterialsModel>> matProv;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150,
            backgroundColor: Colors.black,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.all(15),
              background: Image.asset(
                ImageConstant.shipImg,
                fit: BoxFit.cover,
              ),
              title: Text(
                LangTextConstants.lbl_materials.tr,
                style: theme.textTheme.headlineSmall!
                    .copyWith(color: Colors.white),
              ),
              centerTitle: true,
            ),
          ),
          SliverFillRemaining(
            child: ref.watch(settingsControllerProvider).materialsUrl.isEmpty
                ? ErrorPage(
                    obj: LangTextConstants.lbl_materials.tr +
                        LangTextConstants.msg_url_not_set.tr)
                : switch (matProv) {
                    AsyncData(value: final matList) => matList.isEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ErrorPage(
                                  obj: LangTextConstants.msg_Nodatafound.tr),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                  onPressed: () => ref
                                      .read(
                                          materialsControllerProvider.notifier)
                                      .fetchMaterials(),
                                  icon: const Icon(Icons.sync_outlined),
                                ),
                              ),
                            ],
                          )
                        : LayoutBuilder(
                            builder: (context, constraints) => _GridsTablet(
                              matList: matList,
                              childAspectRatio: 0.9,
                              gridItemCount:
                                  (constraints.maxWidth ~/ 120).round(),
                            ),
                          ),
                    AsyncError(:final error) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 250,
                            child: Expanded(
                              child: ErrorPage(
                                obj: error,
                              ),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              ref
                                  .read(materialsControllerProvider.notifier)
                                  .local();
                            },
                            child: const Text('Fetch from local'),
                          ),
                        ],
                      ),
                    _ => const Center(
                        child: Loader(),
                      ),
                  },
          )
        ],
      ),
    );
  }
}

class _GridsTablet extends ConsumerWidget {
  const _GridsTablet({
    required this.matList,
    this.childAspectRatio,
    required this.gridItemCount,
  });

  final List<MaterialsModel> matList;
  final int gridItemCount;
  final double? childAspectRatio;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        SizedBox(
          height: 140,
          child: ColoredMaterialCards(
            matList: matList,
            theme: theme,
          ),
        ),

        // TODO: lang
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'All',
                style: theme.textTheme.titleLarge,
              ),
              IconButton(
                  onPressed: () => ref
                      .read(materialsControllerProvider.notifier)
                      .fetchMaterials(),
                  icon: const Icon(Icons.sync_outlined))
            ],
          ),
        ),

        Expanded(
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridItemCount,
              childAspectRatio: childAspectRatio ?? 0.4,
            ),
            children: [
              for (final mat in matList)
                InkWell(
                  onTap: () async {
                    Future.microtask(
                      () async => await ref
                          .read(settingsControllerProvider.notifier)
                          .addRecentMatarial(mat.material),
                    );
                    context.goNamed(
                      RouteConstants.matPropertiesPage,
                      pathParameters: <String, String>{'id': mat.material},
                    );
                  },
                  child: MaterialTileWidget(
                    material: mat,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _GridsMobile extends ConsumerWidget {
  const _GridsMobile({required this.matList, required this.childAspectRatio});

  final List<MaterialsModel> matList;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        SizedBox(
          height: 160,
          child: ColoredMaterialCards(
            matList: matList,
            theme: theme,
          ),
        ),

        // TODO: lang
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'All',
                style: theme.textTheme.titleLarge,
              ),
              IconButton(
                  onPressed: () => ref
                      .read(materialsControllerProvider.notifier)
                      .fetchMaterials(),
                  icon: const Icon(Icons.sync_outlined))
            ],
          ),
        ),

        Flexible(
          flex: 2,
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: childAspectRatio,
            ),
            children: [
              for (final mat in matList)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () async {
                      Future.microtask(
                        () async => await ref
                            .read(settingsControllerProvider.notifier)
                            .addRecentMatarial(mat.material),
                      );
                      context.goNamed(
                        RouteConstants.matPropertiesPage,
                        pathParameters: <String, String>{'id': mat.material},
                      );
                    },
                    child: MaterialTileWidget(
                      material: mat,
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

class ColoredMaterialCards extends HookConsumerWidget {
  const ColoredMaterialCards(
      {super.key,
      required this.matList,
      required this.theme,
      this.childAspectRatio = 0.8,
      this.gridItemCount});

  final List<MaterialsModel> matList;
  final ThemeData theme;
  final int? gridItemCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recent =
        ref.watch(settingsControllerProvider).recentMaterials?.reversed;
    final List<MaterialsModel> fltdRecMat = [];
    if (recent != null) {
      for (final i in recent) {
        fltdRecMat.add(matList.where((element) => element.material == i).first);
      }
    }
    if (fltdRecMat.isEmpty) {
      return SizedBox(
        child: Center(
          child: Text(
            LangTextConstants.msg_Nodatafound.tr,
            style: theme.textTheme.titleMedium,
          ),
        ),
      );
    }

    final scroller = useScrollController();
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, childAspectRatio: 1 / childAspectRatio),
      itemCount: fltdRecMat.length,
      scrollDirection: Axis.horizontal,
      controller: scroller,
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () async {
            ref
                .read(settingsControllerProvider.notifier)
                .addRecentMatarial(matList[index].material);
            context.goNamed(
              RouteConstants.matPropertiesPage,
              pathParameters: <String, String>{'id': matList[index].material},
            );
          },
          child: MaterialTileWidget(
            material: fltdRecMat[index],
          ),
        );
      },
    );
  }
}
