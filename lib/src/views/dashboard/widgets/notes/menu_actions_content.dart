import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/src/app/utils/font_app.dart';

class NoteListMenuActionsContent extends StatelessWidget {
  NoteListMenuActionsContent({
    super.key,
  });
  List actions = [
    {
      'name': 'started',
      'icon': Icons.star_border_purple500_outlined,
      'color': Colors.blueAccent,
    },
    {
      'name': 'delete',
      'icon': Icons.delete_outlined,
      'color': Colors.red,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      clipBehavior: Clip.none,
      offset: const Offset(-120, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      tooltip: 'show_menu_options'.tr,
      itemBuilder: (context) => List.generate(
        actions.length,
        (index) => PopupMenuItem(
          child: Row(
            children: [
              Icon(actions[index]['icon'], color: actions[index]['color']),
              const SizedBox(width: 20),
              Text(
                actions[index]['name'],
                style: TextStyle(
                  fontFamily: FontApp.regularStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
