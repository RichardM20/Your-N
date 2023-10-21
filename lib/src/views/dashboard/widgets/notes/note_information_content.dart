import 'package:flutter/material.dart';
import 'package:note_app/src/app/utils/font_app.dart';
import 'package:note_app/src/models/note_model.dart';

import 'menu_actions_content.dart';

class NoteInformationContent extends StatelessWidget {
  const NoteInformationContent({
    super.key,
    required this.index,
    required this.model,
  });

  final int index;
  final NoteDataModel model;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "${model.title}\n",
                  style: TextStyle(
                    fontFamily: FontApp.mediumStyle,
                    color: Theme.of(context).primaryColor,
                    height: 0.8,
                    fontSize: 18,
                  ),
                ),
                WidgetSpan(
                    child: SizedBox(
                  child: Text(
                    model.preview.toString().trim().replaceAll("\n", ''),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: FontApp.regularStyle,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                )),
                TextSpan(
                  text: '\n\n${model.date}',
                  style: TextStyle(
                    fontFamily: FontApp.regularStyle,
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
        NoteListMenuActionsContent(
          noteIndex: index,
        )
      ],
    );
  }
}
