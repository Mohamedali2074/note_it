// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.controller,
    this.validator,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    required bool obscureText,
    required this.hintText,
    required this.style,
    this.hintStyle,
    this.maxLines = 1, this.onSaved,
  }) : super(key: key);
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final bool obscureText = false;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final TextStyle? hintStyle;
  final TextStyle style;
  final int? maxLines;
  final void Function(String?)? onSaved;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      maxLines: maxLines,
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      cursorColor: Colors.black,
      style: style,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: hintStyle,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.black),
    );
  }
}
