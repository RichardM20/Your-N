import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/src/models/note_model.dart';

import 'note_information_content.dart';

class ItemListNotesContent extends StatelessWidget {
  const ItemListNotesContent({super.key, required this.onItemHover, required this.index, required this.model});
  final RxInt onItemHover;
  final int index;
  final NoteDataModel model;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
          color: onItemHover.value == index ? Theme.of(context).colorScheme.background : Theme.of(context).scaffoldBackgroundColor,
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
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NoteInformationContent(
              index: index,
              model: model,
            ),
          ],
        ),
      ),
    );
  }
}
