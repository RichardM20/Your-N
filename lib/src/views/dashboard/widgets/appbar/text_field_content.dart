import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFormSearchContent extends StatelessWidget {
  const TextFormSearchContent({
    super.key,
    required this.borderStyle,
  });

  final OutlineInputBorder borderStyle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: TextFormField(
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            fillColor: Colors.white,
            border: borderStyle,
            enabledBorder: borderStyle,
            errorBorder: borderStyle,
            hintText: 'search'.tr,
            focusedBorder: borderStyle,
            filled: true,
            prefixIcon: const Icon(Icons.search),
            contentPadding: const EdgeInsets.symmetric(horizontal: 50),
          ),
        ),
      ),
    );
  }
}
