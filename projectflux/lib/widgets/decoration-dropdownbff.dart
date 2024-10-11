// InputDecoration(
//             filled: true,
//             fillColor: NowUIColors.white,
//             hintStyle: const TextStyle(
//               color: NowUIColors.time,
//             ),
//             suffixIcon: suffixIcon,
//             prefixIcon: prefixIcon,
//             enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(32.0),
//                 borderSide: BorderSide(
//                     color: borderColor, width: 1.0, style: BorderStyle.solid)),
//             focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(32.0),
//                 borderSide: BorderSide(
//                     color: borderColor, width: 1.0, style: BorderStyle.solid)),
//             hintText: placeholder)

import 'package:flutter/material.dart';
import 'package:projectgetx/utils/constants/Theme.dart';

InputDecoration customInputDecoration({
  required String placeholder,
  // String? placeholder,
  // IconData? prefixIcon,
  // String? helperText,
  // String? errorText,
  Color borderColor = NowUIColors.border,
}) {
  return InputDecoration(
      filled: true,
      fillColor: NowUIColors.white,
      hintStyle: const TextStyle(
          height: 0.55, fontSize: 13.0, color: NowUIColors.time),
      // suffixIcon: suffixIcon,
      // prefixIcon: prefixIcon,
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
          borderSide: const BorderSide(
              color: NowUIColors.inputError,
              width: 1.0,
              style: BorderStyle.solid)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
          borderSide: const BorderSide(
              color: NowUIColors.inputError,
              width: 1.0,
              style: BorderStyle.solid)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
          borderSide: BorderSide(
              color: borderColor, width: 1.0, style: BorderStyle.solid)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
          borderSide: BorderSide(
              color: borderColor, width: 1.0, style: BorderStyle.solid)),
      hintText: placeholder,
      labelStyle: const TextStyle(
          height: 0.55, fontSize: 13.0, color: NowUIColors.time));
}
