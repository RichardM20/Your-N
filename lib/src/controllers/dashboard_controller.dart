import 'dart:convert';

import 'package:get/get.dart';
import 'package:note_app/src/app/utils/date_format.dart';
import 'package:note_app/src/app/utils/preferences.dart';
import 'package:note_app/src/models/note_model.dart';

class DashboardController extends GetxController {
  static DashboardController get to => Get.find<DashboardController>();
  final notesModel = RxList<NoteDataModel>();
  final isLoading = true.obs;
  final _prefs = Preferences();

  getData() async {
    addNote(
      NoteDataModel(
        content: 'Example ',
        date: dateFormat(
          DateTime.now().toLocal(),
        ),
        title: 'Example Title',
      ),
    );
    await Future.delayed(const Duration(milliseconds: 300));
    notesModel.clear();
    List data = jsonDecode(_prefs.getNotes);
    for (var element in data) {
      notesModel.add(NoteDataModel.fromJson(element));
    }
    isLoading.value = false;
  }

  deleteNote(int index) {
    List data = jsonDecode(_prefs.getNotes);
    data.removeAt(index);
    _prefs.addNote = jsonEncode(data);
    isLoading.value = true;

    getData();
  }

  addNote(NoteDataModel model) {
    List data = jsonDecode(_prefs.getNotes);
    data.add(model);
    _prefs.addNote = jsonEncode(data);
  }

  addfavorite(NoteDataModel model) {
    List data = jsonDecode(_prefs.getFavorite);
    data.add(model);
    _prefs.addfavorite = jsonEncode(data);
  }

  removeFavorite(int index) {
    List data = jsonDecode(_prefs.getFavorite);
    data.removeAt(index);
    _prefs.addfavorite = jsonEncode(data);
    isLoading.value = true;

    getData();
  }

  @override
  void onReady() {
    getData();
    super.onReady();
  }
}
