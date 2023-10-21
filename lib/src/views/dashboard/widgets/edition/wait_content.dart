import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note_app/src/app/utils/font_app.dart';

class WaitContent extends StatelessWidget {
  const WaitContent({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 1.0, end: 0.0),
      duration: const Duration(milliseconds: 250),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0.0, -100 * value),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children:
                      "Hello\nPlease note the following when using Your NA.\n- Before editing or creating a new note if you currently have one open, you must discard it to be able to edit or create a new one.\n- The first line of your note will be considered as the note's title."
                          .split('\n')
                          .map((line) {
                    if (line == "Hello") {
                      return TextSpan(
                        text: "$line\n\n",
                        style: TextStyle(
                          fontFamily: FontApp.mediumStyle,
                          fontSize: 18,
                          color: Theme.of(context).primaryColor,
                        ),
                      );
                    } else {
                      return TextSpan(
                        text: '$line\n',
                        style: TextStyle(
                          fontFamily: FontApp.regularStyle,
                          fontSize: 14,
                          color: Theme.of(context).primaryColor,
                        ),
                      );
                    }
                  }).toList(),
                ),
              ),
              const SizedBox(height: 5),
              SvgPicture.asset(
                'assets/icons/winking-icon.svg',
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
