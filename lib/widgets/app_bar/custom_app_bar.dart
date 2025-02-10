import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.height,
      this.leadingWidth,
      this.leading,
      this.title,
      this.centerTitle,
      this.actions,
      this.hasBackButton});

  final double? height;

  final double? leadingWidth;

  final Widget? leading;

  final String? title;

  final bool? centerTitle;

  final List<Widget>? actions;

  final bool? hasBackButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: (hasBackButton ?? true) ? leading : const SizedBox(),
      centerTitle: true,
      // leading: const Icon(Icons.arrow_back_ios),
      title: Text(title ?? ''),
    );
  }

  @override
  Size get preferredSize => Size(
        25,
        height ?? 50,
      );
}
