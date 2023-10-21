import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/src/app/utils/font_app.dart';
import 'package:note_app/src/controllers/dashboard_controller.dart';
import 'package:note_app/src/views/dashboard/widgets/edition/notes_edition_content.dart';

class AddNoteButtonContent extends StatelessWidget {
  const AddNoteButtonContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 60,
      minWidth: Get.width,
      elevation: 0.0,
      animationDuration: const Duration(milliseconds: 500),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Theme.of(context).primaryColor,
      onPressed: () {
        if (Get.width < 600) {
          showBottomSheet(
            context: context,
            builder: (context) => const NoteEditionContent(
              editing: false,
            ),
          );
        }
        DashboardController.to.editionState.value = "new";
      },
      child: Text(
        "New note".tr,
        style: TextStyle(
          fontFamily: FontApp.mediumStyle,
          color: Colors.white,
          fontSize: 24,
        ),
      ),
    );
  }
}
