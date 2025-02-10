import 'package:flutter/material.dart';
import 'package:warehouse_erp/controllers/scanned_barcodes_controller.dart';
import 'package:warehouse_erp/widgets/custom_widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SyncPage extends ConsumerStatefulWidget {
  const SyncPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SyncPageState();
}

class _SyncPageState extends ConsumerState<SyncPage> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Scaffold(
        appBar: const CustomAppBar(
          hasBackButton: false,
          centerTitle: true,
          title: 'Sync',
        ),
        body: ValueListenableBuilder(
          valueListenable: ref.watch(scannedBarcodesBoxProvider).listenable(),
          builder: (context, value, child) {
            return SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: ListView.builder(
                itemCount: value.values.toList().length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Card(
                      child: Text(value.values.toList()[index].docNum),
                    ),
                  );
                },
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              ref.read(scannedBarcodesControllerProvider.notifier).clearBox(),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sync),
          ),
        ),
      ),
    );
  }
}
