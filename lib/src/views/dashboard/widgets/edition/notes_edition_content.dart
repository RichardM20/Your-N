import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:note_app/src/app/utils/font_app.dart';
import 'package:note_app/src/controllers/dashboard_controller.dart';
import 'package:note_app/src/views/dashboard/widgets/edition/button_save_content.dart';

class NoteEditionContent extends StatelessWidget {
  NoteEditionContent({
    super.key,
  });
  final QuillController controller = QuillController.basic();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Column(
        children: [
          QuillToolbar.basic(
            controller: controller,
            fontFamilyValues: const {
              "Poppins": "Poppins-Regular",
              "Inter": "Inter-Regular",
              "OpenSans": "OpenSans-Regular",
              "Roboto": "Roboto-Regular",
            },
          ),
          Expanded(
            child: QuillEditor.basic(
              controller: controller,
              readOnly: false,
            ),
          ),
          SaveNoteButtonContent(controller: controller)
        ],
      ),
    );
  }
}
