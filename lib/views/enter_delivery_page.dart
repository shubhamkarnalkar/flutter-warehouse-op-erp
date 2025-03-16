import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:warehouse_erp/utils/utils.dart';
import 'package:warehouse_erp/widgets/custom_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EnterDeliveryPage extends StatefulHookConsumerWidget {
  const EnterDeliveryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EnterDeliveryPageState();
}

class _EnterDeliveryPageState extends ConsumerState<EnterDeliveryPage> {
  @override
  Widget build(BuildContext context) {
    final delContr = useTextEditingController();
    return Responsive(
      mobile: Scaffold(
        appBar: CustomAppBar(
          title: LangTextConstants.lbl_enter_delivery.tr,
        ),
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CustomTextFormField(
                controller: delContr,
                hintText: LangTextConstants.msg_enter_delivery_no.tr,
              ),
              sizedBoxH10(),
              CustomElevatedButton(
                text: LangTextConstants.lbl_ok.tr,
                //TODO Change
                onPressed: () =>
                    context.goNamed(RouteConstants.pickingOptionsPage),
              ),
              sizedBoxH10(),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    shape: BoxShape.rectangle,
                  ),
                ),
              ),
              // Expanded(
              //   child: RiveAnimation.asset(
              //     RivConstants.cartAnimation,
              //     fit: BoxFit.scaleDown,
              //   ),
              // ),
            ],
          ),
        ),
        // floatingActionButton: const CustomFAB(),
      ),
    );
  }
}
