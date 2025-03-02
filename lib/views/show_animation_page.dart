import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warehouse_erp/widgets/custom_widgets.dart';

import '../utils/utils.dart';

class ShowAnimationPage extends StatefulHookConsumerWidget {
  const ShowAnimationPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ShowAnimationPageState();
}

class _ShowAnimationPageState extends ConsumerState<ShowAnimationPage> {
  @override
  Widget build(BuildContext context) {
    final isAnimating = useState(false);
    return Responsive(
      mobile: Scaffold(
        appBar: CustomAppBar(
          hasBackButton: true,
          title: LangTextConstants.lbl_show_animation.tr,
        ),
        body: isAnimating.value == true
            ? const Loader()
            : ShowImagewidget(ref: ref),
        floatingActionButton: FloatingActionButton(
          child: isAnimating.value == true
              ? const Icon(Icons.pause_circle_filled)
              : const Icon(Icons.play_arrow_rounded),
          onPressed: () {
            isAnimating.value = !isAnimating.value;
            ref.read(loadingMessageProvider.notifier).state =
                LangTextConstants.lbl_welcome_back.tr;
          },
        ),
      ),
    );
  }
}

class ShowImagewidget extends StatelessWidget {
  const ShowImagewidget({
    super.key,
    required this.ref,
  });

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 350,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                shape: BoxShape.rectangle,
                border: Border.all(width: 2),
              ),
              child: CustomImageView(
                imagePath: RivConstants.littleBoy,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              ref.watch(loadingMessageProvider),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
