import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warehouse_erp/controllers/materials_controller.dart';
import 'package:warehouse_erp/models/hive/materials/material_model.dart';
import 'package:warehouse_erp/utils/utils.dart';
import 'package:warehouse_erp/widgets/custom_widgets.dart';

class MaterialPropertiesPage extends StatefulHookConsumerWidget {
  final String material;
  const MaterialPropertiesPage({super.key, required this.material});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MaterialPropertiesPageState();
}

class _MaterialPropertiesPageState
    extends ConsumerState<MaterialPropertiesPage> {
  @override
  Widget build(BuildContext context) {
    final hasErr = useState(false);
    late MaterialsModel mat;
    Object err = Object();
    final Set<String> sections = {};
    try {
      sections.add(LangTextConstants.lbl_all.tr);
      mat =
          ref.watch(materialsControllerProvider.notifier).get(widget.material);
      sections.addAll(mat.properties.map((e) => e.section).toList());
    } catch (e) {
      hasErr.value = true;
      err = e;
    }
    final tabBarContr = useTabController(initialLength: sections.length);

    if (hasErr.value == true) {
      return ErrorPage(
        obj: err,
      );
    }

    return Responsive(
      mobile: Scaffold(
        appBar: AppBar(
          // TODO: lang
          title: const Text('Material Properties'),
          bottom: TabBar(
            controller: tabBarContr,
            isScrollable: true,
            tabs: [
              for (final sec in sections.toList())
                Tab(
                  text: sec,
                ),
            ],
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: tabBarContr,
          children: [
            for (final sec in sections.toList())
              PropertiesWidget(
                currProperties: mat.properties.toSet(),
                section: sec,
              ),
          ],
        ),
      ),
    );
  }
}

class PropertiesWidget extends StatelessWidget {
  const PropertiesWidget({
    super.key,
    required this.currProperties,
    required this.section,
  });

  final Set<PropertyModel>? currProperties;
  final String section;

  @override
  Widget build(BuildContext context) {
    if (currProperties == null || currProperties!.isEmpty) {
      return ErrorPage(obj: LangTextConstants.msg_Nodatafound.tr);
    }
    final Set<PropertyModel> filteredProps = Set.from(currProperties!);
    filteredProps.removeWhere((element) =>
        element.section == section &&
        element.section != LangTextConstants.lbl_all);
    List<DataColumn> dataColumns = [
      // TODO lang
      DataColumn(
        label: const Text('Name'),
        onSort: (columnIndex, ascending) {
          // TODO lang
        },
      ),
      DataColumn(
        label: const Text('Value'),
        onSort: (columnIndex, ascending) {},
      )
    ];

    return SingleChildScrollView(
      child: PaginatedDataTable(
        columns: dataColumns,
        source: PropertiesDataSource(props: filteredProps),
        rowsPerPage: 12,
      ),
    );
  }
}

class PropertiesDataSource extends DataTableSource {
  final Set<PropertyModel> props;
  PropertiesDataSource({required this.props});
  @override
  DataRow? getRow(int index) {
    if (index > props.length) {
      return const DataRow(cells: [
        DataCell(
          Text(''),
        ),
        DataCell(
          Text(''),
        ),
      ]);
    } else {
      return DataRow(cells: [
        DataCell(
          Text(props.toList()[index].propertyName),
        ),
        DataCell(
          Text(
            props.toList()[index].propertyValue,
            maxLines: 2,
          ),
        ),
      ]);
    }
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => props.length;

  @override
  int get selectedRowCount => 0;
}
