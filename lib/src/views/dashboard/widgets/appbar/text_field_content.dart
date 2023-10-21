import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/src/app/utils/font_app.dart';
import 'package:note_app/src/controllers/dashboard_controller.dart';

class TextFormSearchContent extends StatelessWidget {
  const TextFormSearchContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final borderStyle = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(100),
    );
    return LayoutBuilder(
      builder: (context, constraints) {
        double containerWidth = constraints.maxWidth / 2.7;
        return Container(
          width: containerWidth,
          constraints: const BoxConstraints(minWidth: 250),
          padding: const EdgeInsets.only(left: 20),
          child: TextFormField(
            textInputAction: TextInputAction.search,
            style: TextStyle(
              color: Colors.black,
              fontFamily: FontApp.mediumStyle,
            ),
            onChanged: (value) {
              DashboardController.to.filtered.value = value.toLowerCase();
              DashboardController.to.notesModel.refresh();
            },
            cursorColor: Theme.of(context).appBarTheme.backgroundColor,
            decoration: InputDecoration(
              fillColor: Colors.white,
              border: borderStyle,
              enabledBorder: borderStyle,
              errorBorder: borderStyle,
              hintText: 'search'.tr,
              hintStyle: TextStyle(color: Colors.grey, fontFamily: FontApp.mediumStyle),
              focusedBorder: borderStyle,
              filled: true,
              prefixIcon: Icon(
                Icons.search,
                color: Theme.of(context).appBarTheme.backgroundColor,
              ),
              focusColor: Theme.of(context).appBarTheme.backgroundColor,
              contentPadding: const EdgeInsets.symmetric(horizontal: 50),
            ),
          ),
        );
      },
    );
  }
}
