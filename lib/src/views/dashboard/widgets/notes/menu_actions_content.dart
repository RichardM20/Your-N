import 'package:flutter/material.dart';
import 'package:note_app/src/app/utils/font_app.dart';
import 'package:note_app/src/app/utils/snackbar.dart';
import 'package:note_app/src/controllers/dashboard_controller.dart';

// ignore: must_be_immutable
class NoteListMenuActionsContent extends StatelessWidget {
  NoteListMenuActionsContent({
    super.key,
    required this.noteIndex,
  });
  List actions = [
    {
      'name': 'starred',
      'icon': Icons.star_border_purple500_outlined,
      'color': Colors.blueAccent,
    },
    {
      'name': 'delete',
      'icon': Icons.delete_outlined,
      'color': Colors.red,
    }
  ];
  final int noteIndex;

  final _controller = DashboardController.to;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      tooltip: '',
      clipBehavior: Clip.none,
      offset: const Offset(-120, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      icon: Icon(
        Icons.more_vert_outlined,
        color: Theme.of(context).colorScheme.secondary,
      ),
      splashRadius: 0.5,
      itemBuilder: (context) => List.generate(
        actions.length,
        (index) => PopupMenuItem(
          onTap: () {
            _controller.deleteNote(noteIndex);
            SnackbarService.show(title: 'Success', message: 'Deleted note');
          },
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
