import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

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
    print("document:${widget.document}");
    super.initState();
  }

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
