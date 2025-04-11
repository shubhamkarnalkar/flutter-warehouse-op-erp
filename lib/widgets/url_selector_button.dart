import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warehouse_erp/models/app_model.dart';
import 'package:warehouse_erp/widgets/custom_widgets.dart';

class URLSelectorChangeButton extends ConsumerWidget {
  const URLSelectorChangeButton({
    super.key,
    required this.handleURLSelect,
    required this.selectedURL,
  });

  final void Function(int) handleURLSelect;
  final int selectedURL;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final urls = UrlsAppModel.urlTypes();
    final nowURL = urls[selectedURL];
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: PopupMenuButton(
        icon: Row(
          children: [
            Text(nowURL.name),
            sizedBoxH20(),
            const Icon(
              Icons.language,
            ),
          ],
        ),
        tooltip: 'Select a URL',
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        itemBuilder: (context) {
          return List.generate(urls.length, (index) {
            final currentURL = urls[index];
            return PopupMenuItem(
              value: index,
              child: Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(currentURL.name.toString()),
                  ),
                ],
              ),
            );
          });
        },
        onSelected: handleURLSelect,
      ),
    );
  }
}
