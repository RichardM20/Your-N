import 'package:flutter/material.dart';
import 'package:note_app/src/app/utils/font_app.dart';
import 'package:note_app/src/controllers/node_controller.dart';

import 'menu_actions_content.dart';

class NoteInformationContent extends StatelessWidget {
  NoteInformationContent({
    super.key,
    required this.index,
  });

  final int index;
  final _controller = DashboardController.to;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "${_controller.notesModel[index].title}\n\n",
                style: TextStyle(
                  fontFamily: FontApp.mediumStyle,
                ),
              ),
              TextSpan(
                text: _controller.notesModel[index].content,
                style: TextStyle(
                  fontFamily: FontApp.regularStyle,
                ),
              )
            ],
          ),
        ),
        NoteListMenuActionsContent()
      ],
    );
  }
}
