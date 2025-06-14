import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'constants/app_constants.dart';
import 'package:rive/rive.dart' as rive;

final loadingMessageProvider = StateProvider.autoDispose<String>((ref) {
  return 'Click on Play Button to Start';
});

class Loader extends ConsumerStatefulWidget {
  const Loader({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoaderState();
}

class _LoaderState extends ConsumerState<Loader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
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
                  borderRadius: BorderRadius.circular(20),
                  shape: BoxShape.rectangle,
                ),
                // child: CustomImageView(
                //   imagePath: RivConstants.earthAnim,
                // ),
                child: rive.RiveAnimation.asset(
                  RivConstants.vehicles,
                  fit: BoxFit.contain,
                ),
                // child: const rive.RiveAnimation.network(
                //     'https://cdn.rive.app/animations/vehicles.riv'),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                ref.watch(loadingMessageProvider),
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
