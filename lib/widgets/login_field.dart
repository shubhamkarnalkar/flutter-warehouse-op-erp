import 'package:flutter/material.dart';
import 'package:warehouse_erp/utils/color_pallet.dart';

class LoginField extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  const LoginField({
    super.key,
    required this.hintText,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(27),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Pallete.gradient2,
              width: 3,
            ),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
