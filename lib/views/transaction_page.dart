import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warehouse_erp/utils/utils.dart';
import 'package:warehouse_erp/widgets/custom_widgets.dart';

class TransactionPage extends StatefulHookConsumerWidget {
  const TransactionPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TransactionPageState();
}

class _TransactionPageState extends ConsumerState<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Scaffold(
        appBar: CustomAppBar(
          title: LangTextConstants.lbl_transactions.tr,
          hasBackButton: false,
        ),
        body: Column(
          children: [
            InkWell(
              onTap: () {},
              child: OrangeIconCardWidget(
                  context: context,
                  title: LangTextConstants.lbl_pick.tr,
                  icon: Icons.shopping_cart),
            )
          ],
        ),
      ),
    );
  }
}
