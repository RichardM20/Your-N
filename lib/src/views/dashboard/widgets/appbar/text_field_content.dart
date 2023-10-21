import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            cursorColor: Theme.of(context).appBarTheme.backgroundColor,
            decoration: InputDecoration(
              fillColor: Colors.white,
              border: borderStyle,
              enabledBorder: borderStyle,
              errorBorder: borderStyle,
              hintText: 'search'.tr,
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
