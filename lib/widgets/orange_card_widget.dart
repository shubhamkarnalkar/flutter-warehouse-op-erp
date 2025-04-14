import 'package:flutter/material.dart';
import 'package:warehouse_erp/utils/utils.dart';

class OrangeCardWidget extends StatelessWidget {
  const OrangeCardWidget({
    super.key,
    required this.context,
    required this.title,
    this.subtitle,
  });
  final BuildContext context;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        // horizontal: 12,
        vertical: 10,
      ),
      child: Card(
        color: Pallete.orange,
        borderOnForeground: true,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 63,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(ImageConstant.shipImg),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  // left: 14,
                  bottom: 27,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle ?? '',
                        style: Theme.of(context).textTheme.titleLarge,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OrangeIconCardWidgetForMobile extends StatelessWidget {
  const OrangeIconCardWidgetForMobile(
      {super.key,
      required this.context,
      this.icon,
      required this.title,
      required this.emoji});
  final IconData? icon;
  final BuildContext context;
  final String title;
  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: Card(
        color: Pallete.orange,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 60,
                child: CircleAvatar(
                  radius: 57,
                  backgroundColor: Colors.black,
                  child: Text(
                    emoji,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  // child: Icon(
                  //   icon,
                  //   size: 70,
                  //   color: Colors.black87,
                  // ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 2),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OrangeIconCardWidget extends StatelessWidget {
  const OrangeIconCardWidget(
      {super.key,
      required this.context,
      this.icon,
      required this.title,
      required this.emoji});
  final IconData? icon;
  final BuildContext context;
  final String title;
  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Pallete.orange,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: constraints.minWidth,
                  child: CircleAvatar(
                    radius: constraints.minWidth - 3,
                    backgroundColor: Colors.white10,
                    child: Text(
                      emoji,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    // child: Icon(
                    //   icon,
                    //   size: constraints.minWidth - 50,
                    //   color: Colors.black87,
                    // ),
                  ),
                ),
              );
            }),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
