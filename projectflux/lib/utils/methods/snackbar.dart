import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectgetx/utils/constants/Theme.dart';

showWarningSnackbar() {
  if (!Get.isSnackbarOpen) {
    return Get.snackbar(
      "Aviso", // Title of the Snackbar
      "Preencha os campos obrigatórios!", // Message content
      backgroundColor: NowUIColors.warning,
      colorText: NowUIColors.white,
      snackPosition: SnackPosition.BOTTOM, // Position of the Snackbar
      icon:
          const Icon(Icons.warning, color: NowUIColors.white), // Optional icon
      duration: const Duration(seconds: 3), // Duration of the Snackbar
      borderRadius: 8,
      margin: const EdgeInsets.all(10),
    );
  }
}
