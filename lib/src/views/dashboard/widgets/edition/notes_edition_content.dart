import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:note_app/src/views/dashboard/widgets/edition/button_cancel_content.dart';

import 'package:note_app/src/views/dashboard/widgets/edition/button_save_content.dart';

class NoteEditionContent extends StatefulWidget {
  const NoteEditionContent({
    super.key,
    this.document,
    required this.editing,
  });
  final Document? document;
  final bool editing;
  @override
  State<NoteEditionContent> createState() => _NoteEditionContentState();
}

class _NoteEditionContentState extends State<NoteEditionContent> {
  late QuillController controller;
  @override
  void initState() {
    controller = QuillController(
      document: widget.document ?? Document(),
      selection: const TextSelection.collapsed(offset: 0),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Get.width < 600 ? _content() : Expanded(child: _content());
  }

  Widget _content() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: Column(
          children: [
            QuillToolbar.basic(
              controller: controller,
              showAlignmentButtons: false,
              showBackgroundColorButton: false,
              showCenterAlignment: false,
              showCodeBlock: false,
              showIndent: false,
              showLink: false,
              showDividers: false,
              showListCheck: false,
              showSearchButton: false,
              showHeaderStyle: false,
              showSubscript: false,
              showColorButton: false,
              showStrikeThrough: false,
              showUnderLineButton: false,
              showListNumbers: false,
              showInlineCode: false,
              showSuperscript: false,
              showQuote: false,
              showDirection: false,
              fontFamilyValues: const {
                "Poppins": "Poppins-Regular",
                "Inter": "Inter-Regular",
                "OpenSans": "OpenSans-Regular",
                "Roboto": "Roboto-Regular",
              },
            ),
            Expanded(
              child: QuillEditor.basic(
                textSelectionThemeData: TextSelectionThemeData(
                  cursorColor: Theme.of(context).primaryColor,
                ),
                controller: controller,
                readOnly: false,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SaveNoteButtonContent(controller: controller),
                const SizedBox(width: 10),
                const DiscardNoteButtonContent(),
              ],
            )
          ],
        ),
      );
}
