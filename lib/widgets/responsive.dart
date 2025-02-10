import 'package:flutter/material.dart';
import 'package:warehouse_erp/controllers/settings_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Widget [Responsive] is useful to give the SafeArea and MediaQuery widgets
/// as well as the Layoutbuilder which is useful for painting different
/// screen sizes
class Responsive extends ConsumerWidget {
  const Responsive({required this.mobile, this.tablet, super.key});

  final Widget mobile;
  final Widget? tablet;

  @override
  Widget build(BuildContext context, WidgetRef ref) => SafeArea(
        child: MediaQuery(
          data: const MediaQueryData().copyWith(
            textScaler: TextScaler.linear(
              ref.watch(settingsControllerProvider).textScaleFactor,
            ),
          ),
          child: LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return mobile;
            } else {
              return tablet ?? mobile;
            }
          }),
        ),
      );
}

Widget sizedBoxH10() {
  return const SizedBox(
    height: 10,
  );
}

Widget sizedBoxH20() {
  return const SizedBox(
    height: 20,
  );
}

Widget paddingH20() => const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
    );
