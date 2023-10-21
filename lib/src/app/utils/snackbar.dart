import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/src/app/utils/font_app.dart';

class SnackbarService {
  static show({required String title, required String message}) => Get.snackbar(
        '',
        '',
        titleText: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontFamily: FontApp.boldStyle,
          ),
        ),
        messageText: Text(
          message,
          style: TextStyle(
            color: Colors.black,
            fontFamily: FontApp.mediumStyle,
          ),
        ),
        animationDuration: const Duration(milliseconds: 500),
        duration: const Duration(seconds: 1),
        margin: const EdgeInsets.all(20),
        onTap: (val) => Get.back(),
      );
}
