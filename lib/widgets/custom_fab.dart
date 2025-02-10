import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:warehouse_erp/utils/utils.dart';

class CustomFAB extends ConsumerWidget {
  const CustomFAB({super.key, this.path = ''});
  final String path;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Row(
        children: [
          FloatingActionButton.extended(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_left_rounded),
            label: Text(LangTextConstants.lbl_back.tr),
          ),
          FloatingActionButton.extended(
            onPressed: () => path.isNotEmpty ? context.goNamed(path) : null,
            icon: const Icon(Icons.check),
            label: Text(LangTextConstants.lbl_back.tr),
          ),
        ],
      ),
    );
  }
}
