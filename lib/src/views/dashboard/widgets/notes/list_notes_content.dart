import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

import 'package:note_app/src/controllers/dashboard_controller.dart';
import 'package:note_app/src/views/dashboard/widgets/edition/empy_notes_content.dart';
import 'package:note_app/src/views/dashboard/widgets/edition/notes_edition_content.dart';

import 'item_list_content.dart';
import 'note_add_button_content.dart';

class NoteListDataContent extends StatelessWidget {
  const NoteListDataContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AddNoteButtonContent(),
        NotesListContent(),
      ],
    );
  }
}

// ignore: must_be_immutable
class NotesListContent extends StatelessWidget {
  NotesListContent({
    super.key,
  });

  final _controller = DashboardController.to;
  RxInt onItemHover = 999.obs;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Get.width < 600 && _controller.notesModel.isEmpty
          ? const Center(
              child: EmptyNotesContent(),
            )
          : Obx(
              () {
                final notesSearch = _controller.notesModel
                    .where(
                      (note) => note.title!.toLowerCase().contains(
                            _controller.filtered.value,
                          ),
                    )
                    .toList();
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                  itemCount: notesSearch.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      overlayColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.transparent,
                      ),
                      onTap: () {
                        _ontap(context, notesSearch[index], index);
                      },
                      onHover: (isHover) {
                        if (isHover == true) {
                          onItemHover.value = index;
                        } else {
                          onItemHover.value = -999;
                        }
                      },
                      mouseCursor: SystemMouseCursors.click,
                      child: ItemListNotesContent(
                        index: index,
                        model: notesSearch[index],
                        onItemHover: onItemHover,
                      ),
                    );
                  },
                );
              },
            ),
    );
  }

  void _ontap(context, note, index) {
    _controller.editionState.value = 'editing';
    _controller.setEditNote(note, index);
    if (Get.width < 600) {
      showModalBottomSheet(
        context: context,
        enableDrag: true,
        useSafeArea: true,
        isScrollControlled: true,
        builder: (context) => NoteEditionContent(
          document: Document.fromJson(
            jsonDecode(
              _controller.noteEdit.value.content.toString(),
            ),
          ),
          editing: true,
        ),
      );
    }
  }
}
