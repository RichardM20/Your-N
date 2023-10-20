import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:note_app/src/controllers/dashboard_controller.dart';
import 'package:note_app/src/views/widgets/loading_hover.dart';

import 'widgets/appbar/profile_photo_content.dart';
import 'widgets/appbar/text_field_content.dart';
import 'widgets/edition/notes_edition_content.dart';
import 'widgets/notes/list_notes_content.dart';

class DashbaordView extends StatelessWidget {
  DashbaordView({super.key});

  final _controller = DashboardController.to;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 430,
        toolbarHeight: 90,
        leading: const TextFormSearchContent(),
        actions: const [
          ProfilePhotoContent(),
        ],
      ),
      body: Obx(
        () => _controller.isLoading.value
            ? const HoverLoading()
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                child: Row(
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
                      child: NoteEditionContent(),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
