import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ErrorPage extends ConsumerWidget {
  final String errorMessage;
  const ErrorPage(this.errorMessage, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Center(
        child: Column(
          children: [
            const Icon(Icons.error_sharp, size: 60),
            Text(errorMessage),
          ],
        ),
      ),
    );
  }
}
