import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:note_app/src/app/utils/font_app.dart';
import 'package:note_app/src/controllers/dashboard_controller.dart';

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
                text: "${_controller.notesModel[index].title}\n",
                style: TextStyle(
                  fontFamily: FontApp.mediumStyle,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              WidgetSpan(
                  child: SizedBox(
                width: Get.width * 0.1,
                child: Text(
                  _controller.notesModel[index].preview
                      .toString()
                      .trim()
                      .replaceAll("\n", ''),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: FontApp.regularStyle,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ))
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            NoteListMenuActionsContent(
              noteIndex: index,
            ),
            Text(
              _controller.notesModel[index].date ?? "",
              style: TextStyle(
                fontFamily: FontApp.regularStyle,
                color: Theme.of(context).colorScheme.secondary,
              ),
            )
          ],
        )
      ],
    );
  }
}
