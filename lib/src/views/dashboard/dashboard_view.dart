import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:note_app/src/controllers/dashboard_controller.dart';
import 'package:note_app/src/views/dashboard/widgets/devices/ipds_dektop_view.dart';
import 'package:note_app/src/views/dashboard/widgets/devices/mobile_view.dart';

import 'package:note_app/src/views/widgets/loading_hover.dart';

import 'widgets/appbar/profile_photo_content.dart';
import 'widgets/appbar/text_field_content.dart';

class DashbaordView extends StatelessWidget {
  DashbaordView({super.key});

  final _controller = DashboardController.to;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        centerTitle: false,
        title: const TextFormSearchContent(),
        actions: const [
          ProfilePhotoContent(),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        child: Obx(
          () => _controller.isLoading.value
              ? const HoverLoading()
              : LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth < 600) {
                      return const MobileDeviceView();
                    } else {
                      return const DesktopDevicesView();
                    }
                  },
                ),
        ),
      ),
    );
  }
}
