import 'package:flutter/material.dart';

class CustomSearchView extends StatelessWidget {
  const CustomSearchView(
      {super.key,
      this.alignment,
      this.width,
      this.scrollPadding,
      this.controller,
      this.focusNode,
      this.autofocus = false,
      this.textStyle,
      this.textInputType = TextInputType.text,
      this.maxLines,
      this.hintText,
      this.hintStyle,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints,
      this.contentPadding,
      this.borderDecoration,
      this.fillColor,
      this.filled = false,
      this.validator,
      this.onChanged});

  final Alignment? alignment;

  final double? width;

  final TextEditingController? scrollPadding;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final FormFieldValidator<String>? validator;

  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: searchViewWidget(context))
        : searchViewWidget(context);
  }

  Widget searchViewWidget(BuildContext context) => SizedBox(
        width: width ?? double.maxFinite,
        child: TextFormField(
          controller: controller,
          focusNode: focusNode,
          onTapOutside: (event) {
            if (focusNode != null) {
              focusNode?.unfocus();
            } else {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          autofocus: autofocus!,
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          decoration: decoration,
          validator: validator,
          onChanged: (String value) {
            onChanged?.call(value);
          },
        ),
      );
  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "",
        prefixIcon: Padding(
          padding: const EdgeInsets.all(
            15,
          ),
          child: Icon(
            Icons.search,
            color: Colors.grey.shade600,
          ),
        ),
        prefixIconConstraints: prefixConstraints ??
            const BoxConstraints(
              maxHeight: 51,
            ),
        suffixIcon: suffix ??
            Padding(
              padding: const EdgeInsets.only(
                right: 15,
              ),
              child: IconButton(
                onPressed: () => controller!.clear(),
                icon: Icon(
                  Icons.clear,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
        suffixIconConstraints: suffixConstraints ??
            const BoxConstraints(
              maxHeight: 51,
            ),
        isDense: true,
        contentPadding: contentPadding ?? const EdgeInsets.all(16),
        fillColor: fillColor,
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                width: 1,
              ),
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                width: 1,
              ),
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                width: 1,
              ),
            ),
      );
}
