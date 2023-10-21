import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:note_app/src/app/theme/theme_app.dart';
import 'package:note_app/src/app/utils/preferences.dart';
import 'package:note_app/src/controllers/dashboard_controller.dart';
import 'package:note_app/src/views/dashboard/dashboard_view.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  await initializeDateFormatting('en', null);
  final prefs = Preferences();
  await prefs.initPrefs();
  Get.put(DashboardController());

  WindowOptions windowOptions = const WindowOptions(
    minimumSize: Size(400, 800),
    center: true,
    skipTaskbar: true,
    title: 'Yor NA',
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeApp.lightTheme,
      darkTheme: ThemeApp.darkTheme,
      title: 'Your NA',
      home: DashbaordView(),
    );
  }
}
