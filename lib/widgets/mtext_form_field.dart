import 'package:flutter/material.dart';
import 'package:inventory_management_app/apptheme.dart';

class MTextFormFieldColumn extends StatelessWidget {
  const MTextFormFieldColumn({
    super.key,
    required this.border,
    required this.hintText,
    required this.controller,
    required this.validator,
  });

  final OutlineInputBorder border;
  final String hintText;
  final TextEditingController controller;
  final Function validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          style: const TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
          ),
          // minLines: 6,
          controller: controller,
          validator: (value) {
            return validator(value);
          },
          cursorColor: Apptheme.primary,
          cursorErrorColor: Apptheme.primary,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontFamily: "Poppins",
              fontSize: 16,
              // color: Apptheme.grey,
              color: Apptheme.dark.withOpacity(0.5),
              fontWeight: FontWeight.w500,
            ),
            enabledBorder: border,
            focusedBorder: border,
            errorBorder: border,
            focusedErrorBorder: border,
            filled: true,
            // fillColor: const Color(0xbfF7F7F8),
            fillColor: const Color.fromARGB(104, 231, 231, 243),
            contentPadding: const EdgeInsets.all(
              19,
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
