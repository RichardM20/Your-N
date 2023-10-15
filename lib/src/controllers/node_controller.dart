import 'dart:convert';

import 'package:get/get.dart';
import 'package:note_app/src/models/note_model.dart';

class DashboardController extends GetxController {
  static DashboardController get to => Get.find<DashboardController>();
  final notesModel = RxList<NoteDataModel>();
  final isLoading = true.obs;
  List<Map<String, dynamic>> notes = [
    {
      "title": "Example",
      "content": "Content example",
      "date": "a",
    },
    {
      "title": "Example",
      "content": "Content example",
      "date": "a",
    },
    {
      "title": "Example",
      "content": "Content example",
      "date": "a",
    },
    {
      "title": "Example",
      "content": "Content example",
      "date": "a",
    }
  ];

  getData() async {
    await Future.delayed(const Duration(seconds: 2));
    for (var element in notes) {
      notesModel.add(NoteDataModel.fromJson(element));
    }
    isLoading.value = false;
  }

  @override
  void onReady() {
    getData();
    super.onReady();
  }
}
