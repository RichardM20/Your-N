import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:note_app/src/app/theme/theme_app.dart';
import 'package:note_app/src/app/utils/preferences.dart';
import 'package:note_app/src/views/dashboard/dashboard_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('es', null);
  final prefs = Preferences();
  await prefs.initPrefs();

  //
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeApp.lightTheme,
      darkTheme: ThemeApp.darkTheme,
      title: 'Notes app',
      home: DashbaordView(),
    );
  }
}
