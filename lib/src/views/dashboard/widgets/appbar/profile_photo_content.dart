import 'package:flutter/material.dart';

class ProfilePhotoContent extends StatelessWidget {
  const ProfilePhotoContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(right: 30),
        child: Row(
          children: [
            const Text("Hi, name"),
            const SizedBox(width: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(
                height: 60,
                width: 60,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
