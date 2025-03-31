import 'package:flutter/material.dart';

class AdaptiveCard extends StatelessWidget {
  const AdaptiveCard({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final typography = theme.textTheme;
    final colors = theme.colorScheme;
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: typography.bodyLarge!.copyWith(
                color: colors.tertiary,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
          ),
          Expanded(
            child: Text(
              subtitle,
              style: typography.bodyMedium!.copyWith(
                color: colors.primary,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}

class AdaptiveCards extends StatelessWidget {
  const AdaptiveCards(
      {super.key, required this.cards, required this.cardWidth});

  final List<Widget> cards;
  final double cardWidth;

  @override
  Widget build(BuildContext context) {
    final itemSize = Size(cardWidth, 100);
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final crossAxisCount = (width / itemSize.width).floor();
        // final childAspectRatio = width / (crossAxisCount * itemSize.width);
        const childAspectRatio = 2 / 1;
        return GridView.count(
          padding: const EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          childAspectRatio: childAspectRatio,
          children: [
            for (final card in cards) SizedBox(width: cardWidth, child: card),
          ],
        );
      },
    );
  }
}
