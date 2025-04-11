// ignore_for_file: unnecessary_cast

import 'package:flutter/material.dart';
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
                            builder: (context, constraints) => Grids(
                              matList: matList,
                              gridItemCount:
                                  (constraints.maxWidth ~/ 120).round(),
                              childAspectRatio: 0.8,
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
                            builder: (context, constraints) => Grids(
                              matList: matList,
                              gridItemCount:
                                  (constraints.maxWidth ~/ 120).round(),
                              childAspectRatio: 0.8,
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

class Grids extends ConsumerWidget {
  const Grids({
    super.key,
    required this.matList,
    this.gridItemCount = 3,
    this.childAspectRatio = 0.85,
  });

  final List<MaterialsModel> matList;
  final int? gridItemCount;
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
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: ColoredMaterialCards(
              matList: matList,
              theme: theme,
              gridItemCount: gridItemCount,
              childAspectRatio: childAspectRatio,
            ),
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
              crossAxisCount: gridItemCount ?? 3,
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
    // final Color backgroundColor = UniqueColorGenerator.getDualColors()[1];
    // final Color textColor = UniqueColorGenerator.getDualColors()[0];
    // return GridView(
    //   scrollDirection: Axis.horizontal,
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: gridItemCount ?? 3,
    //     childAspectRatio: childAspectRatio,
    //   ),
    //   children: [
    //     for (final mt in fltdRecMat)
    //       Card(
    //         color: backgroundColor,
    //         borderOnForeground: true,
    //         clipBehavior: Clip.hardEdge,
    //         child: ConstrainedBox(
    //           constraints: BoxConstraints.tight(const Size(100, 120)),
    //           child: Stack(
    //             children: [
    //               Align(
    //                 alignment: Alignment.topLeft,
    //                 child: Padding(
    //                   padding: const EdgeInsets.all(8.0),
    //                   child: Icon(
    //                     Icons.corporate_fare_sharp,
    //                     color: textColor,
    //                   ),
    //                 ),
    //               ),
    //               Align(
    //                 alignment: Alignment.topRight,
    //                 child: Padding(
    //                   padding: const EdgeInsets.all(8.0),
    //                   child: Text(
    //                     mt.properties
    //                         .firstWhere(
    //                           (element) =>
    //                               element.propertyName.contains('name') ||
    //                               element.propertyName.contains('descr'),
    //                           orElse: () => PropertyModel(
    //                               propertyName: '',
    //                               propertyValue: '',
    //                               section: ''),
    //                         )
    //                         .propertyValue,
    //                     maxLines: 1,
    //                     style: theme.textTheme.bodyLarge!.copyWith(
    //                       color: textColor,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               Align(
    //                 alignment: Alignment.bottomLeft,
    //                 child: Padding(
    //                   padding: const EdgeInsets.all(8.0),
    //                   child: Text(
    //                     mt.material,
    //                     style: theme.textTheme.titleLarge!
    //                         .copyWith(color: textColor),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //   ],
    // );

    final scroller = useScrollController();
    return ListView.builder(
      itemCount: fltdRecMat.length,
      scrollDirection: Axis.horizontal,
      controller: scroller,
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) {
        return SizedBox(
          height: 120,
          width: 100,
          child: InkWell(
            onTap: () async {
              ref
                  .read(settingsControllerProvider.notifier)
                  .addRecentMatarial(matList[index].material);
              context.goNamed(
                RouteConstants.matPropertiesPage,
                pathParameters: <String, String>{'id': matList[index].material},
              );
            },
            child: Card(
              color: Color(int.parse(fltdRecMat[index].background)),
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
                        color: Color(int.parse(fltdRecMat[index].text)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        fltdRecMat[index]
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
                          color: Color(int.parse(fltdRecMat[index].text)),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        fltdRecMat[index].material,
                        style: theme.textTheme.titleLarge!.copyWith(
                            color: Color(
                                int.parse(fltdRecMat[index].text) as int)),
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
