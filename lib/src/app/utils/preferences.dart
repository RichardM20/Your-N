import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences extends ChangeNotifier {
  static final Preferences _instance = Preferences._internal();
  factory Preferences() {
    return _instance;
  }

  Preferences._internal();
  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  set addNote(String note) => _prefs.setString('notes_data', note);
  get getNotes => _prefs.getString('notes_data') ?? '[]';

  set addfavorite(String note) => _prefs.setString('favorite_notes', note);
  get getFavorite => _prefs.getString('favorite_notes') ?? '[]';
}
