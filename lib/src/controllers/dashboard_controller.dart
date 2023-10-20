import 'dart:convert';

import 'package:get/get.dart';

import 'package:note_app/src/app/utils/preferences.dart';
import 'package:note_app/src/models/note_model.dart';

class DashboardController extends GetxController {
  static DashboardController get to => Get.find<DashboardController>();
  final notesModel = RxList<NoteDataModel>();
  final noteEdit = NoteDataModel().obs;
  final noteEditIndex = 9999.obs;
  final isLoading = true.obs;
  final _prefs = Preferences();
  RxBool isBold = false.obs;
  RxBool isItalic = false.obs;
  final familySelected = 'Inter'.obs;
  final editionState = 'waiting'.obs;
  RxDouble fontSizeSelected = 12.0.obs;

  getData() async {
    await Future.delayed(const Duration(milliseconds: 300));
    notesModel.clear();
    List data = jsonDecode(_prefs.getNotes);
    for (var element in data) {
      notesModel.add(NoteDataModel.fromJson(element));
    }
    if (notesModel.isEmpty) {
      editionState.value = 'empty';
    } else {
      editionState.value = 'waiting';
    }
    isLoading.value = false;
  }

  setEditNote(NoteDataModel model, int index) {
    noteEdit.value = model;
    noteEditIndex.value = index;
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
    getData();
  }

  updateNote(int index, NoteDataModel model) {
    List data = jsonDecode(_prefs.getFavorite);
    data.removeAt(index);
    data.add(model);
    _prefs.addNote = jsonEncode(data);
    getData();
  }

  addfavorite(NoteDataModel model) {
    List data = jsonDecode(_prefs.getFavorite);
    data.add(model);
    _prefs.addfavorite = jsonEncode(data);
  }

  removeFavorite(int index) {
    List data = jsonDecode(_prefs.getFavorite);
    data.removeAt(index);
    _prefs.addNote = jsonEncode(data);
    isLoading.value = true;

    getData();
  }

  @override
  void onReady() {
    getData();
    super.onReady();
  }
}
