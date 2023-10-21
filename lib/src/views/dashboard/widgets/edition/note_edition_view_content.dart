import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:note_app/src/controllers/dashboard_controller.dart';
import 'package:note_app/src/views/dashboard/widgets/edition/empy_notes_content.dart';
import 'package:note_app/src/views/dashboard/widgets/edition/notes_edition_content.dart';

import 'wait_content.dart';

class NoteEditionViewContent extends StatelessWidget {
  NoteEditionViewContent({super.key});
  final dashboardController = DashboardController.to;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (dashboardController.editionState.value == 'empty')
            const EmptyNotesContent(),
          if (dashboardController.editionState.value == 'waiting')
            const WaitContent(),
          if (dashboardController.editionState.value == 'editing')
            NoteEditionContent(
              editing: true,
              document: Document.fromJson(
                jsonDecode(
                  dashboardController.noteEdit.value.content.toString(),
                ),
              ),
            ),
          if (dashboardController.editionState.value == "new")
            const NoteEditionContent(
              editing: false,
            ),
        ],
      ),
    );
  }
}
