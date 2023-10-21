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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset('assets/img/note-icon.png'),
        ),
      ),
    );
  }
}
