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
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
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
      ),
    );
  }
}
