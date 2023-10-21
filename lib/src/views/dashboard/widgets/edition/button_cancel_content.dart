import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/src/app/utils/font_app.dart';
import 'package:note_app/src/controllers/dashboard_controller.dart';

class DiscardNoteButtonContent extends StatelessWidget {
  const DiscardNoteButtonContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          overlayColor: MaterialStateColor.resolveWith(
            (states) => Colors.white30,
          ),
          backgroundColor: MaterialStateColor.resolveWith(
            (states) => Theme.of(context).colorScheme.error,
          )),
      onPressed: () {
        if (Get.width < 600) {
          Get.back();
        }
        DashboardController.to.editionState.value = "waiting";
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: RichText(
          text: TextSpan(
            text: 'Discard',
            style: TextStyle(
              color: Colors.white,
              fontFamily: FontApp.boldStyle,
            ),
          ),
        ),
      ),
    );
  }
}
