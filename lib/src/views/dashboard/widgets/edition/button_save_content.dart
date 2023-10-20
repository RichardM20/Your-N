import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:note_app/src/app/utils/date_format.dart';
import 'package:note_app/src/app/utils/font_app.dart';
import 'package:note_app/src/controllers/dashboard_controller.dart';
import 'package:note_app/src/models/note_model.dart';

class SaveNoteButtonContent extends StatelessWidget {
  const SaveNoteButtonContent({
    super.key,
    required this.controller,
  });

  final QuillController controller;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          overlayColor: MaterialStateColor.resolveWith(
            (states) => Theme.of(context).focusColor,
          ),
          backgroundColor: MaterialStateColor.resolveWith(
            (states) => Theme.of(context).primaryColor,
          )),
      onPressed: () {
        String preview = controller.document.toPlainText();
        String content = jsonEncode(controller.document.toDelta().toJson());
        if (DashboardController.to.editionState.value == "editing") {
          //
        } else {
          DashboardController.to.addNote(
            NoteDataModel(
              title: controller.document.root.children.first.toPlainText(),
              content: content,
              preview: preview,
              date: dateFormat(DateTime.now()),
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: RichText(
          text: TextSpan(
            text: 'Save note',
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
