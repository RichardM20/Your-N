import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note_app/src/app/utils/font_app.dart';

class EmptyNotesContent extends StatelessWidget {
  const EmptyNotesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 1.0, end: 0.0),
      duration: const Duration(milliseconds: 250),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0.0, 100 * value),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "You don't have notes yet",
                style: TextStyle(
                  fontFamily: FontApp.mediumStyle,
                  fontSize: 14,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(height: 20),
              SvgPicture.asset(
                'assets/icons/sad-icon.svg',
                color: Theme.of(context).primaryColor,
                height: 35,
              ),
            ],
          ),
        );
      },
    );
  }
}
