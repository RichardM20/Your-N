import 'package:flutter/material.dart';

class NoteEditionContent extends StatelessWidget {
  const NoteEditionContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: const Column(
          children: [
            Row(
              children: [],
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
