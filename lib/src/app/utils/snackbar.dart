import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarService {
  static show({required String title, required String message}) => Get.snackbar(
        title,
        message,
        animationDuration: const Duration(milliseconds: 500),
        duration: const Duration(seconds: 1),
        margin: const EdgeInsets.all(20),
        onTap: (val) => Get.back(),
      );
}
