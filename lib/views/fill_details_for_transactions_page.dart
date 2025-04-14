import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:warehouse_erp/utils/utils.dart';
import 'package:warehouse_erp/widgets/custom_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// [FillDetailsForTransactionsPage] is a starting point for any transaction
class FillDetailsForTransactionsPage extends StatefulHookConsumerWidget {
  final String name;

  const FillDetailsForTransactionsPage({super.key, required this.name});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EnterDeliveryPageState();
}

class _EnterDeliveryPageState
    extends ConsumerState<FillDetailsForTransactionsPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final delContr = useTextEditingController();
    return Responsive(
      mobile: _Mob(
        widget: widget,
        delContr: delContr,
        theme: theme,
      ),
      tablet: _Tab(
        widget: widget,
        delContr: delContr,
        theme: theme,
      ),
    );
  }
}

class _Mob extends StatelessWidget {
  const _Mob(
      {required this.widget, required this.delContr, required this.theme});

  final FillDetailsForTransactionsPage widget;
  final TextEditingController delContr;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.name,
      ),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            CustomTextFormField(
              controller: delContr,
              hintText: LangTextConstants.msg_enter_delivery_no.tr,
            ),
            CustomElevatedButton(
              text: LangTextConstants.lbl_ok.tr,
              //TODO Change
              onPressed: () => {},
            ),
          ],
        ),
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  const _Tab(
      {required this.widget, required this.delContr, required this.theme});

  final FillDetailsForTransactionsPage widget;
  final TextEditingController delContr;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.name,
      ),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Card(
          color: theme.canvasColor,
          child: Column(
            children: [
              CustomTextFormField(
                controller: delContr,
                hintText: LangTextConstants.msg_enter_delivery_no.tr,
              ),
              CustomElevatedButton(
                text: LangTextConstants.lbl_ok.tr,
                //TODO Change
                onPressed: () => {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
