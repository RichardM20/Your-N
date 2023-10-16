import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:note_app/src/controllers/dashboard_controller.dart';

import 'note_add_button_content.dart';
import 'note_information_content.dart';

class NoteListDataContent extends StatelessWidget {
  const NoteListDataContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AddNoteButtonContent(),
          NotesListContent(),
        ],
      ),
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
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            _controller.notesModel.length,
            (index) => MouseRegion(
              onEnter: (event) => onItemHover.value = index,
              onExit: (event) => onItemHover.value = -999,
              cursor: SystemMouseCursors.click,
              child: Obx(
                () => AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  decoration: BoxDecoration(
                    color: onItemHover.value == index ? Colors.white : Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: onItemHover.value == index
                        ? [
                            const BoxShadow(
                              blurRadius: 8,
                              color: Colors.black12,
                              offset: Offset(
                                0.0,
                                0.5,
                              ),
                            )
                          ]
                        : [],
                  ),
                  width: Get.width,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NoteInformationContent(index: index),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
