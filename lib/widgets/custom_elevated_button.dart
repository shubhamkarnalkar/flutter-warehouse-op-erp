import 'package:flutter/material.dart';
import 'base_button.dart';

class CustomElevatedButton extends BaseButton {
  const CustomElevatedButton(
      {super.key,
      this.decoration,
      this.leftIcon,
      this.rightIcon,
      super.margin,
      super.onPressed,
      super.buttonStyle,
      super.alignment,
      super.buttonTextStyle,
      super.isDisabled,
      super.height,
      super.width,
      required super.text});

  final BoxDecoration? decoration;

  final Widget? leftIcon;

  final Widget? rightIcon;

  Color? get buttonClr => null;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildElevatedButtonWidget(theme))
        : buildElevatedButtonWidget(theme);
  }

  Widget buildElevatedButtonWidget(ThemeData theme) => Container(
        height: height ?? 48,
        width: width ?? double.maxFinite,
        margin: margin,
        decoration: decoration,
        child: ElevatedButton(
          style: buttonStyle ??
              ElevatedButton.styleFrom(
                side: BorderSide(
                  width: 0.5,
                  color: theme.highlightColor,
                ),
              ),
          onPressed: isDisabled ?? false ? null : onPressed ?? () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leftIcon ?? const SizedBox.shrink(),
              Text(
                text,
                // style: buttonTextStyle ??
                //     const TextStyle(
                //       color: Colors.white,
                //     ),
              ),
              rightIcon ?? const SizedBox.shrink(),
            ],
          ),
        ),
      );
}
