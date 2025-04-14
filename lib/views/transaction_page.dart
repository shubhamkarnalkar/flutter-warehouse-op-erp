import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warehouse_erp/utils/utils.dart';
import 'package:warehouse_erp/widgets/custom_widgets.dart';

class TransactionPage extends ConsumerWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Responsive(
      mobile: _Mob(),
      tablet: _Tab(),
    );
  }
}

class _Mob extends StatelessWidget {
  const _Mob();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LangTextConstants.lbl_transactions.tr,
        hasBackButton: false,
      ),

      // New one
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Desired card size
          final cardWidth = constraints.maxWidth;
          const cardHeight = 150.0;

          // Calculate how many cards fit in the current width
          final crossAxisCount = (constraints.maxWidth / cardWidth).floor();

          // Aspect ratio = width / height
          final aspectRatio = cardWidth / cardHeight;

          return GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount > 0 ? crossAxisCount : 1,
              childAspectRatio: aspectRatio,
            ),
            children: [
              for (final trans in transactions)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () async {
                      context.goNamed(
                        RouteConstants.fillDetailsForTransactionsPage,
                        pathParameters: <String, String>{'name': trans.name},
                      );
                    },
                    child: OrangeIconCardWidgetForMobile(
                      context: context,
                      title: trans.name,
                      icon: trans.icondata,
                      emoji: trans.emoji,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  const _Tab();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LangTextConstants.lbl_transactions.tr,
        hasBackButton: kIsWeb ? false : true,
      ),

      // New one
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Desired card size
          const cardWidth = 300.0;
          const cardHeight = 130.0;

          // Calculate how many cards fit in the current width
          final crossAxisCount = (constraints.maxWidth / cardWidth).floor();

          // Aspect ratio = width / height
          const aspectRatio = cardWidth / cardHeight;

          return GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount > 0 ? crossAxisCount : 1,
              childAspectRatio: aspectRatio,
            ),
            children: [
              for (final trans in transactions)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () async {
                      context.goNamed(
                        RouteConstants.fillDetailsForTransactionsPage,
                        pathParameters: <String, String>{'name': trans.name},
                      );
                    },
                    child: OrangeIconCardWidget(
                      context: context,
                      title: trans.name,
                      icon: trans.icondata,
                      emoji: trans.emoji,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

// TODO lang
final List<Transaction> transactions = [
  Transaction(name: 'Packing', icondata: Icons.shopping_bag, emoji: '🎁'),
  Transaction(
      name: LangTextConstants.lbl_pick.tr,
      icondata: Icons.shopping_cart,
      emoji: '📦'),
  Transaction(name: 'Shipping', icondata: Icons.local_shipping, emoji: '🚚'),
  Transaction(
      name: 'Arrival', icondata: Icons.directions_transit_filled, emoji: '📬'),
];

class Transaction {
  final String name;
  String? payload;
  String? url;
  final IconData icondata;
  final String emoji;

  Transaction(
      {required this.name, required this.icondata, required this.emoji});
}
