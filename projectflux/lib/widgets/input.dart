import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:projectgetx/utils/constants/Theme.dart';

class Input extends StatelessWidget {
  final String placeholder;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function()? onTap;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final bool autofocus;
  final Color borderColor;
  final TextInputType? textInputType;
  final TextInputFormatter? maskTextInputFormatter;
  final bool? obscureText;
  final String? Function(String?)? validator;
  const Input(
      {super.key,
      required this.placeholder,
      this.suffixIcon,
      this.prefixIcon,
      this.onTap,
      this.onChanged,
      this.autofocus = false,
      this.borderColor = NowUIColors.border,
      this.textInputType,
      this.maskTextInputFormatter,
      this.controller,
      this.validator,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      cursorColor: NowUIColors.muted,
      validator: validator,
      onTap: onTap,
      onChanged: onChanged,
      controller: controller,
      inputFormatters:
          maskTextInputFormatter != null ? [maskTextInputFormatter!] : null,
      keyboardType: textInputType,
      autofocus: autofocus,
      style: const TextStyle(
          height: 0.55, fontSize: 18.0, color: NowUIColors.time),
      textAlignVertical: const TextAlignVertical(y: 0.6),
      decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
              borderSide: const BorderSide(
                  color: NowUIColors.error,
                  width: 1.0,
                  style: BorderStyle.solid)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
              borderSide: const BorderSide(
                  color: NowUIColors.error,
                  width: 1.0,
                  style: BorderStyle.solid)),
          filled: true,
          fillColor: NowUIColors.white,
          hintStyle: const TextStyle(color: NowUIColors.time, fontSize: 15),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
              borderSide: BorderSide(
                  color: borderColor, width: 1.0, style: BorderStyle.solid)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
              borderSide: BorderSide(
                  color: borderColor, width: 1.0, style: BorderStyle.solid)),
          hintText: placeholder),
    );
  }
}
