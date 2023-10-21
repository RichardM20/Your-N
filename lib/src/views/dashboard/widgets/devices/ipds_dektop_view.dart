import 'package:flutter/material.dart';
import 'package:note_app/src/views/dashboard/widgets/edition/note_edition_view_content.dart';
import 'package:note_app/src/views/dashboard/widgets/notes/list_notes_content.dart';

class DesktopDevicesView extends StatelessWidget {
  const DesktopDevicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          flex: 1,
          child: NoteListDataContent(),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: NoteEditionViewContent(),
        ),
      ],
    );
  }
}
